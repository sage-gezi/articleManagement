package com.sage;

import com.sage.utils.MD5Util;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class md5test {

    @Test
    public void testMd5(){
        String password="123456";
        System.out.println(MD5Util.md5Lower(password).equals("e10adc3949ba59abbe56e057f20f883e"));
    }
}
