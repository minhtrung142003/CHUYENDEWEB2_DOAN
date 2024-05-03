package com.haminhtrung.exercise03.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.haminhtrung.exercise03.DTOs.UserDto;
import com.haminhtrung.exercise03.entity.StaffAccount;
import com.haminhtrung.exercise03.service.StaffAccountService;

import java.util.List;
import java.util.UUID;

@RestController
@CrossOrigin({"http://localhost:3000", "http://localhost:3001"})
@RequestMapping("api/staff-accounts")
public class StaffAccountController {

    @Autowired
    private StaffAccountService staffAccountService;

    @GetMapping
    public ResponseEntity<List<StaffAccount>> getAllStaffAccounts() {
        List<StaffAccount> staffAccounts = staffAccountService.getAllStaffAccounts();
        return ResponseEntity.ok(staffAccounts);
    }

    @GetMapping("/{id}")
    public ResponseEntity<StaffAccount> getStaffAccountById(@PathVariable("id") UUID staffAccountId) {
        StaffAccount staffAccount = staffAccountService.getStaffAccountById(staffAccountId);
        if (staffAccount != null) {
            return ResponseEntity.ok(staffAccount);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    public ResponseEntity<StaffAccount> addStaffAccount(@RequestBody StaffAccount staffAccount) {
        StaffAccount addedStaffAccount = staffAccountService.addStaffAccount(staffAccount);
        return ResponseEntity.status(HttpStatus.CREATED).body(addedStaffAccount);
    }

    @PutMapping("/{id}")
    public ResponseEntity<StaffAccount> updateStaffAccount(@PathVariable("id") UUID staffAccountId,
            @RequestBody StaffAccount updatedStaffAccount) {
        StaffAccount staffAccount = staffAccountService.updateStaffAccount(staffAccountId, updatedStaffAccount);
        if (staffAccount != null) {
            return ResponseEntity.ok(staffAccount);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteStaffAccount(@PathVariable("id") UUID staffAccountId) {
        staffAccountService.deleteStaffAccount(staffAccountId);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/register")
    public ResponseEntity<StaffAccount> registerUser(@RequestBody UserDto userDto) {
        StaffAccount registeredUser = staffAccountService.registerUser(userDto);
        return new ResponseEntity<>(registeredUser, HttpStatus.CREATED);
    }

    @PostMapping("/login")
    public ResponseEntity<StaffAccount> loginUser(@RequestBody UserDto userDto) {
        StaffAccount user = staffAccountService.loginUser(userDto);
        if (user != null) {
            return ResponseEntity.ok(user); // Trả về thông tin người dùng nếu đăng nhập thành công
        } else {
            return ResponseEntity.badRequest().body(null); // Trả về BadRequest nếu đăng nhập không thành công
        }
    }
    
    
}
