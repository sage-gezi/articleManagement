package com.sage.server;
import com.sage.domain.Result;
import com.sage.domain.User;
import jakarta.servlet.http.HttpServletRequest;

import java.util.List;
import java.util.Map;

public interface UserService {

    public User getByName(String username);

    public Integer register(String username,String password);

    public Integer updateUserInfo(User user);

    public Integer updateUserPassword(Map<String,String> params, HttpServletRequest request);

    public String Login(String username,String password);

    Integer updateUserPic(String userPic);
}
