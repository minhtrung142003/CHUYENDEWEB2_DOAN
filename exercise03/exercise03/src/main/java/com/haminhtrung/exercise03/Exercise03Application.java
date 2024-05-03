package com.haminhtrung.exercise03;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class Exercise03Application {

	public static void main(String[] args) {
		SpringApplication.run(Exercise03Application.class, args);
	}

}
