package com.haminhtrung.exercise03.service;

import java.util.List;
import java.util.UUID;

import com.haminhtrung.exercise03.entity.ShippingRate;

public interface ShippingRateService {
    ShippingRate addShippingRate(ShippingRate shippingRate);
    
    ShippingRate getShippingRateById(UUID shippingRateId);
    
    List<ShippingRate> getAllShippingRates();
    
    ShippingRate updateShippingRate(UUID shippingRateId, ShippingRate updatedShippingRate);
    
    void deleteShippingRate(UUID shippingRateId);
}
