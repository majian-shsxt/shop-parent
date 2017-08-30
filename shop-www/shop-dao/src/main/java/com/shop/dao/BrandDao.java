package com.shop.dao;

import com.shop.model.Brand;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by TW on 2017/8/24.
 */
public interface BrandDao {

    @Select("SELECT id,`name` FROM xx_brand t1 LEFT JOIN xx_product_category_brand t2 " +
            " on t1.id = t2.brands where t2.product_categories = #{productCategoryId} " +
            " ORDER BY orders LIMIT 5")
    List<Brand> findProductCategoryBrands(@Param(value = "productCategoryId") Integer productCategoryId);
}
