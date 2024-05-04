package com.haminhtrung.exercise03.DTOs;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import com.haminhtrung.exercise03.entity.Category;
import com.haminhtrung.exercise03.entity.Gallery;
import com.haminhtrung.exercise03.entity.Tag;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartProductDto {
    private UUID cartId;
    private Integer quantity;
    private ProductDTO productDTO;
    

}