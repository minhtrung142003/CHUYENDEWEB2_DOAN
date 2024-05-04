package com.haminhtrung.exercise03.DTOs;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import com.haminhtrung.exercise03.entity.Category;
import com.haminhtrung.exercise03.entity.Gallery;
import com.haminhtrung.exercise03.entity.Tag;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
  private UUID id;

  private String productName;

  private String SKU;

  private BigDecimal regularPrice;

  private BigDecimal discountPrice;

  private int quantity;

  private String shortDescription;

  private String productDescription;

  private BigDecimal productWeight;

  private String productNote;

  private Boolean published;

  /// 5
  // private Set<Supplier> suppliers = new HashSet<>();
  /// 5
  private Set<Category> categories = new HashSet<>();
  //// 5
  private Set<Tag> tags = new HashSet<>();

  private Set<Gallery> galleries = new HashSet<>();
}