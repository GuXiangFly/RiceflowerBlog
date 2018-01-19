package com.guxiang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.guxiangfly.riceflowerblog.common.PageConfig;
import cn.guxiangfly.riceflowerblog.common.PageInfoResult;
import cn.guxiangfly.riceflowerblog.dao.IRecommendDao;
import com.guxiang.pojo.Recommend;
import com.guxiang.service.IRecommendService;
import com.guxiang.util.ReturnUtil;

import java.util.Date;
import java.util.List;

/**
 * Created by guxiang  .
 */
@Transactional
@Service("recommendService")
public class RecommendServiceImpl implements IRecommendService {

    @Autowired
    private IRecommendDao iRecommendDao;
    @Override
    public long add(Recommend recommend) {
        recommend.setHits(0);
        recommend.setPubTime(new Date());
        Integer result = iRecommendDao.insert(recommend);
        if (ReturnUtil.returnResult(result)){
            return recommend.getId();
        }
        return 0;
    }

    @Override
    public long edit(Recommend recommend) {
        Integer result = iRecommendDao.update(recommend);
        if(ReturnUtil.returnResult(result)){
            return recommend.getId();
        }
        return 0;
    }

    @Override
    public boolean remove(long id) {
        Integer result = iRecommendDao.delete(id);
        return ReturnUtil.returnResult(result);
    }

    @Override
    public PageInfoResult<Recommend> list(PageConfig pageConfig,Recommend recommend) {
        List<Recommend> list = iRecommendDao.selectBy(recommend,pageConfig);
        int counts = iRecommendDao.selectCountBy(recommend);
        PageInfoResult<Recommend> pageInfoResult = new PageInfoResult<>(list,pageConfig,counts);
        return pageInfoResult;
    }

    @Override
    public boolean hits(Long id) {
        Recommend recommend = iRecommendDao.selectById(id);
        recommend.setHits(recommend.getHits()+1);
        iRecommendDao.updateHits(recommend);
        return false;
    }

    @Override
    public Recommend get(long id) {
        return iRecommendDao.selectById(id);
    }
}
