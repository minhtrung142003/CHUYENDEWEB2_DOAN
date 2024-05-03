package com.haminhtrung.exercise03.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haminhtrung.exercise03.DTOs.CartProductDto;
import com.haminhtrung.exercise03.entity.Cart;
import com.haminhtrung.exercise03.repository.CartRepository;
import com.haminhtrung.exercise03.service.CartService;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartRepository cartRepository;

    // hàm add cart
    @Override
    public Cart addCart(Cart cart) {
        // Tìm tất cả các giỏ hàng có cùng productId và staffAccountId
        List<Cart> existingCarts = cartRepository.findAllByProductIdAndStaffAccountId(cart.getProductId(), cart.getStaffAccountId());
    
        if (!existingCarts.isEmpty()) {
            // Nếu có giỏ hàng đã tồn tại, cập nhật quantity của giỏ hàng đầu tiên được tìm thấy
            Cart existingCart = existingCarts.get(0);
            existingCart.setQuantity(existingCart.getQuantity() + cart.getQuantity());
            return cartRepository.save(existingCart);
        } else {
            // Nếu không có giỏ hàng nào tồn tại, tạo giỏ hàng mới
            return cartRepository.save(cart);
        }
    }
    
    // hàm update quantiy 
    @Override
    public void updateQuantity(UUID staffAccountId, UUID productId, Integer newQuantity) {
        List<Cart> carts = cartRepository.findByStaffAccountIdAndProductId(staffAccountId, productId);
        if (!carts.isEmpty()) {
            Cart cart = carts.get(0);
            cart.setQuantity(newQuantity);
            cartRepository.save(cart);
        }
    }

    // hàm trả về list product 
    @Override
public List<CartProductDto> getAllProductsInCartByStaffAccountId(UUID staffAccountId) {
    List<Cart> carts = cartRepository.findAllByStaffAccountId(staffAccountId);
    List<CartProductDto> cartProductDtos = new ArrayList<>();

    for (Cart cart : carts) {
        CartProductDto cartProductDto = new CartProductDto();
        cartProductDto.setCartId(cart.getId()); // Set cartId for each cart product DTO
        cartProductDto.setProductId(cart.getProductId());
        cartProductDto.setQuantity(cart.getQuantity());
        cartProductDtos.add(cartProductDto);
    }

    return cartProductDtos;
}

    // hàm get theo id cart
    @Override
    public Cart getCartById(UUID cartId) {
        Optional<Cart> optionalCart = cartRepository.findById(cartId);
        return optionalCart.orElse(null);
    }

    // hàm get all cart
    @Override
    public List<Cart> getAllCarts() {
        return cartRepository.findAll();
    }

    // hàm update cart
    @Override
public Cart updateCart(UUID cartId, Cart updatedCart) {
    Cart existingCart = cartRepository.findById(cartId).orElse(null);

    if (existingCart != null) {
        // Cập nhật các trường khác của giỏ hàng nếu cần
        existingCart.setProductId(updatedCart.getProductId());
        existingCart.setQuantity(updatedCart.getQuantity());
        existingCart.setStaffAccountId(updatedCart.getStaffAccountId()); // Cập nhật staffAccountId thay vì staffAccount

        // Nếu bạn cũng muốn cập nhật các mục trong giỏ hàng (cartItems), bạn cần xử lý ở đây

        return cartRepository.save(existingCart);
    }

    return null;
}


    // hàm delete
    @Override
    public void deleteCart(UUID cartId) {
        cartRepository.deleteById(cartId);
    }
    
    // hàm get all cart theo id user
    @Override
public List<CartProductDto> getAllCartsByStaffAccountId(UUID staffAccountId) {
    List<Cart> carts = cartRepository.findAllByStaffAccountId(staffAccountId);
    List<CartProductDto> cartProductDtos = new ArrayList<>();

    for (Cart cart : carts) {
        CartProductDto cartProductDto = new CartProductDto();
        cartProductDto.setCartId(cart.getId()); // Set cartId for each cart product DTO
        cartProductDto.setProductId(cart.getProductId());
        cartProductDto.setQuantity(cart.getQuantity());
        cartProductDtos.add(cartProductDto);
    }

    return cartProductDtos;
}

}
