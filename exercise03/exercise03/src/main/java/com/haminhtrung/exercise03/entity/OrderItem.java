package com.haminhtrung.exercise03.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "order_items")
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    @JsonIgnoreProperties("items")
    private Product product;

//    @Column(name = "order_id")
//    private UUID orderId;

    @ManyToOne
    @JoinColumn(name = "order_id", referencedColumnName = "id")
    @JsonIgnoreProperties("items")
    private Order order;

    @Column(name = "price", columnDefinition = "numeric")
    private BigDecimal price;

    @Column(name = "quantity")
    private int quantity;

    // @Column(name = "shipping_id")
    // private Integer shippingId;

    // @ManyToOne
    // @JoinColumn(name = "shipping_id", referencedColumnName = "id", insertable =
    // false, updatable = false)
    // private Shipping shipping;
}
