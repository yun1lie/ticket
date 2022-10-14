package com.tk.tksp.controller;

import com.tk.tksp.entity.BuyTrain;
import com.tk.tksp.entity.User;
import com.tk.tksp.entity.ViewTicket;
import com.tk.tksp.entity.train;
import com.tk.tksp.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


import java.util.List;

@RestController
public class UserController {
    @Autowired
    private UserMapper userMapper;

    @PostMapping("/login")
    public String getUserByID(@RequestBody User user) {
//        如果密码正确
        try {
            List<User> userList = userMapper.selectByID(user);
            if (user.getUserKey().equals(userList.get(0).getUserKey())) {
                return "userID-" + userList.get(0).getUserID() + "-passengerID-" + userList.get(0).getPassengerID() + "-jurisdiction-" + userList.get(0).getJurisdiction();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return "false";
    }

    @PostMapping("/viewTickets")
    public List<ViewTicket> viewTickets(@RequestBody User user) {
        return userMapper.selectTicket(user);
    }

    @GetMapping("/selectTrain")
    public List<train> selectTrain() {
        return userMapper.selectTrain();
    }

    @PostMapping("/BuyTicket")
    public int BuyTicket(@RequestBody BuyTrain buyTrain) {
        if (buyTrain.getSeat().equals("first")) {
            userMapper.buyFirst(buyTrain);
            //用户票增加一张
            userMapper.insertTicket(buyTrain);
            return 1;
        } else if (buyTrain.getSeat().equals("second")) {
            userMapper.buySecond(buyTrain);
            userMapper.insertTicket(buyTrain);
            return 1;
        }
        return 0;
    }

    @PostMapping("/deleteTrain")
    public int deleteTrain(@RequestBody train tr) {
        try {
            return userMapper.deleteTrain(tr);

        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

}
