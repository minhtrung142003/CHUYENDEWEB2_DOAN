package com.haminhtrung.exercise03.DTOs;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import com.haminhtrung.exercise03.entity.Category;
import com.haminhtrung.exercise03.entity.Gallery;
import com.haminhtrung.exercise03.entity.Order;
import com.haminhtrung.exercise03.entity.Tag;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderItemDto {
    private UUID productId;
    private UUID orderId;
    private BigDecimal price;
    private int quantity;
    private String productName;
    private BigDecimal regularPrice;
    private BigDecimal discountPrice;
    private String productDescription;
      private Set<Category> categories = new HashSet<>();
    private Set<Tag> tags = new HashSet<>();
    private Set<Gallery> galleries  = new HashSet<>();
}
