package com.haminhtrung.exercise03.DTOs;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import com.haminhtrung.exercise03.entity.Notification;
import com.haminhtrung.exercise03.entity.StaffAccount;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDto {
    private String firstName;
    private String lastName;
    private String fullName;    
    private String email;
    private String passwordHash;
    private Set<Notification> notifications = new HashSet<>();

}