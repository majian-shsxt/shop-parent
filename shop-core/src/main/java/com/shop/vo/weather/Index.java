package com.shop.vo.weather;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by TW on 2017/7/17.
 */
@Getter
@Setter
public class Index {
//    {
//        "title": "穿衣",
//            "zs": "炎热",
//            "tipt": "穿衣指数",
//            "des": "天气炎热，建议着短衫、短裙、短裤、薄型T恤衫等清凉夏季服装。"
//    }
    private String title;
    private String zs;
    private String tipt;
    private String des;
}
