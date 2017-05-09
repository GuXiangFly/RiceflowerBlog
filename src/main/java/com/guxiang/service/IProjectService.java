package com.guxiang.service;

import com.guxiang.common.PageConfig;
import com.guxiang.common.PageInfoResult;
import com.guxiang.pojo.Project;

import java.util.List;

/**
 * Created by guxiang  .
 */
public interface IProjectService {
    long add(Project project);
    long edit(Project project);
    boolean remove(long id);
    List<Project> list(boolean status);
    PageInfoResult<Project> list(PageConfig pageConfig, Project project);
    boolean hits(Long id);

    Project get(long id, boolean status);
}
