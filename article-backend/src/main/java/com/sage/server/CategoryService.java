package com.sage.server;

import com.sage.domain.Category;

import java.util.List;

public interface CategoryService {
    public Integer addCategory(Category category);

    public List<Category> getAll();

    public Category getById(Integer id);

    public Integer updateCategory(Category category);

    public Integer deleteCategory(Integer id);
}
