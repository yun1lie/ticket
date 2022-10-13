package com.tk.tksp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BuyTrain {
    private Integer passengerID;
    private Integer trainID;
    private String seat;
    private String money;

}
