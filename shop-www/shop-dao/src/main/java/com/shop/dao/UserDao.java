package com.shop.dao;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.shop.model.User;
import org.apache.ibatis.annotations.Select;

public interface UserDao {

   @Select("select * from t_user")
    PageList<User> find(PageBounds pageBounds);
}
