package cn.guxiangfly.riceflowerblog.service.impl;

import cn.guxiangfly.riceflowerblog.common.CommonConstant;
import cn.guxiangfly.riceflowerblog.dao.IArticleDao;
import cn.guxiangfly.riceflowerblog.dao.ICategoryDao;
import cn.guxiangfly.riceflowerblog.pojo.Category;
import cn.guxiangfly.riceflowerblog.service.IBCategoryService;
import cn.guxiangfly.riceflowerblog.util.ReturnUtil;
import cn.guxiangfly.riceflowerblog.vo.CategoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by guxiang  .
 */
@Service("categoryService")
public class BCategoryServiceImpl implements IBCategoryService {
    @Autowired
    private ICategoryDao iCategoryDao;
    @Autowired
    private IArticleDao iArticleDao;
    @Override
    public Boolean add(Category category) {
        Category tempCategory = iCategoryDao.selectByName(category.getName(),CommonConstant.PROJECT_ALL);
        if(null!=tempCategory){
            return false;
        }
        Integer result = iCategoryDao.insert(category);
        return ReturnUtil.returnResult(result);
    }

    @Override
    public Boolean edit(Category category) {
        Category tempCategory = iCategoryDao.selectById(category.getId(),CommonConstant.PROJECT_ALL);
        if(null==tempCategory){
            return false;
        }
        Integer result = iCategoryDao.update(category);
        return ReturnUtil.returnResult(result);
    }

    @Override
    public Boolean deleteById(int categoryId) {
        Category cIdCategory = iCategoryDao.selectById(categoryId,CommonConstant.PROJECT_ALL);
        if (cIdCategory.getName().equals(CommonConstant.NEW_NO_NAME_CATEGORY)) {
            return false;
        } else {
            Category cNameCategory = iCategoryDao
                    .selectByName(CommonConstant.NEW_NO_NAME_CATEGORY,CommonConstant.PROJECT_ALL);
            Integer newCategoryId = null;
            if (cNameCategory == null) {
                Category newCategory = new Category();
                newCategory.setName(CommonConstant.NEW_NO_NAME_CATEGORY);
                newCategory
                        .setParentId(CommonConstant.CATEGORY_DEFAULT_PARENT_ID);
                Integer result = iCategoryDao.insert(newCategory);
                newCategoryId = newCategory.getId();
            } else {
                newCategoryId = cNameCategory.getId();
            }
            Integer result1 = iArticleDao.updateCategoryId(categoryId,
                    newCategoryId);
            Integer result2 = iCategoryDao.deleteById(categoryId);
            return ReturnUtil.returnResult(result2);
        }

        // 下面的代码是为多级目录准备的，但是此次已经舍弃多级目录
		/*
		 * Category c = iCategoryDao.selectById(categoryId); Integer result =
		 * null; if (c != null && c.getAuthorId() == categoryAuthorId) { if
		 * (c.getParentId() == 0) { // 根级别目录 result = iCategoryDao.deleteBy(1,
		 * categoryId); } result += iCategoryDao.deleteById(categoryId); return
		 * returnResult(result); } else { // categoryId不存在或者没有权限 return false; }
		 */
    }

    @Override
    public List<Category> getAllBy() {
        List<Category> result = iCategoryDao.selectBy();
        return result;
    }

    @Override
    public List<CategoryVo> getAllVoBy(Integer articleStatus, boolean status) {
        List<CategoryVo> result = iCategoryDao.selectVoBy(articleStatus,status);
        return result;
    }

    @Override
    public Category getById(int categoryId,boolean status) {
        Category result = iCategoryDao.selectById(categoryId,status);
        return result;
    }

}
