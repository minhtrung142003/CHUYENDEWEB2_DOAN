package com.haminhtrung.exercise03.controller;

import com.haminhtrung.exercise03.DTOs.CartProductDto;
import com.haminhtrung.exercise03.DTOs.ProductDTO;
import com.haminhtrung.exercise03.entity.Cart;
import com.haminhtrung.exercise03.service.CartService;
import com.haminhtrung.exercise03.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
@CrossOrigin({"http://localhost:3000", "http://localhost:3001"})
@RequestMapping("api/carts")
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private ProductService productService; // Inject ProductService

    @GetMapping
    public ResponseEntity<List<Cart>> getAllCarts() {
        List<Cart> carts = cartService.getAllCarts();
        return ResponseEntity.ok(carts);
    }

   // Get all products in cart by staff account ID
   @GetMapping("/staff-accounts/{staffAccountId}")
   public ResponseEntity<List<ProductDTO>> getAllProductsInCartByStaffAccountId(@PathVariable("staffAccountId") UUID staffAccountId) {
       List<CartProductDto> cartProductDtos = cartService.getAllProductsInCartByStaffAccountId(staffAccountId);
   
       // Create a list to hold full product information
       List<ProductDTO> productsInCart = new ArrayList<>();
   
       // Loop through the list of cart products
       for (CartProductDto cartProductDto : cartProductDtos) {
           ProductDTO productDTO = new ProductDTO(productService.getProductById(cartProductDto.getProductId()));
   
           // Check if productDTO is not null and add quantity information
           if (productDTO != null) {
               productDTO.setQuantity(cartProductDto.getQuantity()); // Set the quantity
               // Set cartId for each productDTO
               productDTO.setCartId(cartProductDto.getCartId());
               productsInCart.add(productDTO);
           }
       }
   
       return ResponseEntity.ok(productsInCart);
   }
   

    

    @GetMapping("/{id}")
    public ResponseEntity<Cart> getCartById(@PathVariable("id") UUID cartId) {
        Cart cart = cartService.getCartById(cartId);
        if (cart != null) {
            return ResponseEntity.ok(cart);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    public ResponseEntity<Cart> addCart(@RequestBody Cart cart) {
        Cart addedCart = cartService.addCart(cart);
        return ResponseEntity.status(HttpStatus.CREATED).body(addedCart);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Cart> updateCart(@PathVariable("id") UUID cartId, @RequestBody Cart updatedCart) {
        Cart cart = cartService.updateCart(cartId, updatedCart);
        if (cart != null) {
            return ResponseEntity.ok(cart);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // api update quantity
    @PutMapping("/{staffAccountId}/products/{productId}")
    public ResponseEntity<String> updateQuantity(
            @PathVariable UUID staffAccountId,
            @PathVariable UUID productId,
            @RequestParam Integer newQuantity) {

        cartService.updateQuantity(staffAccountId, productId, newQuantity);
        return ResponseEntity.status(HttpStatus.OK).body("Quantity updated successfully.");
    }

    // delete
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCart(@PathVariable("id") UUID cartId) {
        cartService.deleteCart(cartId);
        return ResponseEntity.noContent().build();
    }
}
