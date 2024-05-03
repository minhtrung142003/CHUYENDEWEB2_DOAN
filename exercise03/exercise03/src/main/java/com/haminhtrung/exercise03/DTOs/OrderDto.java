package com.haminhtrung.exercise03.DTOs;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import com.haminhtrung.exercise03.entity.OrderItem;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDto {

    private float totalPrice;
    private String userName;
    private String firstName;
    private String lastName;
    private String phone;
    private String email;
    private String address;
    private float totalDiscount;
    private LocalDateTime approvedAt;
    private LocalDateTime deliveredCarrierAt;
    private LocalDateTime deliveredCustomerAt;
    private LocalDateTime createdAt;
    private UUID staffAccountId;
    
    private List<OrderItemDto> orderItemDto;
    
    private List<UUID> listIdCart;

}
