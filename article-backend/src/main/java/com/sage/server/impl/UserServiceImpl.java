package com.sage.server.impl;

import com.sage.dao.UserDao;
import com.sage.domain.User;
import com.sage.server.UserService;
import com.sage.utils.JwtUtil;
import com.sage.utils.MD5Util;
import com.sage.utils.ThreadLocalUtil;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestHeader;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

@Component
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public User getByName(String name) {
        User user = userDao.getByName(name);
        return user;
    }

    @Override
    public Integer register(String username, String password) {
        User user = userDao.getByName(username);
        if(user!=null)return 0;
        String new_pwd = MD5Util.md5Lower(password);
        LocalDateTime time1 = LocalDateTime.now();
        LocalDateTime time2 = LocalDateTime.now();
        String authority = "login";
        Integer num = userDao.register(username,new_pwd,time1,time2,authority);
        return num;
    }

    @Override
    public Integer updateUserPic(String userPic) {
        Map<String,Object> o = ThreadLocalUtil.get();
        Integer id = (Integer) o.get("id");
        LocalDateTime time = LocalDateTime.now();
        Integer num = userDao.updateUserPic(userPic,id,time);
        return num;
    }

    @Override
    public Integer updateUserInfo(User user) {
        Map<String,Object> claims = ThreadLocalUtil.get();
        Integer id = (Integer) claims.get("id");
        String username = (String) claims.get("username");
        System.out.println(username);
        System.out.println(id);
        System.out.println(user.getId());
        System.out.println(claims);
        if(!username.equals(user.getUsername()))return 0;
        user.setUpdateTime(LocalDateTime.now());
        userDao.update(user);
        return 1;
    }

    @Override
    public Integer updateUserPassword(Map<String, String> params, HttpServletRequest request) {
        String old_pwd = params.get("old_pwd");
        String new_pwd = params.get("new_pwd");
        String re_pwd = params.get("re_pwd");
        if(old_pwd.isEmpty()||new_pwd.isEmpty()||re_pwd.isEmpty())return 0;
        Map<String,Object> claims = ThreadLocalUtil.get();
        String username = (String) claims.get("username");
        Integer id = (Integer)claims.get("id");
        User user = userDao.getByName(username);
        if(!user.getPassword().equals(MD5Util.md5Lower(old_pwd)))return 0;
        if(!new_pwd.equals(re_pwd))return 0;
        LocalDateTime time = LocalDateTime.now();
        userDao.updateUserPwd(MD5Util.md5Lower(new_pwd),id,time);
        String token = request.getHeader("Authorization");
        stringRedisTemplate.opsForValue().getOperations().delete(token);
        return 1;
    }

    @Override
    public String Login(String username, String password) {
        User user = userDao.getByName(username);
        if(user==null)return null;
        String new_pwd = MD5Util.md5Lower(password);
        if(user.getPassword().equals(new_pwd)){
            Map<String,Object> claims = new HashMap<>();
            claims.put("id",user.getId());
            claims.put("username",user.getUsername());
            String token = JwtUtil.genToken(claims);
            stringRedisTemplate.opsForValue().set(token,token,12, TimeUnit.HOURS);
            return token;
        }else{
            return null;
        }
    }
}
