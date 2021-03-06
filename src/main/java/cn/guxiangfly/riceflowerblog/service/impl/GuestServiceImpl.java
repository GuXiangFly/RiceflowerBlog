package cn.guxiangfly.riceflowerblog.service.impl;

import cn.guxiangfly.riceflowerblog.dao.IGuestDao;
import cn.guxiangfly.riceflowerblog.pojo.Guest;
import cn.guxiangfly.riceflowerblog.service.IGuestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by guxinag  .
 */
@Service("guestService")
public class GuestServiceImpl implements IGuestService{

    @Autowired
    private IGuestDao guestDao;

    @Override
    public List<Guest> getAllGuests() {
        return guestDao.queryAll();
    }

    @Override
    public Guest queryOneByCondition(Map<String, Object> condition) {
        Guest g =  guestDao.queryOneByCondition(condition);
        return g;
    }

    @Override
    public int addGuest(Guest guest) {
        return guestDao.insert(guest);
    }

    @Override
    public int updateGuest(Guest guest) {
        return guestDao.updateByPrimaryKeySelective(guest);
    }

}
