package com.haminhtrung.exercise03.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.haminhtrung.exercise03.DTOs.OrderDto;
import com.haminhtrung.exercise03.DTOs.OrderItemDto;
import com.haminhtrung.exercise03.entity.Cart;
import com.haminhtrung.exercise03.entity.Order;
import com.haminhtrung.exercise03.entity.OrderItem;
import com.haminhtrung.exercise03.entity.Product;
import com.haminhtrung.exercise03.service.OrderService;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
@CrossOrigin({ "http://localhost:3000", "http://localhost:3001" })

@RequestMapping("api/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping
    public ResponseEntity<List<Order>> getAllOrders() {
        List<Order> orders = orderService.getAllOrders();
        return ResponseEntity.ok(orders);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Order> getOrderById(@PathVariable("id") UUID orderId) {
        Order order = orderService.getOrderById(orderId);
        if (order != null) {
            return ResponseEntity.ok(order);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/staff-accounts/{staffAccountId}")
    public ResponseEntity<List<OrderDto>> getOrdersByStaffAccountId(
            @PathVariable("staffAccountId") UUID staffAccountId) {
        // Lấy danh sách các đơn hàng của nhân viên với ID tương ứng
        List<Order> orders = orderService.getOrdersByStaffAccountId(staffAccountId);

        // Tạo danh sách để chứa thông tin đầy đủ của đơn hàng
        List<OrderDto> ordersDto = new ArrayList<>();

        // Lặp qua danh sách các đơn hàng
        for (Order order : orders) {
            // Tạo đối tượng DTO cho mỗi đơn hàng và đổ thông tin từ đối tượng Order vào đối
            // tượng DTO
            OrderDto orderDto = new OrderDto();
            orderDto.setTotalPrice(order.getTotalPrice());
            orderDto.setUserName(order.getUserName());
            orderDto.setAddress(order.getAddress());
            orderDto.setFirstName(order.getFirstName());
            orderDto.setLastName(order.getLastName());
            orderDto.setEmail(order.getEmail());
            orderDto.setPhone(order.getPhone());
            orderDto.setTotalDiscount(order.getTotalDiscount());
            orderDto.setApprovedAt(order.getApprovedAt());
            orderDto.setDeliveredCarrierAt(order.getDeliveredCarrierAt());
            orderDto.setDeliveredCustomerAt(order.getDeliveredCustomerAt());
            orderDto.setCreatedAt(order.getCreatedAt());
            orderDto.setStaffAccountId(order.getStaffAccountId());

            // Lấy danh sách các mục hàng trong đơn hàng và chuyển đổi chúng thành DTOs
            List<OrderItemDto> orderItemDtos = new ArrayList<>();
            for (OrderItem orderItem : order.getItems()) {
                OrderItemDto orderItemDto = new OrderItemDto();
                Product product = orderItem.getProduct(); // Lấy đối tượng sản phẩm từ mục hàng đơn hàng

                // Gán thông tin của sản phẩm vào orderItemDto
                orderItemDto.setProductId(product.getId());
                orderItemDto.setQuantity(orderItem.getQuantity());
                orderItemDto.setPrice(orderItem.getPrice());

                // Lấy các thông tin khác của sản phẩm và gán vào orderItemDto
                orderItemDto.setProductName(product.getProductName());
                orderItemDto.setRegularPrice(product.getRegularPrice());
                orderItemDto.setDiscountPrice(product.getDiscountPrice());
                orderItemDto.setProductDescription(product.getProductDescription());
                orderItemDto.setCategories(product.getCategories());
                orderItemDto.setTags(product.getTags());
                orderItemDto.setGalleries(product.getGalleries());
                // Bổ sung các thông tin khác của sản phẩm tương tự

                orderItemDtos.add(orderItemDto);
            }
            orderDto.setOrderItemDto(orderItemDtos);

            // Lấy danh sách các ID của các giỏ hàng và gán vào OrderDto
            List<UUID> listIdCart = new ArrayList<>();
            for (Cart cart : order.getCarts()) {
                listIdCart.add(cart.getId());
            }
            orderDto.setListIdCart(listIdCart);

            // Thêm đối tượng DTO vào danh sách
            ordersDto.add(orderDto);
        }

        // Trả về danh sách đơn hàng
        return ResponseEntity.ok(ordersDto);
    }

    @PostMapping
    public ResponseEntity<?> addOrder(@RequestBody OrderDto orderDto) {
        return orderService.addOrder(orderDto);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Order> updateOrder(@PathVariable("id") UUID orderId, @RequestBody Order updatedOrder) {
        Order order = orderService.updateOrder(orderId, updatedOrder);
        if (order != null) {
            return ResponseEntity.ok(order);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrder(@PathVariable("id") UUID orderId) {
        orderService.deleteOrder(orderId);
        return ResponseEntity.noContent().build();
    }
}
