package com.tk.tksp.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    Integer userID;
    String userKey;
    Integer passengerID;
    String jurisdiction;
}
