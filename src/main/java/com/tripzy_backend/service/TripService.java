package com.tripzy_backend.service;

import com.tripzy_backend.dto.request.CreateTripRequest;
import com.tripzy_backend.entity.Trip;

import java.util.List;

public interface TripService {

    Trip createTrip(
            CreateTripRequest request,
            String email
    );

    List<Trip> getUserTrips(
            String email
    );

    Trip getTripById(
            Long tripId
    );

    void deleteTrip(
            Long tripId
    );
}