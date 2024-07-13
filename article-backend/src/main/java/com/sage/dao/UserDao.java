package com.sage.dao;

import com.sage.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.time.LocalDateTime;
import java.util.List;

@Mapper
public interface UserDao {
    @Select("select * from [user] where username=#{name}")
    public User getByName(String name);
    @Insert("insert into [user] (username, password, createTime, updateTime,authority) VALUES (#{username},#{password},#{time1},#{time2},#{authority})")
    public Integer register(String username,String password,LocalDateTime time1,LocalDateTime time2,String authority);
    @Update("update [user] set nickname=#{nickname},updateTime=#{updateTime},phone=#{phone},email=#{email} where id=#{id}")
    public Integer update(User user);
    @Update("update [user] set userPic=#{userPic}, updateTime=#{time} where id=#{id}")
    public Integer updateUserPic(String userPic, Integer id, LocalDateTime time);
    @Update("update [user] set password=#{password},updateTime=#{time} where id=#{id}")
    public Integer updateUserPwd(String password,Integer id,LocalDateTime time);
    @Select("select * from [user] where id=#{id}")
    public User getById(Integer id);

}
