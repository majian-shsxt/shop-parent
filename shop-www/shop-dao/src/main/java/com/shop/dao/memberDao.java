package com.shop.dao;

import com.shop.model.Member;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface memberDao {


    @Select("select id, username from xx_member where ${column} = #{value}")
    Member findByColumn(@Param(value = "column") String column, @Param(value = "value")String value);
}
