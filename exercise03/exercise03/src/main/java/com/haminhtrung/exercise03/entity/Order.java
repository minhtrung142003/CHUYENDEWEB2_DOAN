package com.haminhtrung.exercise03.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private UUID id;

    // thông tin dat hang

    private float totalPrice;
    private String userName;
    private String firstName;
    private String lastName;
    private String phone;
    private String email;
    private String address;
    private float totalDiscount;

    @Column(name = "order_approved_at")
    private LocalDateTime approvedAt;

    @Column(name = "order_delivered_carrier_date")
    private LocalDateTime deliveredCarrierAt;

    @Column(name = "order_delivered_customer_date")
    private LocalDateTime deliveredCustomerAt;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "staffAccount_id")
    private UUID staffAccountId;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    private Set<OrderItem> items = new HashSet<>();

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "order_cart_items",
               joinColumns = @JoinColumn(name = "order_id"),
               inverseJoinColumns = @JoinColumn(name = "cart_item_id"))
               
    private Set<Cart> carts = new HashSet<>();


    // @Column(name = "order_status_id")
    // private UUID statusId;

    // @ManyToOne
    // @JoinColumn(name = "order_status_id", referencedColumnName = "id", insertable = false, updatable = false)
    // private OrderStatus status;

  
}
