package com.tk.tksp.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ViewTicket {
    private Integer tpID;
    private Integer passengerID;
    private Integer ticketID;
    private String money;
    private String seat;
    private Integer trainId;
}
