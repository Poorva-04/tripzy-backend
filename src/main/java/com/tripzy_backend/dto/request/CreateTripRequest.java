package com.tripzy_backend.dto.request;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter

public class CreateTripRequest {

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
}