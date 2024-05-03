package com.haminhtrung.exercise03.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class BaseController {
    @GetMapping
    public ResponseEntity<?> test(@RequestParam String request) {
        return ResponseEntity.ok(request);
    }
}
