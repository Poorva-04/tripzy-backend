package com.tripzy_backend.dto.response;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor

public class AuthResponse {

    private String message;

    private boolean success;

    private String token;
}