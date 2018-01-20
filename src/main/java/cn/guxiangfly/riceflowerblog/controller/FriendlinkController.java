package cn.guxiangfly.riceflowerblog.controller;

import cn.guxiangfly.riceflowerblog.common.CommonConstant;
import cn.guxiangfly.riceflowerblog.common.CommonResult;
import cn.guxiangfly.riceflowerblog.common.PageConfig;
import cn.guxiangfly.riceflowerblog.common.PageInfoResult;
import cn.guxiangfly.riceflowerblog.pojo.Friendlink;
import cn.guxiangfly.riceflowerblog.service.IFriendlinkService;
import cn.guxiangfly.riceflowerblog.util.ExecuteSecurity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by guxiang  .
 */
@RequestMapping(value = "")
@RestController
public class FriendlinkController {

    @Autowired
    private IFriendlinkService iFriendlinkService;


    @GetMapping(value = "/friendlink")
    public CommonResult list() {
        List<Friendlink> list = iFriendlinkService.list();
        return new CommonResult(CommonConstant.SUCCESS_CODE, null, list);
    }


    @GetMapping(value = "/friendlink/hits")
    public CommonResult hits(Integer id) {
        iFriendlinkService.hits(id);
        return new CommonResult(CommonConstant.SUCCESS_CODE, null);
    }




    @ExecuteSecurity
    @GetMapping(value = "/manage/friendlink")
    public CommonResult pagingList(PageConfig pageConfig) {
        PageInfoResult<Friendlink> list = iFriendlinkService.pagingList(pageConfig);
        return new CommonResult(CommonConstant.SUCCESS_CODE, null, list);
    }

    @ExecuteSecurity
    @GetMapping(value = "/manage/friendlink/{fId}")
    public CommonResult get(@PathVariable("fId")int fId) {
        String message= null;
        boolean isSuccess=true;
        Friendlink friendlink = null;
        try {
            friendlink  = iFriendlinkService.get(fId);
        }catch (Exception e){
            isSuccess = false;
            message = e.getMessage();
        }finally {
            if(isSuccess){
                return new CommonResult(CommonConstant.SUCCESS_CODE,message,friendlink);
            }else{
                return new CommonResult(CommonConstant.FAIL_CODE,message);
            }
        }
    }
    @ExecuteSecurity
    @DeleteMapping(value = "/manage/friendlink/{fId}")
    public CommonResult delete(@PathVariable("fId")int fId) {
        String message= null;
        boolean isSuccess=true;
        try {
            isSuccess  = iFriendlinkService.delete(fId);
        }catch (Exception e){
            isSuccess = false;
            message = e.getMessage();
        }finally {
            if(isSuccess){
                return new CommonResult(CommonConstant.SUCCESS_CODE,message);
            }else{
                return new CommonResult(CommonConstant.FAIL_CODE,message);
            }

        }
    }

    @ExecuteSecurity
    @PostMapping(value = "/manage/friendlink/save")
    public CommonResult add(@RequestBody Friendlink friendlink) {
        String message= null;
        boolean isSuccess=true;
        try {
            isSuccess  = iFriendlinkService.add(friendlink);
        }catch (Exception e){
            isSuccess = false;
            message = e.getMessage();
        }finally {
            if(isSuccess){
                return new CommonResult(CommonConstant.SUCCESS_CODE,message);
            }else{
                return new CommonResult(CommonConstant.FAIL_CODE,message);
            }

        }
    }
    @ExecuteSecurity
    @PutMapping(value = "/manage/friendlink/update")
    public CommonResult update(@RequestBody Friendlink friendlink) {
        String message= null;
        boolean isSuccess=true;
        try {
            isSuccess  = iFriendlinkService.update(friendlink);
        }catch (Exception e){
            isSuccess = false;
            message = e.getMessage();
        }finally {
            if(isSuccess){
                return new CommonResult(CommonConstant.SUCCESS_CODE,message);
            }else{
                return new CommonResult(CommonConstant.FAIL_CODE,message);
            }

        }
    }
}
