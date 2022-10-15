package com.tk.tksp.controller;

import com.tk.tksp.entity.*;
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

    @PostMapping("/finOneTrain")
    public List<train> findOneTrain(@RequestBody train tr) {
        return userMapper.selectTrainByID(tr);
    }

    @PostMapping("/updateTrain")
    public int updateTrain(@RequestBody train tr) {
        return userMapper.updateTrain(tr);
    }

    //查看所有车站
    @GetMapping("/findAllStation")
    public List<Station> findAllStation() {
        return userMapper.findAllStation();
    }

    //添加车站
    @PostMapping("/insertStation")
    public int insertStation(@RequestBody Station station) {
        return userMapper.insertStation(station);
    }

    //删除车站
    @PostMapping("/deleteStation")
    public int deleteStation(@RequestBody Station station) {
        return userMapper.deleteStation(station);
    }

    //修改车站
    @PostMapping("/updateStation")
    public int updateStation(@RequestBody Station station){
        return userMapper.updateStation(station);
    }

}
