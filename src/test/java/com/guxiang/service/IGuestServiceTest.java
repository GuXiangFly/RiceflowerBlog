package com.guxiang.service;

import com.guxiang.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import com.guxiang.pojo.Guest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class IGuestServiceTest extends BaseTest {

    @Autowired
    private IGuestService iGuestService;

    @Test
    public void queryOneByCondition(){
        Guest guest = new Guest();
        Map<String, Object> condition = new HashMap<>();
        condition.put("nickname","呵呵");
        guest = iGuestService.queryOneByCondition(condition);
        printResultStr("queryOneByCondition",null,guest);
    }

    @Test
    public void queryAll(){
        List<Guest> guestList = iGuestService.getAllGuests();
        printResultStr("queryAll",null,guestList);
    }
}
