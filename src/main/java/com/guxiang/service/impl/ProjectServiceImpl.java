package com.guxiang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.guxiang.common.CommonConstant;
import com.guxiang.common.PageConfig;
import com.guxiang.common.PageInfoResult;
import com.guxiang.dao.IProjectDao;
import com.guxiang.pojo.Project;
import com.guxiang.service.IProjectService;
import com.guxiang.util.ReturnUtil;

import java.util.Date;
import java.util.List;

/**
 * Created by guxiang  .
 */
@Transactional
@Service("projectService")
public class ProjectServiceImpl implements IProjectService {

    @Autowired
    private IProjectDao iProjectDao;

    @Override
    public long add(Project project) {
        project.setHits(0);
        project.setPubTime(new Date());
        Integer result = iProjectDao.insert(project);
        if (ReturnUtil.returnResult(result)){
            return project.getId();
        }
        return 0;
    }

    @Override
    public long edit(Project project) {
        Integer result = iProjectDao.update(project);
        if(ReturnUtil.returnResult(result)){
            return project.getId();
        }
        return 0;
    }

    @Override
    public boolean remove(long id) {
        Integer result = iProjectDao.delete(id);
        return ReturnUtil.returnResult(result);
    }

    @Override
    public List<Project> list(boolean status) {
        return iProjectDao.selectBy(new Project(status),null);
    }

    @Override
    public PageInfoResult<Project> list(PageConfig pageConfig, Project project) {
        List<Project> list = iProjectDao.selectBy(project,pageConfig);
        int counts = iProjectDao.selectCountBy(project);
        PageInfoResult<Project> pageInfoResult = new PageInfoResult<>(list,pageConfig,counts);
        return pageInfoResult;
    }

    @Override
    public boolean hits(Long id) {
        Project project = iProjectDao.selectById(id, CommonConstant.PROJECT_ALL);
        project.setHits(project.getHits()+1);
        iProjectDao.updateHits(project);
        return false;
    }

    @Override
    public Project get(long id,boolean status) {
        return iProjectDao.selectById(id,status);
    }
}
