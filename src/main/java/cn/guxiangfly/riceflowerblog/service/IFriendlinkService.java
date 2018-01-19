package cn.guxiangfly.riceflowerblog.service;

import cn.guxiangfly.riceflowerblog.common.PageConfig;
import cn.guxiangfly.riceflowerblog.common.PageInfoResult;
import cn.guxiangfly.riceflowerblog.pojo.Friendlink;

import java.util.List;

/**
 * Created by guxiang  .
 */
public interface IFriendlinkService {

    /**
     * 添加
     * @param friendlink
     * @return 操作结果
     */
    boolean add(Friendlink friendlink);

    /**
     * 分页获取
     * @param pageConfig
     * @return 分页结果
     */
    PageInfoResult<Friendlink> pagingList(PageConfig pageConfig);

    /**
     * 获取所有
     * @return 所有记录
     */
    List<Friendlink> list();

    Friendlink get(int fId);

    boolean delete(int fId);

    boolean update(Friendlink friendlink);

    boolean hits(int id);
}
