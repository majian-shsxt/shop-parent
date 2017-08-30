package com.shop.base;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import org.apache.commons.lang3.StringUtils;


/**
 * 分页属性
 */
public class BaseDto {
    private Integer page;//当前页
    private Integer pageSize;//每页多少条
    private String sort;//排序

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public PageBounds buildPageBounds() {
        if (this.page == null || this.page < 1) {
            this.page = 1;
        }
        if (this.pageSize == null || this.pageSize < 1) {
            this.pageSize = 10;
        }
        if (StringUtils.isBlank(sort)) {
            sort = "id.DESC"; // 数据库字段.desc/asc
        }
        PageBounds pageBounds = new PageBounds(page, pageSize, Order.formString(sort));
        return pageBounds;
    }
}
