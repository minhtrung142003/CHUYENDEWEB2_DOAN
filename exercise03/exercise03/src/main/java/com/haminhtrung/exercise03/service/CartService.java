package com.haminhtrung.exercise03.service;

import java.util.List;
import java.util.UUID;

import com.haminhtrung.exercise03.DTOs.CartProductDto;
import com.haminhtrung.exercise03.entity.Cart;

public interface CartService {
    Cart addCart(Cart cart);

    Cart getCartById(UUID cartId);

    List<Cart> getAllCarts();

    Cart updateCart(UUID cartId, Cart updatedCart);

    void deleteCart(UUID cartId);

    void updateQuantity(UUID staffAccountId, UUID productId, Integer newQuantity);
    
    List<CartProductDto> getAllCartsByStaffAccountId(UUID staffAccountId);
    List<CartProductDto> getAllProductsInCartByStaffAccountId(UUID staffAccountId);
   

}
