package com.tripzy_backend.dto.response;

import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TripResponse {

    private Long id;
    private String source;
    private String destination;
    private int days;
    private double budget;
    private String interests;
    private String transportation;
    private String accommodation;
    private LocalDate startDate;
    private LocalDate endDate;
    private int travelers;
    private String itinerary;
    private String status;
    private LocalDateTime createdAt;
}
