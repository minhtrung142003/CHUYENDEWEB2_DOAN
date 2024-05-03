package com.haminhtrung.exercise03.service;

import java.util.List;
import java.util.UUID;

import org.springframework.http.ResponseEntity;

import com.haminhtrung.exercise03.DTOs.OrderDto;
import com.haminhtrung.exercise03.entity.Order;

public interface OrderService {
    ResponseEntity<?> addOrder(OrderDto orderDto);

    Order getOrderById(UUID orderId);

    List<Order> getAllOrders();

    Order updateOrder(UUID orderId, Order updatedOrder);

    void deleteOrder(UUID orderId);

    List<Order> getOrdersByStaffAccountId(UUID staffAccountId);
}
