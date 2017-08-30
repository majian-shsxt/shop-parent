package com.shop.directive;

import com.shop.model.Brand;
import com.shop.service.BrandService;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by TW on 2017/8/25.
 */
@Component
public class BrandListDirective extends BaseDirective {

    @Autowired
    private BrandService brandService;

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars,
                        TemplateDirectiveBody body)
            throws TemplateException, IOException {

        // 获取参数
Integer productCategoryId=getParamter(params,  "productCategoryId", Integer.class);

        // 获取数据
       List<Brand> brands= brandService.findProductCategoryBrands(productCategoryId);

        // 输出数据
setVariable(env, body, "brands", brands);
    }
}
