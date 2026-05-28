package com.tripzy_backend.controller;

import com.tripzy_backend.entity.User;
import com.tripzy_backend.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor

public class Usercontroller {

    private final UserService userService;

    // GET CURRENT USER PROFILE
    @GetMapping("/me")
    public ResponseEntity<User> getProfile(Authentication authentication) {
        String email = authentication.getName();
        User user = userService.getUserByEmail(email);
        return ResponseEntity.ok(user);
    }

    // UPDATE PROFILE
    @PutMapping("/me")
    public ResponseEntity<User> updateProfile(
            @RequestBody User updatedUser,
            Authentication authentication
    ) {
        String email = authentication.getName();
        User user = userService.updateUser(email, updatedUser);
        return ResponseEntity.ok(user);
    }

    // DELETE ACCOUNT
    @DeleteMapping("/me")
    public ResponseEntity<String> deleteAccount(Authentication authentication) {
        String email = authentication.getName();
        userService.deleteUser(email);
        return ResponseEntity.ok("Account deleted successfully");
    }
}
