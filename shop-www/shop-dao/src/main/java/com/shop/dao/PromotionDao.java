package com.shop.dao;

import com.shop.model.Promotion;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by TW on 2017/8/25.
 */
//促销
public interface PromotionDao {

    @Select("SELECT id, `name`, image FROM xx_promotion t1 " +
            " LEFT JOIN xx_product_category_promotion t2 on t1.id = t2.promotions " +
            " where t2.product_categories = #{productCategoryId} ORDER BY orders limit #{limit}")
    List<Promotion> findProductCategoryPromotions(@Param(value = "productCategoryId") Integer productCategoryId,
                                                  @Param(value = "limit") Integer limit);



}
