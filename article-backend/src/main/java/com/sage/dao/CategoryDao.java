package com.sage.dao;

import com.sage.domain.Category;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CategoryDao {
    @Select("select * from category where createUserId=#{id}")
    public List<Category> getAll(Integer id);
    @Insert("insert into category (categoryName, categoryAlias, createUserId, createTime, updateTime) values (#{categoryName},#{categoryAlias},#{createUserId},#{createTime},#{updateTime})")
    public Integer addCategory(Category category);
    @Select("select * from category where id=#{id}")
    public Category getById(Integer id);
    @Update("update category set updateTime=#{updateTime},categoryName=#{categoryName},categoryAlias=#{categoryAlias} where id=#{id}")
    public Integer updateCategory(Category category);
    @Delete("delete from category where id=#{id}")
    public Integer deleteCategory(Integer id);
}
