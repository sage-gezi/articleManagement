package com.sage.server.impl;

import com.sage.dao.CategoryDao;
import com.sage.domain.Category;
import com.sage.server.CategoryService;
import com.sage.utils.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryDao categoryDao;
    @Override
    public Integer addCategory(Category category) {
        Map<String,Object> claims = ThreadLocalUtil.get();
        Integer id = (Integer) claims.get("id");
        category.setCreateUserId(id);
        category.setCreateTime(LocalDateTime.now());
        category.setUpdateTime(LocalDateTime.now());
        Integer num = categoryDao.addCategory(category);
        return num;
    }

    @Override
    public Category getById(Integer id) {
        Category category = categoryDao.getById(id);
        return category;
    }

    @Override
    public List<Category> getAll() {
        Map<String,Object> claims = ThreadLocalUtil.get();
        Integer id = (Integer) claims.get("id");
        List<Category> categories = categoryDao.getAll(id);
        return categories;
    }

    @Override
    public Integer updateCategory(Category category) {
        category.setUpdateTime(LocalDateTime.now());
        Integer num = categoryDao.updateCategory(category);
        return num;
    }

    @Override
    public Integer deleteCategory(Integer id) {
        Integer num = categoryDao.deleteCategory(id);
        return num;
    }
}
