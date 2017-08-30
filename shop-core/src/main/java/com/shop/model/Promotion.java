package com.shop.model;

import com.shop.base.BaseModel;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;


/**
 * Entity - 促销
 */
@Setter
@Getter
@SuppressWarnings("serial")
public class Promotion extends BaseModel {

	/** 名称 */
	private String name;

	/** 标题 */
	private String title;

	/** 图片 */
	private String image;

	/** 起始日期 */
	private Date beginDate;

	/** 结束日期 */
	private Date endDate;

	/** 最小商品价格 */
	private BigDecimal minimumPrice;

	/** 最大商品价格 */
	private BigDecimal maximumPrice;

	/** 最小商品数量 */
	private Integer minimumQuantity;

	/** 最大商品数量 */
	private Integer maximumQuantity;

	/** 价格运算表达式 */
	private String priceExpression;

	/** 积分运算表达式 */
	private String pointExpression;

	/** 是否免运费 */
	private Boolean isFreeShipping;

	/** 是否允许使用优惠券 */
	private Boolean isCouponAllowed;

	/** 介绍 */
	private String introduction;

	private Integer orders;

}
