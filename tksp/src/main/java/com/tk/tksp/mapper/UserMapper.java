package com.tk.tksp.mapper;

import com.tk.tksp.entity.User;
import com.tk.tksp.entity.ViewTicket;
import com.tk.tksp.entity.train;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper {

    //按照用户id查询
    @Select("select * from user where user.userID = #{userID}")
    List<User> selectByID(User user);


    //查询用户订单
    @Select("select tpID, passengerID, ticketID, money, trainId, seat from ticketpassenger, ticket where ticketpassenger.passengerID = #{passengerID} AND ticketpassenger.ticketID = ticket.ID")
    List<ViewTicket> selectTicket(User user);

    //查询车辆信息
    @Select("select * from train")
    List<train> selectTrain();
}
