package com.tk.tksp.controller;

import com.tk.tksp.entity.User;
import com.tk.tksp.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
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
        List<User> userList = userMapper.selectByID(user);
        if (user.getUserKey().equals(userList.get(0).getUserKey())) {
            return "userID-" + userList.get(0).getUserID() + "-passengerID-" + userList.get(0).getPassengerID() + "-jurisdiction-" + userList.get(0).getJurisdiction();
        }
        return "false";
    }
}
