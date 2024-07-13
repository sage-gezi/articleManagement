package com.sage.controller;

import com.sage.domain.Article;
import com.sage.domain.PageBean;
import com.sage.domain.Result;
import com.sage.server.ArticleService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;

//    @GetMapping
//    public Result getAll(){
//        List<Article> all = articleService.getAll();
//        return new Result(all,1,"获取成功");
//    }

    @PostMapping
    public Result addArticle(@RequestBody Article article){
        articleService.addArticle(article);
        return new Result(null,1,"添加成功");
    }

    @GetMapping
    public Result pageList(Integer pageNum, Integer pageSize,
                           @RequestParam(required = false) String categoryId,
                           @RequestParam(required = false)String state){
        PageBean pb = articleService.pageList(pageNum,pageSize,categoryId,state);
        return new Result(pb,1,"查询成功");
    }

    @GetMapping("/detail/{id}")
    public Result getArticle(@PathVariable Integer id){
        Article article = articleService.getArticle(id);
        return new Result(article,1,"获取成功");
    }

    @PutMapping
    public Result updateArticle(@RequestBody Article article){
        Integer num = articleService.updateArticle(article);
        System.out.println(article);
        return new Result(null,1,"修改成功");
    }

    @DeleteMapping("/{id}")
    public Result deleteArticle(@PathVariable Integer id){
        Integer num = articleService.deleteArticle(id);
        return new Result(null,1,"删除成功");
    }
}
