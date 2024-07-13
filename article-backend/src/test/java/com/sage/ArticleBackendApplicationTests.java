package com.sage;

import com.sage.dao.UserDao;
import com.sage.domain.Result;
import com.sage.domain.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class ArticleBackendApplicationTests {
    @Autowired
    private UserDao userDao;


}
