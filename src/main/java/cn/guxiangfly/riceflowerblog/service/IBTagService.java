package cn.guxiangfly.riceflowerblog.service;

import cn.guxiangfly.riceflowerblog.pojo.Tag;
import cn.guxiangfly.riceflowerblog.vo.TagVo;

import java.util.List;

/**
 * Created by guxiang  .
 */
public interface IBTagService {
    /**
     * 添加标签
     *
     * @param tag
     *            标签（name）
     * @return
     */
    Boolean add(Tag tag);

    Boolean edit(Tag tag);

    /**
     * 通过标签id删除标签
     *
     * @param tagId
     *            标签id
     * @return
     */
    Boolean deleteById(int tagId);

    /**
     * 通过标签id获取标签
     *
     * @param tagId
     *            标签id
     * @return
     */
    Tag getById(int tagId);

    /**
     * 通过作者id获取所有标签
     *
     * @return
     */
    List<Tag> getAllBy();

    List<TagVo> getAllVoBy(Integer articleStatus);
}
