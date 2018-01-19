package cn.guxiangfly.riceflowerblog.service;

import cn.guxiangfly.riceflowerblog.common.PageConfig;
import cn.guxiangfly.riceflowerblog.common.PageInfoResult;
import cn.guxiangfly.riceflowerblog.pojo.Recommend;

/**
 * Created by guxiang  .
 */
public interface IRecommendService {

    long add(Recommend recommendVo);
    long edit(Recommend recommendVo);
    boolean remove(long id);
    PageInfoResult<Recommend> list(PageConfig pageConfig, Recommend recommend);
    boolean hits(Long id);

    Recommend get(long id);
}
