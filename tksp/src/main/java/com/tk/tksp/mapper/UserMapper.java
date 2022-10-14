package com.tk.tksp.mapper;

import com.tk.tksp.entity.BuyTrain;
import com.tk.tksp.entity.User;
import com.tk.tksp.entity.ViewTicket;
import com.tk.tksp.entity.train;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {

    //按照用户id查询
    @Select("select * from user where user.userID = #{userID}")
    List<User> selectByID(User user);


    //查询用户订单
    @Select("select tpID, passengerID,  money, trainId, seat from ticketpassenger where ticketpassenger.passengerID = #{passengerID} ")
    List<ViewTicket> selectTicket(User user);

    //查询车辆信息
    @Select("select * from train")
    List<train> selectTrain();

    //车辆一等车位置减一
    @Update("UPDATE train SET firstSeat = firstSeat - 1 WHERE TrainID = #{trainID}")
    int buyFirst(BuyTrain buyTrain);

    //二等车位置减1
    @Update("UPDATE train SET secondSeat = secondSeat - 1 WHERE TrainID = #{trainID}")
    int buySecond(BuyTrain buyTrain);

    //ticket+1
    @Insert("INSERT INTO `ticket`.`ticketpassenger`(`passengerID`, `money`, `trainId`, `seat`) VALUES (#{passengerID}, #{money}, #{trainID}, #{seat})")
    int insertTicket(BuyTrain buyTrain);


    //删除车辆
    @Delete("DELETE FROM `ticket`.`train` WHERE `TrainID` = #{TrainID}")
    int deleteTrain(train tr);
}
