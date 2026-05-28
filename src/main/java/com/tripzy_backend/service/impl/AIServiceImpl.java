package com.tripzy_backend.service.impl;

import com.tripzy_backend.service.AIService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AIServiceImpl implements AIService {

    @Value("${groq.api.key}")
    private String apiKey;

    private final RestTemplate restTemplate = new RestTemplate();
    private static final String GROQ_URL = "https://api.groq.com/openai/v1/chat/completions";

    @Override
    public String generateItinerary(String source, String destination, int days,
                                    double budget, String interests, String transportation,
                                    String accommodation, String startDate, String endDate,
                                    int travelers) {

    	String prompt = String.format("""
    			Create a luxury modern travel itinerary.

    			Return ONLY valid JSON.

    			Use EXACTLY this structure:

    			{
    			  "tripDetails": {
    			    "from": "",
    			    "to": "",
    			    "startDate": "",
    			    "endDate": "",
    			    "budget": 0
    			  },

    			  "itinerary": [
    			    {
    			      "day": 1,
    			      "title": "",
    			      "mood": "",

    			      "activities": [
    			        {
    			          "time": "Morning",
    			          "title": "",
    			          "description": "",
    			          "location": "",
    			          "estimatedCost": 0
    			        }
    			      ],

    			      "foodRecommendation": "",
    			      "hotelSuggestion": "",

    			      "travelTips": [
    			        "",
    			        ""
    			      ]
    			    }
    			  ]
    			}

    			Trip Details:
    			From: %s
    			To: %s
    			Days: %d
    			Budget: %.0f
    			Interests: %s
    			Transportation: %s
    			Accommodation: %s
    			Start Date: %s
    			End Date: %s
    			Travelers: %d

    			Return JSON only.
    			""",
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

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(apiKey);

        Map<String, Object> body = new HashMap<>();
        body.put("model", "llama-3.3-70b-versatile");
        body.put("max_tokens", 4096);
        body.put("temperature", 0.7);
        body.put("messages", List.of(
                Map.of("role", "system", "content",
                        "You are a professional travel planner. Always respond with valid JSON only, no markdown, no backticks."),
                Map.of("role", "user", "content", prompt)
        ));

        HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);

        try {
            ResponseEntity<Map> response = restTemplate.exchange(
                    GROQ_URL,
                    HttpMethod.POST,
                    request,
                    Map.class
            );

            Map responseBody = response.getBody();
            List<Map> choices = (List<Map>) responseBody.get("choices");
            Map message = (Map) choices.get(0).get("message");

            // ✅ Fix is INSIDE the try block, before return
            String content = (String) message.get("content");
            content = content.trim();
            if (content.startsWith("```")) {
                content = content.replaceAll("^```[a-zA-Z]*\\n?", "");
                content = content.replaceAll("```$", "").trim();
            }

            return content;

        } catch (Exception e) {
            throw new RuntimeException("Failed to generate itinerary from Groq: " + e.getMessage(), e);
        }
    }
}