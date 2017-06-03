package com.guxiang.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.guxiang.common.CommonConstant;
import com.guxiang.common.CommonResult;
import com.guxiang.pojo.Guest;
import com.guxiang.service.IGuestService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guxinag  .
 */
@Controller
@RequestMapping("/guest")
public class GuestController {
    @Autowired
    private IGuestService guestService;

    @ResponseBody
    @RequestMapping("/getAllGuests")
    public CommonResult getAllGuests(){
        List<Guest> guestList = guestService.getAllGuests();
        return  new CommonResult(CommonConstant.SUCCESS_CODE,null,guestList);
    }

    @ResponseBody
    @RequestMapping(value = "/getGuestByEmail",method = {RequestMethod.POST})
    public CommonResult getGuestByEmail(String email){
        Map<String,Object> condition = new HashMap<>();
        condition.put("email",email);
        Guest guest = guestService.queryOneByCondition(condition);
        return  new CommonResult(CommonConstant.SUCCESS_CODE,null,guest);
    }

    @ResponseBody
    @RequestMapping("/addGuest")
    public CommonResult addGuest(String json){
        Guest guest = JSON.parseObject(json,Guest.class);
        int result = guestService.addGuest(guest);
        return  new CommonResult(CommonConstant.SUCCESS_CODE,null,result);
    }

    @ResponseBody
    @RequestMapping("/updateGuest")
    public CommonResult updateGuest(String json){
        Guest guest = JSON.parseObject(json,Guest.class);
        int result = guestService.updateGuest(guest);
        return  new CommonResult(CommonConstant.SUCCESS_CODE,null,result);
    }

}
