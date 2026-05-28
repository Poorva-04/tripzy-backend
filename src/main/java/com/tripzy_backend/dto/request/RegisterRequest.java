package com.tripzy_backend.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class RegisterRequest {

    private String name;

    private String email;

    private String password;

    private String phoneNumber;

    private String city;

    private String country;
}