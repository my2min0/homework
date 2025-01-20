package com.my.spring.member.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {
    private String userId;
    private String password;
    private String userName;
    private int age;
    private String gender;
    private String email;
    private String phone;
    private String address;
    private String[] hobby;
    private Date enrollDate;
}
