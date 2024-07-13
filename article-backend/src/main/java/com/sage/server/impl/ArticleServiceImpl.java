package com.sage.server.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sage.dao.ArticleDao;
import com.sage.domain.Article;
import com.sage.domain.PageBean;
import com.sage.server.ArticleService;
import com.sage.utils.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleDao articleDao;
    @Override
    public List<Article> getAll() {
        return articleDao.getAll();
    }

    @Override
    public Integer addArticle(Article article) {
        article.setCreateTime(LocalDateTime.now());
        article.setUpdateTime(LocalDateTime.now());
        Map<String,Object> claims = ThreadLocalUtil.get();
        Integer createUserId = (Integer) claims.get("id");
        article.setCreateUserId(createUserId);
        articleDao.addArticle(article);
        return 1;
    }

    @Override
    public PageBean pageList(Integer pageNum, Integer pageSize, String categoryId, String state) {
        PageBean pageBean = new PageBean();
        PageHelper.startPage(pageNum,pageSize);
        Map<String,Object> claims = ThreadLocalUtil.get();
        Integer createUserId = (Integer) claims.get("id");
        List<Article> list = articleDao.pageList(createUserId,categoryId,state);
        Page<Article> as = (Page<Article>) list;
        pageBean.setItems(as.getResult());
        pageBean.setTotal(as.getTotal());
        return pageBean;
    }

    @Override
    public Article getArticle(Integer id) {
        Article article = articleDao.getArticle(id);
        return article;
    }

    @Override
    public Integer updateArticle(Article article) {
        article.setUpdateTime(LocalDateTime.now());
        Integer num = articleDao.updateArticle(article);
        return num;
    }

    @Override
    public Integer deleteArticle(Integer id) {
        Integer num = articleDao.deleteArticle(id);
        return num;
    }
}
