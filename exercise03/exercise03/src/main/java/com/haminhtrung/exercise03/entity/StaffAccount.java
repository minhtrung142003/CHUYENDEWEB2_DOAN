package com.haminhtrung.exercise03.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "staff_accounts")
public class StaffAccount extends DateTime{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;
    
    @Column(name = "first_name")
    private String firstName;

    @Column(name = "fullname")
    private String fullName;
    @Column(name = "last_name")
    private String lastName;

    @Column(name = "phone_number")
    private String phone;

    @Column(name = "email")
    private String email;

    @Column(name = "password_hash")
    private String passwordHash;

    @Column(name = "active")
    private boolean active;

    @Column(name = "profile_img")
    private String profileImg;

    @Column(name = "registered_at")
    private Date registeredAt;

    public StaffAccount(String firstName, String lastName,  String fullName, String email, String passwordHash) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.fullName = fullName;
        this.email = email;
        this.passwordHash = passwordHash;
    }

        
    @ManyToOne
    @JoinColumn(name = "created_by")
    private StaffAccount createdBy;

    @ManyToOne
    @JoinColumn(name = "updated_by")
    private StaffAccount updatedBy;

    // @JsonIgnore
    // @OneToMany(mappedBy = "staffAccount")
    // private Set<Cart> carts;

    
    // @OneToMany(mappedBy = "staffAccount", cascade = CascadeType.ALL)
    // private List<Order> orders;

    @JsonIgnore
    @OneToMany(mappedBy = "account")
    private Set<Notification> notifications = new HashSet<>();
}
