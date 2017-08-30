package com.shop.service;

import com.shop.constant.Constant;
import com.shop.dao.PromotionDao;
import com.shop.model.Promotion;
import com.shop.util.AssertUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by TW on 2017/8/25.
 */
@Service
public class PromotionService {
    @Autowired
    private PromotionDao promotionDao;

    public List<Promotion> findProductCategoryPromotions(Integer productCategoryId, Integer limit) {
        AssertUtil.intIsNotEmpty(productCategoryId);
        if (limit == null) {
            limit = Constant.TWO;
        }
        List<Promotion> promotions = promotionDao.findProductCategoryPromotions(productCategoryId, limit);
        return promotions;
    }
}
