package com.haminhtrung.exercise03.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.haminhtrung.exercise03.entity.Supplier;

import java.util.UUID;

public interface SupplierRepository extends JpaRepository<Supplier, UUID> {
    // Bạn có thể thêm các phương thức truy vấn tùy chỉnh nếu cần
}
