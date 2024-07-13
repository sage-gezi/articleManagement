package com.sage.dao;

import com.sage.domain.Article;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ArticleDao {
    @Insert("insert into article(title,content,coverImg,state,categoryId,article.createUserId,createTime,updateTime)"+
            "  values(#{title},#{content},#{coverImg},#{state},#{categoryId},#{createUserId},#{createTime},#{updateTime})")
    public Integer insert(Article article);

    @Select("select * from article")
    public List<Article> getAll();
    @Update("UPDATE article " +
            "SET title = #{title}, content = #{content}, coverImg = #{coverImg}, " +
            "state = #{state}, categoryId = #{categoryId}, " +
            "updateTime = #{updateTime} " +
            "WHERE id = #{id}")
    public Integer updateArticle(Article article);
    @Insert("insert into article (title, content, coverImg, state, categoryId, createUserId, createTime, updateTime) VALUES " +
            "(#{title},#{content},#{coverImg},#{state},#{categoryId},#{createUserId},#{createTime},#{updateTime})")
    public Integer addArticle(Article article);

    public List<Article> pageList(Integer createUserId, String categoryId, String state);
    @Select("select * from article where id=#{id}")
    public Article getArticle(Integer id);
    @Delete("delete from article where id=#{id}")
    public Integer deleteArticle(Integer id);
}
