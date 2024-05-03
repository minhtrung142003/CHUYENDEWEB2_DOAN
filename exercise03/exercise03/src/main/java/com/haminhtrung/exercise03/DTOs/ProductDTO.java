package com.haminhtrung.exercise03.DTOs;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import com.haminhtrung.exercise03.entity.Cart;
import com.haminhtrung.exercise03.entity.Category;
import com.haminhtrung.exercise03.entity.Gallery;
import com.haminhtrung.exercise03.entity.Order;
import com.haminhtrung.exercise03.entity.Product;
import com.haminhtrung.exercise03.entity.Tag;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
    private UUID id;
      // Thêm trường cartId
    private UUID cartId;
    private String productName;
    private BigDecimal regularPrice;
    private BigDecimal discountPrice;
    private int quantity;   
      private Cart cart;
    private String productDescription;
    private String SKU;
    private String productNote;
    private String shortDescription;
    private BigDecimal productWeight;
    private Boolean published;

public ProductDTO(Product product) {
    this.id = product.getId();
    this.productName = product.getProductName();
    this.discountPrice = product.getDiscountPrice();
    this.quantity = product.getQuantity();
    this.productDescription = product.getProductDescription();
    this.SKU = product.getSKU();
    this.productDescription = product.getProductDescription();
    this.productNote = product.getProductNote();
    this.shortDescription = product.getShortDescription();
    this.productWeight = product.getProductWeight();
    this.published = product.getPublished();
    // Sao chép các trường khác tương tự
}


    private Set<Category> categories = new HashSet<>();
    private Set<Tag> tags = new HashSet<>();
    private Set<Gallery> galleries  = new HashSet<>();
}
