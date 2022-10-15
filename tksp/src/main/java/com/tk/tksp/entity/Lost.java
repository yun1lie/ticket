package com.tk.tksp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Lost {
    private Integer lostID;
    private String lostName;
    private String location;
    private String time;
}
