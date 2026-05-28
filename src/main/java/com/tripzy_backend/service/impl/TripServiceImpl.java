package com.tripzy_backend.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tripzy_backend.dto.request.CreateTripRequest;
import com.tripzy_backend.entity.Trip;
import com.tripzy_backend.entity.User;
import com.tripzy_backend.repository.TripRepository;
import com.tripzy_backend.repository.UserRepository;
import com.tripzy_backend.service.AIService;
import com.tripzy_backend.service.TripService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TripServiceImpl implements TripService {

    private final TripRepository tripRepository;
    private final UserRepository userRepository;
    private final AIService aiService;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public Trip createTrip(CreateTripRequest request, String email) {

        // FIND USER
        User user = userRepository.findByEmail(email);
        if (user == null) {
            throw new RuntimeException("User not found");
        }

        // CREATE TRIP
        Trip trip = Trip.builder()
                .source(request.getSource())
                .destination(request.getDestination())
                .days(request.getDays())
                .budget(request.getBudget())
                .interests(request.getInterests())
                .transportation(request.getTransportation())
                .accommodation(request.getAccommodation())
                .startDate(request.getStartDate())
                .endDate(request.getEndDate())
                .travelers(request.getTravelers())
                .user(user)
                .build();

        // GENERATE AI ITINERARY
        String itinerary = aiService.generateItinerary(
                trip.getSource(),
                trip.getDestination(),
                trip.getDays(),
                trip.getBudget(),
                trip.getInterests(),
                trip.getTransportation(),
                trip.getAccommodation(),
                trip.getStartDate().toString(),
                trip.getEndDate().toString(),
                trip.getTravelers()
        );

        // ✅ Validate JSON is inside the method
        try {
            objectMapper.readTree(itinerary);
            trip.setItinerary(itinerary);
        } catch (Exception e) {
            throw new RuntimeException("Invalid JSON returned from AI: " + e.getMessage());
        }

        // SAVE TRIP
        return tripRepository.save(trip);
    }

    @Override
    public List<Trip> getUserTrips(String email) {

        User user = userRepository.findByEmail(email);
        if (user == null) {
            throw new RuntimeException("User not found");
        }

        return tripRepository.findByUserId(user.getId());
    }

    @Override
    public Trip getTripById(Long tripId) {
        return tripRepository.findById(tripId)
                .orElseThrow(() -> new RuntimeException("Trip not found"));
    }

    @Override
    public void deleteTrip(Long tripId) {
        Trip trip = tripRepository.findById(tripId)
                .orElseThrow(() -> new RuntimeException("Trip not found"));

        tripRepository.delete(trip);
    }
}