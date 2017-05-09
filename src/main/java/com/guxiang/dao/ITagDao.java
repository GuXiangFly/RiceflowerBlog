package com.guxiang.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.guxiang.pojo.Tag;
import com.guxiang.vo.TagVo;

import java.util.List;

/**
 * Created by guxiang  .
 */
@Repository("iTagDao")
public interface ITagDao {
    /**
     * 插入标签
     * @param tag 标签（name）
     * @return 受影响的行
     */
    Integer insert(Tag tag);

    /**
     * 删除标签
     * @param tagId 标签id
     * @return 受影响的行
     */
    Integer delete(@Param("id") Integer tagId);

    /**
     * 查找所有标签
     * @return List<Tag>
     */
    List<Tag> selectBy();

    /**
     * 通过id查找标签
     * @param tagId 标签id
     * @return Tag
     */
    Tag selectById(@Param("id") Integer tagId);
    /**
     * 通过name查找标签
     * @param tagName 标签名
     * @return Tag
     */
	Tag selectByName(@Param("name") String tagName);

	List<TagVo> selectVoBy(@Param("articleStatus") Integer articleStatus);

	List<Tag> selectByIds(@Param("ids") List<Integer> tagIdList);

	Integer update(Tag tag);
}
