package cn.guxiangfly.riceflowerblog.controller;

import cn.guxiangfly.riceflowerblog.common.CommonConstant;
import cn.guxiangfly.riceflowerblog.common.CommonResult;
import com.alibaba.fastjson.JSON;
import cn.guxiangfly.riceflowerblog.pojo.Guest;
import cn.guxiangfly.riceflowerblog.service.IGuestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
