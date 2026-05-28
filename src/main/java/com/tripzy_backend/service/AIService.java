package com.tripzy_backend.service;

public interface AIService {
    String generateItinerary(String source, String destination, int days,
                             double budget, String interests, String transportation,
                             String accommodation, String startDate, String endDate,
                             int travelers);
}