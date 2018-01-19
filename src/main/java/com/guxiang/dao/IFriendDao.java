package com.guxiang.dao;

import cn.guxiangfly.riceflowerblog.common.PageConfig;
import com.guxiang.pojo.Friendlink;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guxiang  .
 */
@Repository("iFriendDao")
public interface IFriendDao {

    Friendlink selectById(@Param("id") Integer fId);

    int deleteById(@Param("id") Integer fId);

    int insert(Friendlink friendlink);

    int update(Friendlink friendlink);

    List<Friendlink> selectBy(@Param("pageConfig") PageConfig pageConfig);

    int selectCountBy();

    int updateHits(Friendlink friendlink);
}
