package com.sage.controller;

import com.sage.domain.Result;
import com.sage.domain.User;
import com.sage.server.UserService;
import com.sage.utils.ThreadLocalUtil;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ReactiveRedisOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @GetMapping
    public Result UserInfo(){
        Map<String,Object> claims = ThreadLocalUtil.get();
        String username = (String) claims.get("username");
        User user = userService.getByName(username);
        return new Result(user,1,"获取成功");
    }

    @PostMapping("/register")
    public Result register(String username,String password){
        Integer num = userService.register(username, password);
        if(num==0)return new Result(null,0,"用户名已存在");
        return new Result(null,1,"注册成功");
    }

    @PostMapping("/login")
    public Result login(String username,String password){
        String token = userService.Login(username,password);
        if(token==null)return new Result(null,0,"用户名或密码错误");
        return new Result(token,1,"登陆成功");
    }

    @PutMapping("/update")
    public Result updateUserInfo(@RequestBody @Validated User user){
        Integer num = userService.updateUserInfo(user);
        if(num==0)return new Result(null,0,"修改失败");
        return new Result(null,1,"修改成功");
    }

    @PatchMapping("/updateUserPic")
    public Result updateUserPic(@RequestParam String userPic){//进行URL校验
        Integer num = userService.updateUserPic(userPic);
        if(num==0)return new Result(null,0,"修改失败");
        return new Result(null,1,"修改成功");
    }

    @PatchMapping("/updatePassword")
    public Result updateUserPassword(HttpServletRequest request, @RequestBody Map<String,String> params){
        Integer num = userService.updateUserPassword(params,request);
        if(num==0)return new Result(null,0,"参数不正确");
        else return new Result(null,1,"修改成功");
    }
}
