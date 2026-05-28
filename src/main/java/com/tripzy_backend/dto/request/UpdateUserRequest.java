package com.tripzy_backend.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateUserRequest {

    private String name;
    private String phoneNumber;
    private String city;
    private String country;
    private String profileImage;
}
