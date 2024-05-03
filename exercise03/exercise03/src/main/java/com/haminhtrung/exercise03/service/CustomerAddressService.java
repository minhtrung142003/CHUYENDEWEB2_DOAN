package com.haminhtrung.exercise03.service;

import java.util.List;
import java.util.UUID;

import com.haminhtrung.exercise03.entity.CustomerAddress;

public interface CustomerAddressService {
    CustomerAddress addCustomerAddress(CustomerAddress customerAddress);

    CustomerAddress getCustomerAddressById(UUID customerAddressId);

    List<CustomerAddress> getAllCustomerAddresses();

    CustomerAddress updateCustomerAddress(UUID customerAddressId, CustomerAddress updatedCustomerAddress);

    void deleteCustomerAddress(UUID customerAddressId);
}
