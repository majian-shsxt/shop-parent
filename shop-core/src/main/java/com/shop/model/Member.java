package com.shop.model;

import com.shop.base.BaseModel;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
public class Member extends BaseModel {


	private static final long serialVersionUID = 7621775506015985676L;


	/** 用户名 */
	private String username;

	/** 密码 */
	private String password;

	/** E-mail */
	private String email;

	/** 昵称 */
	private String nickname;

	/** 积分 */
	private Long point;

	/** 余额 */
	private BigDecimal balance;

	/** 消费金额 */
	private BigDecimal amount;

	/** 是否启用 */
	private Boolean isEnabled;

	/** 是否锁定 */
	private Boolean isLocked;

	/** 连续登录失败次数 */
	private Integer loginFailureCount;

	/** 锁定日期 */
	private Date lockedDate;

	/** 注册IP */
	private String registerIp;

	/** 最后登录IP */
	private String loginIp;

	/** 最后登录日期 */
	private Date loginDate;

	/** 姓名 */
	private String name;

	/** 性别 */
	private int gender;

	/** 出生日期 */
	private Date birth;

	/** 地址 */
	private String address;

	/** 邮编 */
	private String zipCode;

	/** 电话 */
	private String phone;

	/** 手机 */
	private String mobile;

	/** 登录插件ID */
	private String loginPluginId;

	/** openID */
	private String openId;

	/** 锁定KEY */
	private String lockKey;

	/** 会员注册项值0 */
	private String attributeValue0;

	/** 会员注册项值1 */
	private String attributeValue1;

	/** 会员注册项值2 */
	private String attributeValue2;

	/** 会员注册项值3 */
	private String attributeValue3;

	/** 会员注册项值4 */
	private String attributeValue4;

	/** 会员注册项值5 */
	private String attributeValue5;

	/** 会员注册项值6 */
	private String attributeValue6;

	/** 会员注册项值7 */
	private String attributeValue7;

	/** 会员注册项值8 */
	private String attributeValue8;

	/** 会员注册项值9 */
	private String attributeValue9;
	
	/**
	 * 排名类型
	 */
	public int memberRank;




}
