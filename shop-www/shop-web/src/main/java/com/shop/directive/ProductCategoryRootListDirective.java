package com.shop.directive;

import com.shop.model.ProductCategory;
import com.shop.service.ProductCategoryService;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.List;
import java.util.Map;


@Component
public class ProductCategoryRootListDirective extends BaseDirective {

    @Autowired
    private ProductCategoryService productCategoryService;

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body)
            throws TemplateException, IOException {

       //获取数据
       List<ProductCategory> productCategories= productCategoryService.findRootList();
        //输出数据
        setVariable(env, body, "productCategories", productCategories);

    }
}
