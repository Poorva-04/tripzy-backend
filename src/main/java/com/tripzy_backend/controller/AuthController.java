package com.tripzy_backend.controller;

import com.tripzy_backend.dto.request.LoginRequest;
import com.tripzy_backend.dto.request.RegisterRequest;
import com.tripzy_backend.dto.response.AuthResponse;
import com.tripzy_backend.service.UserService;

import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor



public class AuthController {

    private final UserService userService;

    // REGISTER API
    @PostMapping("/register")
    public AuthResponse registerUser(
            @RequestBody RegisterRequest request
    ) {
        return userService.registerUser(request);
    }

    // LOGIN API
    @PostMapping("/login")
    public AuthResponse loginUser(
            @RequestBody LoginRequest request
    ) {
        return userService.loginUser(request);
    }
}