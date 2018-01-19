package cn.guxiangfly.riceflowerblog.dao;

import cn.guxiangfly.riceflowerblog.pojo.Category;
import cn.guxiangfly.riceflowerblog.vo.CategoryVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import java.util.List;

/**
 * Created by guxiang  .
 */
@Mapper
@Repository("iCategoryDao")
public interface ICategoryDao {

    /**
     * 插入类别
     *
     * @param category 类别（name,description）
     * @return 受影响的行数
     */
    Integer insert(Category category);

    /**
     * 更新类别
     *
     * @param category 类别（id,name,description）
     * @return 受影响的行数
     */
    Integer update(Category category);

    /**
     * 删除类别
     *
     * @param categoryIds 类别id集合
     * @return 受影响的行数
     */
    Integer delete(@Param("ids") List<Integer> categoryIds);

    /**
     * 通过id删除类别
     *
     * @param categoryId 类别id
     * @return 受影响的行数
     */
    Integer deleteById(@Param("id") Integer categoryId);


    /**
     * 通过类别id查找
     *
     * @param categoryId 类别id
     * @return Category
     */
    Category selectById(@Param("id") Integer categoryId, @Param("status") Boolean status);

    /**
     * 查找所有
     *
     * @return
     */
    List<Category> selectBy();
    Category selectByCode(@Param("code") String categoryCode, @Param("status") Boolean status);

    Category selectByName(@Param("name") String categoryName, @Param("status") Boolean status);

    List<CategoryVo> selectVoBy(@Param("articleStatus") Integer articleStatus, @Param("status") Boolean status);

}
