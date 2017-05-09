package com.guxiang.service;

import com.guxiang.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import com.guxiang.pojo.Authors;
import com.guxiang.util.MDUtil;

import java.security.NoSuchAlgorithmException;

/**
 * Created by guxinag  .
 */
public class IUserServiceTest extends BaseTest {
    @Autowired
    private IUserService userService;

    // 获取当前方法名
    // new Throwable().getStackTrace()[0].getMethodName();

    @Test
    @Rollback(value = false)
    public void testAddAuthors() throws NoSuchAlgorithmException {
        String userName = "test";
        String userPass = "test123";
        String pass = MDUtil.generatePass(userName, userPass);
        int userStatus = 1;
        Authors authors = new Authors(userName,pass,userStatus);
        Integer result = userService.authorsAdd(authors);
        methodName=new Throwable().getStackTrace()[0].getMethodName();
        printResultStr(methodName, null,result);
    }
    @Test
    public void testEditAuthorsStatus(){
        Boolean result = userService.authorsEditStatus(1, 0);
        methodName=new Throwable().getStackTrace()[0].getMethodName();
        printResultStr(methodName, null,result);
    }

    @Test
    public void testGetAuthorsById() throws Exception {
        Authors result = userService.authorsGetById(1);
        methodName=new Throwable().getStackTrace()[0].getMethodName();
        printResultStr(methodName, null,result);
    }

    @Test
    public void testGetAuthorsByAccount() throws Exception {
        Authors result = userService.authorsGetByAccount("panhainan");
        methodName=new Throwable().getStackTrace()[0].getMethodName();
        printResultStr(methodName, null,result);
    }

    @Test
    public void testGetAuthorsByEmail() throws Exception {
        Authors result = userService.authorsGetByEmail("panhainan@yeah.net");
        methodName=new Throwable().getStackTrace()[0].getMethodName();
        printResultStr(methodName, null,result);
    }
}
