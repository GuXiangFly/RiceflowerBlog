package cn.guxiangfly.riceflowerblog.dao;

import cn.guxiangfly.riceflowerblog.pojo.Project;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import cn.guxiangfly.riceflowerblog.common.PageConfig;

import java.util.List;

/**
 * Created by guxiang  .
 */
@Mapper
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