package com.haminhtrung.exercise03.DTOs.mapper;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

import com.haminhtrung.exercise03.DTOs.ProductDTO;
import com.haminhtrung.exercise03.entity.Product;


@Mapper(componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        imports = {Instant.class, List.class, ArrayList.class})
public interface ProductDtoooMapper {

    ProductDTO geProductDTO(Product product);

    List<ProductDTO> geProductDTOs(List<Product> products);
    
}
