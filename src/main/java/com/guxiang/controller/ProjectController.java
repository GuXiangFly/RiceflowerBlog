package com.guxiang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import cn.guxiangfly.riceflowerblog.common.CommonConstant;
import cn.guxiangfly.riceflowerblog.common.CommonResult;
import cn.guxiangfly.riceflowerblog.common.PageConfig;
import cn.guxiangfly.riceflowerblog.common.PageInfoResult;
import com.guxiang.pojo.Project;
import com.guxiang.service.IProjectService;
import com.guxiang.util.ExecuteSecurity;

import java.util.List;

/**
 * Created by guxiang  .
 */
@Controller
@RequestMapping(value = "")
public class ProjectController {
    @Autowired
    private IProjectService iProjectService;
    @ResponseBody
    @RequestMapping(value = "/project",method = RequestMethod.GET)
    public CommonResult list(){
        List<Project> list = iProjectService.list(CommonConstant.PROJECT_PUBLIC);
        return new CommonResult(CommonConstant.SUCCESS_CODE,null,list);
    }

    @ResponseBody
    @RequestMapping(value = "/project/hits",method = RequestMethod.POST)
    public CommonResult hits(Long id){
        iProjectService.hits(id);
        return new CommonResult(CommonConstant.SUCCESS_CODE,null);
    }


    @ExecuteSecurity
    @ResponseBody
    @RequestMapping(value = "/manage/project",method = RequestMethod.POST)
    public CommonResult mlist(PageConfig pageConfig){
        PageInfoResult<Project> list = iProjectService.list(pageConfig,null);
        return new CommonResult(CommonConstant.SUCCESS_CODE,null,list);
    }
    @ExecuteSecurity
    @ResponseBody
    @RequestMapping(value = "/manage/project/{id}",method = RequestMethod.GET)
    public CommonResult get(@PathVariable long id){
        Project project = iProjectService.get(id,CommonConstant.PROJECT_ALL);
        return new CommonResult(CommonConstant.SUCCESS_CODE,null,project);
    }
    @ExecuteSecurity
    @ResponseBody
    @RequestMapping(value = "/manage/project/save",method = RequestMethod.POST)
    public CommonResult add(@RequestBody Project project){
        long id  = iProjectService.add(project);
        return new CommonResult(CommonConstant.SUCCESS_CODE,null,id);
    }
    @ExecuteSecurity
    @ResponseBody
    @RequestMapping(value = "/manage/project/update",method = RequestMethod.PUT)
    public CommonResult edit(@RequestBody Project project){
        long id  = iProjectService.edit(project);
        return new CommonResult(CommonConstant.SUCCESS_CODE,null,id);
    }
    @ExecuteSecurity
    @ResponseBody
    @RequestMapping(value = "/manage/project/{id}",method = RequestMethod.DELETE)
    public CommonResult edit(@PathVariable long id){
        iProjectService.remove(id);
        return new CommonResult(CommonConstant.SUCCESS_CODE,null);
    }













}
