package com.haminhtrung.exercise03.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haminhtrung.exercise03.DTOs.UserDto;
import com.haminhtrung.exercise03.entity.StaffAccount;
import com.haminhtrung.exercise03.repository.StaffAccountRepository;
import com.haminhtrung.exercise03.service.StaffAccountService;

import io.micrometer.common.util.StringUtils;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class StaffAccountServiceImpl implements StaffAccountService {

    @Autowired
    private StaffAccountRepository staffAccountRepository;

    @Override
    public StaffAccount addStaffAccount(StaffAccount staffAccount) {
        return staffAccountRepository.save(staffAccount);
    }

    @Override
    public StaffAccount getStaffAccountById(UUID staffAccountId) {
        Optional<StaffAccount> optionalStaffAccount = staffAccountRepository.findById(staffAccountId);
        return optionalStaffAccount.orElse(null);
    }

    @Override
    public List<StaffAccount> getAllStaffAccounts() {
        return staffAccountRepository.findAll();
    }

    @Override
    public StaffAccount updateStaffAccount(UUID staffAccountId, StaffAccount updatedStaffAccount) {
        StaffAccount existingStaffAccount = staffAccountRepository.findById(staffAccountId).orElse(null);

        if (existingStaffAccount != null) {
            existingStaffAccount.setFirstName(updatedStaffAccount.getFirstName());
            existingStaffAccount.setLastName(updatedStaffAccount.getLastName());
            existingStaffAccount.setFullName(updatedStaffAccount.getFullName());
            existingStaffAccount.setPasswordHash(updatedStaffAccount.getPasswordHash());
            existingStaffAccount.setEmail(updatedStaffAccount.getEmail());
            existingStaffAccount.setPhone(updatedStaffAccount.getPhone());
            existingStaffAccount.setRole(updatedStaffAccount.getRole());
            
            // Set other attributes as needed
            return staffAccountRepository.save(existingStaffAccount);
        }

        return null;
    }

    @Override
    public void deleteStaffAccount(UUID staffAccountId) {
        staffAccountRepository.deleteById(staffAccountId);
    }

    @Override
    public StaffAccount registerUser(UserDto userDto) {
        StaffAccount newUser = new StaffAccount(userDto.getFirstName(), userDto.getLastName(), userDto.getFullName(), userDto.getEmail(), userDto.getPasswordHash());
        return staffAccountRepository.save(newUser);
    }

    @Override
    public StaffAccount loginUser(UserDto userDto) {
        StaffAccount userInDb = staffAccountRepository.findByFullName(userDto.getFullName());
        if (userInDb != null && userInDb.getPasswordHash().equals(userDto.getPasswordHash())) {
            return userInDb; // Trả về đối tượng StaffAccount nếu đăng nhập thành công
        }
        return null; // Trả về null nếu đăng nhập không thành công
    }
    
    

}
