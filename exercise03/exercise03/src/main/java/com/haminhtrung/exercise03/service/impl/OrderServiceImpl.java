package com.haminhtrung.exercise03.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.haminhtrung.exercise03.DTOs.OrderDto;
import com.haminhtrung.exercise03.DTOs.OrderItemDto;
import com.haminhtrung.exercise03.entity.Cart;
import com.haminhtrung.exercise03.entity.Order;
import com.haminhtrung.exercise03.entity.OrderItem;
import com.haminhtrung.exercise03.entity.Product;
import com.haminhtrung.exercise03.repository.CartRepository;
import com.haminhtrung.exercise03.repository.OrderItemRepository;
import com.haminhtrung.exercise03.repository.OrderRepository;
import com.haminhtrung.exercise03.repository.ProductRepository;
import com.haminhtrung.exercise03.service.OrderService;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @Autowired
    private CartRepository cartRepository;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseEntity<?> addOrder(OrderDto orderDto) {
        Order order = new Order();
        // chỗ này thêm vào Order
        order.setTotalPrice(orderDto.getTotalPrice());
        order.setUserName(orderDto.getUserName());
        order.setLastName(orderDto.getLastName());
        order.setUserName(orderDto.getUserName());
        order.setPhone(orderDto.getPhone());
        order.setEmail(orderDto.getEmail());
        order.setAddress(orderDto.getAddress());
        order.setTotalDiscount(orderDto.getTotalDiscount());
        order.setApprovedAt(orderDto.getApprovedAt());
        order.setDeliveredCarrierAt(orderDto.getDeliveredCarrierAt());
        order.setDeliveredCustomerAt(orderDto.getDeliveredCustomerAt());
        order.setCreatedAt(orderDto.getCreatedAt());
        order.setStaffAccountId(orderDto.getStaffAccountId());

        // Lưu đối tượng Order vào cơ sở dữ liệu
        orderRepository.save(order);

        // Kiểm tra xem orderItemDto có khác null không trước khi lặp qua nó
        if (orderDto.getOrderItemDto() != null) {
            // Lặp qua danh sách OrderItemDto và lưu mỗi OrderItem vào cơ sở dữ liệu
            for (OrderItemDto orderItemDto : orderDto.getOrderItemDto()) {
                // Thêm vào OrderItems
                Product product = productRepository.findById(orderItemDto.getProductId()).orElse(null);
                if (product != null) {
                    OrderItem orderItem = new OrderItem();
                    orderItem.setOrder(order);
                    orderItem.setProduct(product);
                    orderItem.setPrice(orderItemDto.getPrice());
                    orderItem.setQuantity(orderItemDto.getQuantity());
                    orderItemRepository.save(orderItem);
                }
            }
        }

        // Xoá các Cart dựa trên danh sách id đã được truyền vào
        // Kiểm tra xem ListIdCart có khác null không trước khi xử lý
        for (UUID a : orderDto.getListIdCart()) {
            Optional<Cart> oDeleteCart = cartRepository.findById(a);
            //                Cart deleteCart = oDeleteCart.get();
            //                Set<Cart> carts = new HashSet<>();
            //                Cart cart = new Cart();
            //                cart.setProductId(deleteCart.getProductId());
            //                cart.setQuantity(deleteCart.getQuantity());
            //                cart.setStaffAccountId(deleteCart.getStaffAccountId());
            //
            //                carts.add(cart);
            //                order.setCarts(carts);
            oDeleteCart.ifPresent(cart -> cartRepository.deleteById(cart.getId()));
        }

        // Trả về mã HTTP 201 Created và thông báo thành công
        return new ResponseEntity<>("Add successfully", HttpStatus.OK);
    }

    @Override
    public Order getOrderById(UUID orderId) {
        Optional<Order> optionalOrder = orderRepository.findById(orderId);
        return optionalOrder.orElse(null);
    }

    @Override
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    @Override
    public Order updateOrder(UUID orderId, Order updatedOrder) {
        Order existingOrder = orderRepository.findById(orderId).orElse(null);

        if (existingOrder != null) {
            // existingOrder.setCoupon(updatedOrder.getCoupon());
            existingOrder.setStaffAccountId(updatedOrder.getStaffAccountId());
            // existingOrder.setStatus(updatedOrder.getStatus());
            existingOrder.setApprovedAt(updatedOrder.getApprovedAt());
            existingOrder.setDeliveredCarrierAt(updatedOrder.getDeliveredCarrierAt());
            existingOrder.setDeliveredCustomerAt(updatedOrder.getDeliveredCustomerAt());
            existingOrder.setCreatedAt(updatedOrder.getCreatedAt());
            // You may need to handle items here
            return orderRepository.save(existingOrder);
        }

        return null;
    }


        @Override
    public List<Order> getOrdersByStaffAccountId(UUID staffAccountId) {
        // Lấy danh sách các đơn hàng của nhân viên dựa trên ID nhân viên từ cơ sở dữ liệu
        return orderRepository.findByStaffAccountId(staffAccountId);
    }

    @Override
    public void deleteOrder(UUID orderId) {
        orderRepository.deleteById(orderId);
    }
}
