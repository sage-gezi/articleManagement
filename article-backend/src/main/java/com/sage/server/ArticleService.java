package com.sage.server;

import com.sage.domain.Article;
import com.sage.domain.PageBean;

import java.util.List;

public interface ArticleService {
    public List<Article> getAll();

    public Integer addArticle(Article article);

    public PageBean pageList(Integer pageNum, Integer pageSize, String categoryId, String state);

    public Article getArticle(Integer id);

    public Integer updateArticle(Article article);

    public Integer deleteArticle(Integer id);
}
