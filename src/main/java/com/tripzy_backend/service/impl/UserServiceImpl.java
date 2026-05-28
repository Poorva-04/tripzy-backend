package com.tripzy_backend.service.impl;

import com.tripzy_backend.dto.request.LoginRequest;
import com.tripzy_backend.dto.request.RegisterRequest;
import com.tripzy_backend.dto.response.AuthResponse;
import com.tripzy_backend.entity.User;
import com.tripzy_backend.exception.ResourceNotFoundException;
import com.tripzy_backend.repository.UserRepository;
import com.tripzy_backend.security.JwtUtil;
import com.tripzy_backend.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final JwtUtil jwtUtil;
    private final BCryptPasswordEncoder passwordEncoder;

    @Override
    public AuthResponse registerUser(RegisterRequest request) {

        if (userRepository.findByEmail(request.getEmail()) != null) {
            return new AuthResponse("Email already registered!", false, null);
        }

        User user = User.builder()
                .name(request.getName())
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .phoneNumber(request.getPhoneNumber())
                .city(request.getCity())
                .country(request.getCountry())
                .build();

        userRepository.save(user);

        String token = jwtUtil.generateToken(user.getEmail());

        return new AuthResponse("User Registered Successfully", true, token);
    }

    @Override
    public AuthResponse loginUser(LoginRequest request) {

        User user = userRepository.findByEmail(request.getEmail());

        if (user == null) {
            return new AuthResponse("User not found", false, null);
        }

        if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            return new AuthResponse("Invalid Password", false, null);
        }

        String token = jwtUtil.generateToken(user.getEmail());

        return new AuthResponse("Login Successful", true, token);
    }

    @Override
    public User getUserByEmail(String email) {
        User user = userRepository.findByEmail(email);
        if (user == null) {
            throw new ResourceNotFoundException("User not found with email: " + email);
        }
        user.setPassword(null); // never expose password
        return user;
    }

    @Override
    public User updateUser(String email, User updatedUser) {
        User user = userRepository.findByEmail(email);
        if (user == null) {
            throw new ResourceNotFoundException("User not found with email: " + email);
        }

        if (updatedUser.getName() != null)         user.setName(updatedUser.getName());
        if (updatedUser.getPhoneNumber() != null)  user.setPhoneNumber(updatedUser.getPhoneNumber());
        if (updatedUser.getCity() != null)         user.setCity(updatedUser.getCity());
        if (updatedUser.getCountry() != null)      user.setCountry(updatedUser.getCountry());
        if (updatedUser.getProfileImage() != null) user.setProfileImage(updatedUser.getProfileImage());

        User saved = userRepository.save(user);
        saved.setPassword(null);
        return saved;
    }

    @Override
    public void deleteUser(String email) {
        User user = userRepository.findByEmail(email);
        if (user == null) {
            throw new ResourceNotFoundException("User not found with email: " + email);
        }
        userRepository.delete(user);
    }
}