package com.tripzy_backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tripzy_backend.entity.User;

@Repository

public interface UserRepository extends JpaRepository<User, Long> {

    // Find user by email
    User findByEmail(String email);

    // Check email exists
    boolean existsByEmail(String email);
}