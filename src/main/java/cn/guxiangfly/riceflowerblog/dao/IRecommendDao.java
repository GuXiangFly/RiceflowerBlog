package cn.guxiangfly.riceflowerblog.dao;

import cn.guxiangfly.riceflowerblog.pojo.Recommend;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import cn.guxiangfly.riceflowerblog.common.PageConfig;


import java.util.List;

/**
 * Created by guxiang  .
 */
@Mapper
@Repository("iRecommendDao")
public interface IRecommendDao {

    Integer insert(Recommend recommend);

    Integer delete(@Param("id") Long recommendId);

    Integer update(Recommend recommend);

    Integer updateHits(Recommend recommend);

    List<Recommend> selectBy(@Param("recommend") Recommend recommend,
                             @Param("pageConfig") PageConfig pageConfig);

    Integer selectCountBy(@Param("recommend") Recommend recommend);

    Recommend selectById(@Param("id") Long id);
}
