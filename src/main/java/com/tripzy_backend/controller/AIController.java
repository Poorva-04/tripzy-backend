package com.tripzy_backend.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tripzy_backend.service.AIService;
import lombok.RequiredArgsConstructor;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/ai")
@RequiredArgsConstructor
@CrossOrigin("*")
public class AIController {

    private final AIService aiService;

    private final ObjectMapper objectMapper;

    @PostMapping("/preview")
    public ResponseEntity<?> previewItinerary(
            @RequestBody Map<String, Object> request
    ) {

        String source         = (String) request.get("source");
        String destination    = (String) request.get("destination");
        int days              = (int) request.get("days");
        double budget         = ((Number) request.get("budget")).doubleValue();
        String interests      = (String) request.get("interests");
        String transportation = (String) request.get("transportation");
        String accommodation  = (String) request.get("accommodation");
        String startDate      = (String) request.get("startDate");
        String endDate        = (String) request.get("endDate");
        int travelers         = (int) request.get("travelers");

        try {

            String aiResponse = aiService.generateItinerary(
                    source,
                    destination,
                    days,
                    budget,
                    interests,
                    transportation,
                    accommodation,
                    startDate,
                    endDate,
                    travelers
            );

            // Convert AI JSON STRING -> REAL JSON OBJECT
            Object json = objectMapper.readValue(aiResponse, Object.class);

            return ResponseEntity.ok(json);

        } catch (Exception e) {

            return ResponseEntity.badRequest().body(
                    Map.of(
                            "error",
                            "Invalid itinerary format",
                            "message",
                            e.getMessage()
                    )
            );
        }
    }
}