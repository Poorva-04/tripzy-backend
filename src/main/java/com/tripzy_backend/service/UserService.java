package com.tripzy_backend.service;

import com.tripzy_backend.dto.request.LoginRequest;
import com.tripzy_backend.dto.request.RegisterRequest;
import com.tripzy_backend.dto.response.AuthResponse;
import com.tripzy_backend.entity.User;

public interface UserService {

    AuthResponse registerUser(RegisterRequest request);

    AuthResponse loginUser(LoginRequest request);

    User getUserByEmail(String email);

    User updateUser(String email, User updatedUser);

    void deleteUser(String email);
}
