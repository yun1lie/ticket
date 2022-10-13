package com.tk.tksp.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class train {
    private Integer TrainID;
    private String TrainType;
    private String StartStation;
    private String ArriveStation;
    private String StartTime;
    private String ArriveTime;
    private String firstSeat;
    private String secondSeat;
    private Double firstPrice;
    private Double secondPrice;

}
