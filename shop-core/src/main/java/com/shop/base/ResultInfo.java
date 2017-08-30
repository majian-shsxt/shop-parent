package com.shop.base;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ResultInfo {
    private int resultCode;
    // 返回码
    private String resultMessage;
    // 返回消息
    private Object result;
    // 返回内容


}
