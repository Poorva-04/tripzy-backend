package com.tripzy_backend.controller;

import com.tripzy_backend.dto.request.CreateTripRequest;
import com.tripzy_backend.entity.Trip;
import com.tripzy_backend.service.TripService;

import lombok.RequiredArgsConstructor;

import org.springframework.security.core.Authentication;

import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/trips")
@RequiredArgsConstructor

@CrossOrigin("*")

public class TripController {

    private final TripService tripService;

    // CREATE TRIP
    @PostMapping
    public Trip createTrip(
            @RequestBody CreateTripRequest request,
            Authentication authentication
    ) {

        String email =
                authentication.getName();

        return tripService.createTrip(
                request,
                email
        );
    }

    // GET USER TRIPS
    @GetMapping
    public List<Trip> getUserTrips(
            Authentication authentication
    ) {

        String email =
                authentication.getName();

        return tripService.getUserTrips(
                email
        );
    }

    // GET SINGLE TRIP
    @GetMapping("/{id}")
    public Trip getTripById(
            @PathVariable Long id
    ) {

        return tripService.getTripById(id);
    }

    // DELETE TRIP
    @DeleteMapping("/{id}")
    public Map<String, String> deleteTrip(
            @PathVariable Long id
    ) {

        tripService.deleteTrip(id);

        return Map.of(
                "message",
                "Trip Deleted Successfully"
        );
    }
}