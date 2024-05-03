package com.haminhtrung.exercise03.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.haminhtrung.exercise03.entity.Variant;

import java.util.UUID;

@Repository
public interface VariantRepository extends JpaRepository<Variant, UUID> {
}
