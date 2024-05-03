package com.haminhtrung.exercise03.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.haminhtrung.exercise03.entity.Cart;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface CartRepository extends JpaRepository<Cart, UUID> {
    List<Cart> findAllByStaffAccountId(UUID staffAccountId);

    List<Cart> findAllByProductIdAndStaffAccountId(UUID productId, UUID staffAccountId);

    List<Cart> findByStaffAccountIdAndProductId(UUID staffAccountId, UUID productId);

    // Tạo phương thức findById
    Optional<Cart> findById(UUID id);

}
