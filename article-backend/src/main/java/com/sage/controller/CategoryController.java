package com.sage.controller;

import com.sage.domain.Category;
import com.sage.domain.Result;
import com.sage.server.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @PostMapping
    public Result addCategory(@RequestBody @Validated Category category){//为什么没有拦截成功
        Integer num = categoryService.addCategory(category);
        if(num==0) return new Result(null,0,"添加失败");
        else return new Result(null,1,"添加成功");
    }

    @GetMapping
    public Result getAll(){
        List<Category> categories = categoryService.getAll();
        return new Result(categories,1,"查询成功");
    }

    @GetMapping("/{id}")
    public Result getById(@PathVariable  Integer id){
        Category category = categoryService.getById(id);
        return new Result(category,1,"查询成功");
    }

    @PutMapping
    public Result updateCategory(@RequestBody @Validated Category category){
        Integer num = categoryService.updateCategory(category);
        if(num==0)return new Result(null,0,"修改失败");
        return new Result(null,1,"修改成功");
    }

    @DeleteMapping("/{id}")
    public Result deleteCategory(@PathVariable Integer id){
        Integer num = categoryService.deleteCategory(id);
        return new Result(null,1,"删除成功");
    }
}
