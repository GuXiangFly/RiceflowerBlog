package cn.guxiangfly.riceflowerblog.pojo;

/**
 * Created by guxiang  .
 */
public class RecommendContent {
    private int id;
    private String content;

    public RecommendContent() {
    }

    public RecommendContent(String content) {
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
