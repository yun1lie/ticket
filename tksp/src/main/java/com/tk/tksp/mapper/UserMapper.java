package com.tk.tksp.mapper;

import com.tk.tksp.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper {

    //按照用户id查询
    @Select("select * from user where user.userID = #{userID}")
    List<User> selectByID(User user);
}
