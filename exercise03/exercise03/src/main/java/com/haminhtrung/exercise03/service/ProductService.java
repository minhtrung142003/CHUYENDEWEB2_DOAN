package com.haminhtrung.exercise03.service;

import java.util.List;
import java.util.UUID;

import com.haminhtrung.exercise03.entity.Product;

public interface ProductService {
    Product addProduct(Product product);

    Product getProductById(UUID productId);

    List<Product> getAllProducts();

    Product updateProduct(UUID productId, Product updatedProduct);

    void deleteProduct(UUID productId);
    List<Product> getProductsByTagName(String tagName);
    List<Product> getProductsByCategoryName(String categoryName);
}
