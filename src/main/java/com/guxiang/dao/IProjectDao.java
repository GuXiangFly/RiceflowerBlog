package com.guxiang.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.guxiang.common.PageConfig;
import com.guxiang.pojo.Project;

import java.util.List;

/**
 * Created by guxiang  .
 */
@Repository("iProjectDao")
public interface IProjectDao {

    Integer insert(Project project);

    Integer delete(@Param("id") Long projectId);

    Integer update(Project project);

    Integer updateHits(Project project);

    List<Project> selectBy(@Param("project") Project project,
                           @Param("pageConfig") PageConfig pageConfig);

    Integer selectCountBy(@Param("project") Project project);

    Project selectById(@Param("id") Long id, @Param("status") boolean status);

}
