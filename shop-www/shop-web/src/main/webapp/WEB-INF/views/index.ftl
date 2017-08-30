<!DOCTYPE html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link href="${ctx}/favicon.ico" rel="icon" type="image/x-icon" />
    <link href="${ctx}/slider/slider.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery.tools.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery.lazyload.js"></script>
    <script type="text/javascript" src="${ctx}/slider/slider.js"></script>
    <script type="text/javascript" src="${ctx}/js/common.js"></script>
    <style type="text/css">
        .header {
            margin-bottom: 0px;
        }
    </style>
    <script type="text/javascript">
        $().ready(function() {

            var $productCategoryMenuItem = $("#productCategoryMenu li");
            var $slider = $("#slider");
            var $newArticleTab = $("#newArticle ul.tab");
            var $hotGoodsImage = $("div.hotGoods img");

            $productCategoryMenuItem.hover(
                    function() {
                        $(this).children("div.menu").show();
                    }, function() {
                        $(this).children("div.menu").hide();
                    }
            );

            $slider.nivoSlider({
                effect: "random",
                animSpeed: 1000,
                pauseTime: 6000,
                controlNav: true,
                keyboardNav: false,
                captionOpacity: 0.4
            });

            $newArticleTab.tabs("ul.tabContent", {
                tabs: "li",
                event: "mouseover"
            });

            $hotGoodsImage.lazyload({
                threshold: 100,
                effect: "fadeIn",
                skip_invisible: false
            });

        });
    </script>
</head>
<body>
<script type="text/javascript">
    $().ready(function() {

        var $headerName = $("#headerName");
        var $headerLogin = $("#headerLogin");
        var $headerRegister = $("#headerRegister");
        var $headerLogout = $("#headerLogout");
        var $goodsSearchForm = $("#goodsSearchForm");
        var $keyword = $("#goodsSearchForm input");
        var defaultKeyword = "商品搜索";

        var username = getCookie("username");
        var nickname = getCookie("nickname");
        if ($.trim(nickname) != "") {
            $headerName.text(nickname).show();
            $headerLogout.show();
        } else if ($.trim(username) != "") {
            $headerName.text(username).show();
            $headerLogout.show();
        } else {
            $headerLogin.show();
            $headerRegister.show();
        }

        $keyword.focus(function() {
            if ($.trim($keyword.val()) == defaultKeyword) {
                $keyword.val("");
            }
        });

        $keyword.blur(function() {
            if ($.trim($keyword.val()) == "") {
                $keyword.val(defaultKeyword);
            }
        });

        $goodsSearchForm.submit(function() {
            if ($.trim($keyword.val()) == "" || $keyword.val() == defaultKeyword) {
                return false;
            }
        });

    });
</script>

[#include  "include/header.ftl"]

<div class="container index">
    <div class="row">
        <div class="span2">
            <div id="productCategoryMenu" class="productCategoryMenu">
                <ul>
                [#--根级分类展示--]
                [@product_category_root_list]
                    [#list productCategories as productCategory]
                        <li>
                            <div class="item">
                            [#--子级分类展示--]
                                <div>
                                    [@product_category_children_list parentId = productCategory.id ]
                                        [#list productCategories as productCategory]
                                            <a href="${ctx}/goods/list/${productCategory.id}">
                                                <strong>${productCategory.name}</strong>
                                            </a>
                                        [/#list]
                                    [/@product_category_children_list]
                                </div>
                            [#--根级分类的品牌展示--]

                                <div>
                                    [@brand_list productCategoryId =  productCategory.id]
                                        [#list brands as brand]
                                            <a href="${ctx}/brand/${brand.id}">${brand.name}</a>
                                        [/#list]
                                    [/@brand_list]
                                </div>
                            </div>

                            <div class="menu">
                                [@product_category_children_list parentId = productCategory.id count=10]
                                    [#list productCategories as productCategory]
                                    [#-- < dl>< /dl>用来创建一个普通的列表,< dt>< /dt>用来创建列表中的上层项目，<
                                     dd>< /dd>用来创建列表中最下层项目--]
                                        <dl class="clearfix [#if !productCategory_has_next ]last[/#if]">
                                            <dt>
                                                <a href="${ctx}/good/list/${productCategory.id}">${productCategory.name}</a>
                                            </dt>
                                            [@product_category_children_list parentId = productCategory.id count=10]
                                                [#list productCategories as productCategory]
                                                    <dd>
                                                        <a href="${ctx}/goods/list/${productCategory.id}">${productCategory.name}</a>
                                                        [#if productCategory_has_next]|[/#if]
                                                    </dd>
                                                [/#list]
                                            [/@product_category_children_list]
                                        </dl>
                                    [#-- clearfix作用是 —— 清除之前的浮动关系，修复在firefox、chrome等标准浏览器中子元素全部浮动时，父元素不自动增高的问题--]
                                    [/#list]
                                [/@product_category_children_list]
                                <div class="auxiliary">
                                    <div>
                                        [@brand_list productCategoryId =  productCategory.id count=10 ]
                                            [#if brands?has_content]
                                                <strong>推荐品牌</strong>
                                                [#list brands as brand]
                                                    <a href="${ctx}/brand/${brand.id}">${brand.name}</a>
                                                [/#list]
                                            [/#if]
                                        [/@brand_list]
                                    </div>

                                    <div>
                                        [@promotion_list productCategoryId=productCategory.id count=10]
                                            [#if promotions?has_content]
                                                <strong>热门促销</strong>
                                                [#list promotions as promotion ]
                                                    <a href="${ctx}/promotion/${promotion.id}" title="${promotion.name}">
                                                        <img src="${promotion.image}" alt="${promotion.name}" />
                                                    </a>
                                                [/#list]
                                            [/#if]
                                        [/@promotion_list]
                                    </div>
                                </div>
                            </div>
                        </li>
                    [/#list]
                [/@product_category_root_list]


                </ul>
            </div>
        </div>
        <div class="span10">
            <div id="slider" class="slider">
                <a href="/shopxx/promotion/content/2.jhtml">
                    <img src="http://image.demo.shopxx.net/4.0/201501/7a09df9e-3f64-4670-82c2-87f3fd0bec0b.jpg" alt="联想笔记本专场" title="联想笔记本专场" />
                </a>
                <a href="#">
                    <img src="http://image.demo.shopxx.net/4.0/201501/313597c4-10be-41a6-8827-9b75889ad88a.jpg" alt="苹果产品专场" title="苹果产品专场" />
                </a>
                <a href="#">
                    <img src="http://image.demo.shopxx.net/4.0/201501/f675047e-91ec-46ac-a718-6c003fc9b901.jpg" alt="情人节专场" title="情人节专场" />
                </a>
            </div>			</div>
    </div>
    <div class="row">
        <div class="span9">
            <div class="hotAd">
                <ul>
                    <li>
                        <a href="#">
                            <img src="http://image.demo.shopxx.net/4.0/201501/b31c243d-9f9e-4799-8f7e-b68803ce8a6a.jpg" alt="华为荣耀" title="华为荣耀" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="http://image.demo.shopxx.net/4.0/201501/9370250c-8b01-472e-8e68-13ab7d10ff7c.jpg" alt="移动电源" title="移动电源" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="http://image.demo.shopxx.net/4.0/201501/0b8d7827-ac10-4045-9840-432e7cf2254e.jpg" alt="平板电脑" title="平板电脑" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="http://image.demo.shopxx.net/4.0/201501/1a7358bc-bb8e-4c1a-af0d-8d651d24b61c.jpg" alt="智能电视" title="智能电视" />
                        </a>
                    </li>
                </ul>
            </div>			</div>
        <div class="span3">
            <div id="newArticle" class="newArticle">
                <ul class="tab">
                    <li>
                        <a href="" target="_blank">商城动态</a>
                    </li>
                    <li>
                        <a href="" target="_blank">活动促销</a>
                    </li>
                </ul>
                <ul class="tabContent">
                    <li>
                        <a href="" title="亚洲将有望成为全球最大电商市场" target="_blank">亚洲将有望成为全球最大电商市场</a>
                    </li>
                    <li>
                        <a href="" title="2015年我国移动支付或突破4万亿元" target="_blank">2015年我国移动支付或突破4万亿元</a>
                    </li>
                    <li>
                        <a href="" title="2015年我国移动电商交易规模或将超千亿" target="_blank">2015年我国移动电商交易规模或将超千亿</a>
                    </li>
                    <li>
                        <a href="" title="2014我国网络购物交易规模2.8万亿 增48%" target="_blank">2014我国网络购物交易规模2.8万亿 增48%</a>
                    </li>
                    <li>
                        <a href="" title="中国消费者奢侈品消费76％在境外" target="_blank">中国消费者奢侈品消费76％在境外</a>
                    </li>
                    <li>
                        <a href="" title="中国网民接近6.5亿 较2013年增加3000万" target="_blank">中国网民接近6.5亿 较2013年增加3000万</a>
                    </li>
                </ul>
                <ul class="tabContent hidden">
                    <li>
                        <a href="" title="狂欢节活动" target="_blank">狂欢节活动</a>
                    </li>
                    <li>
                        <a href="" title="手机全场低至9.5折" target="_blank">手机全场低至9.5折</a>
                    </li>
                    <li>
                        <a href="" title="劲爆限时抢购" target="_blank">劲爆限时抢购</a>
                    </li>
                    <li>
                        <a href="" title="家电狂降五折起" target="_blank">家电狂降五折起</a>
                    </li>
                    <li>
                        <a href="" title="年终排行榜盛惠" target="_blank">年终排行榜盛惠</a>
                    </li>
                    <li>
                        <a href="" title="将限量”温情”带回家" target="_blank">将限量”温情”带回家</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span12">
            <div class="middleAd">
                <a href="#">
                    <img src="http://image.demo.shopxx.net/4.0/201501/073cbb0f-1d00-4ebc-bded-72abbe6830d0.jpg" width="1190" height="110" alt="蓝牙音箱" title="蓝牙音箱" />
                </a>
            </div>			</div>
    </div>
    <div class="row">
        <div class="span12">
            <div class="hotGoods">
                <dl class="title1">
                    <dt>
                        <a href="/goods/list/1">手机数码</a>
                    </dt>
                    <dd>
                        <a href="/goods/list/7">手机通讯</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/8">手机配件</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/9">摄影摄像</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/10">数码配件</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/11">智能设备</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/12">时尚影音</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/13">电子教育</a>
                    </dd>
                </dl>
                <div>
                    <a href="#">
                        <img src="http://image.demo.shopxx.net/4.0/201501/7a9dcaf7-5575-4166-af36-b61736e4b3e6.jpg" alt="iPhone6" title="iPhone6" />
                    </a>
                </div>
                <ul>
                    <li>
                        <a href="" title="苹果 iPhone 5s" target="_blank">
                            <div>
                                <span title="苹果 iPhone 5s">苹果 iPhone 5s</span>
                                <em title="铝金属外壳，64位智能手机，畅享3G/4G网络">铝金属外壳，64位智能手机，畅享3G/4G网络</em>
                            </div>
                            <strong>4200</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/e39f89ce-e08a-4546-8aee-67d4427e86e2-thumbnail.jpg" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="苹果 iPhone 6" target="_blank">
                            <div>
                                <span title="苹果 iPhone 6">苹果 iPhone 6</span>
                                <em title="至大至薄，强劲动力">至大至薄，强劲动力</em>
                            </div>
                            <strong>5200</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/d7f59d79-1958-4059-852c-0d6531788b48-thumbnail.jpg" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="三星 G3818" target="_blank">
                            <div>
                                <span title="三星 G3818">三星 G3818</span>
                                <em title="时尚便携，畅享3G网络">时尚便携，畅享3G网络</em>
                            </div>
                            <strong>1200</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/031e30a4-6237-4650-a14c-5132aa126acd-thumbnail.jpg" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="三星 Galaxy S5 G9009W" target="_blank">
                            <div>
                                <span title="三星 Galaxy S5 G9009W">三星 Galaxy S5 G9009W</span>
                                <em title="IP67级防尘防水，超级续航，电力持久">IP67级防尘防水，超级续航，电力持久</em>
                            </div>
                            <strong>3800</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/10ac8459-4110-47df-80f9-3a7d0486dd30-thumbnail.jpg" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="华为 Ascend G7" target="_blank">
                            <div>
                                <span title="华为 Ascend G7">华为 Ascend G7</span>
                                <em title="一体化设计，尖端工艺">一体化设计，尖端工艺</em>
                            </div>
                            <strong>1900</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/198bc691-83e8-42f5-9595-5a54367911c3-thumbnail.jpg" />
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="佳能 IXUS 155" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/44cbbe8b-dcae-46d1-9606-746455b61905-thumbnail.jpg" />
                            <span title="佳能 IXUS 155">佳能 IXUS 155</span>
                            <strong>899</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="佳能 IXUS 265" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/b773a9c1-8fef-4e48-ba82-ef433924b712-thumbnail.jpg" />
                            <span title="佳能 IXUS 265">佳能 IXUS 265</span>
                            <strong>999</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="三星 WB35F" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/842d4ce2-18dc-4065-9eef-dad06da9bef4-thumbnail.jpg" />
                            <span title="三星 WB35F">三星 WB35F</span>
                            <strong>899</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="三星 WB351F" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/8f5b4f02-f716-4737-afa6-70606793ffc5-thumbnail.jpg" />
                            <span title="三星 WB351F">三星 WB351F</span>
                            <strong>1500</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="索尼 DSC-W810" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/e44bc02b-e142-4fce-b88e-02b4ee8f392e-thumbnail.jpg" />
                            <span title="索尼 DSC-W810">索尼 DSC-W810</span>
                            <strong>699</strong>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span12">
            <div class="hotGoods">
                <dl class="title2">
                    <dt>
                        <a href="/goods/list/2">电脑办公</a>
                    </dt>
                    <dd>
                        <a href="/goods/list/14">电脑整机</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/15">电脑配件</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/16">电脑外设</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/17">网络设备</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/18">办公打印</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/19">办公文仪</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/20">办公耗材</a>
                    </dd>
                </dl>
                <div>
                    <a href="#">
                        <img src="http://image.demo.shopxx.net/4.0/201501/68068b35-dd61-4ea9-96f9-6945c8a05d55.jpg" alt="苹果配件" title="苹果配件" />
                    </a>
                </div>
                <ul>
                    <li>
                        <a href="" title="苹果 MacBook Air MD711CH" target="_blank">
                            <div>
                                <span title="苹果 MacBook Air MD711CH">苹果 MacBook Air MD711CH</span>
                                <em title="超长电池使用时间，强劲性能">超长电池使用时间，强劲性能</em>
                            </div>
                            <strong>5800</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/0eb9dcf8-57fe-499a-aa59-73bfb8f4c1cb-thumbnail.jpg" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="苹果 MacBook Pro MGXA2CH" target="_blank">
                            <div>
                                <span title="苹果 MacBook Pro MGXA2CH">苹果 MacBook Pro MGXA2CH</span>
                                <em title="绚丽夺目，超强性能表现">绚丽夺目，超强性能表现</em>
                            </div>
                            <strong>13800</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/ee8f0d59-a38f-4e7b-8972-53a4f0349d24-thumbnail.jpg" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="华硕 TP500LN" target="_blank">
                            <div>
                                <span title="华硕 TP500LN">华硕 TP500LN</span>
                                <em title="工艺精湛，360度自由翻转">工艺精湛，360度自由翻转</em>
                            </div>
                            <strong>6800</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/9da8b878-da95-4d48-9f0b-c6562dd8793a-thumbnail.jpg" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="三星 NP930X5J" target="_blank">
                            <div>
                                <span title="三星 NP930X5J">三星 NP930X5J</span>
                                <em title="轻薄设计，强劲续航">轻薄设计，强劲续航</em>
                            </div>
                            <strong>12000</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/bf15b3cc-77fd-44b8-b5ca-6ef070cc6d8d-thumbnail.jpg" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="三星 NP455R4J" target="_blank">
                            <div>
                                <span title="三星 NP455R4J">三星 NP455R4J</span>
                                <em title="2G独立显卡，时尚轻薄">2G独立显卡，时尚轻薄</em>
                            </div>
                            <strong>2800</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/03c8560a-bac4-473d-b46f-387a927b3218-thumbnail.jpg" />
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="苹果 iPad Air MD785CH" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/7ebc7264-e5e6-4681-a80b-6cdbd90272cc-thumbnail.jpg" />
                            <span title="苹果 iPad Air MD785CH">苹果 iPad Air MD785CH</span>
                            <strong>2880</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="苹果 iPad mini ME279CH" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/5c5195a8-4861-4161-a9f5-9ecbb0a70596-thumbnail.jpg" />
                            <span title="苹果 iPad mini ME279CH">苹果 iPad mini ME279CH</span>
                            <strong>2200</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="苹果 iPad Air2 MH0W2CH" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/5f7ffbaf-2e87-42c4-9039-0fe47fb630b2-thumbnail.jpg" />
                            <span title="苹果 iPad Air2 MH0W2CH">苹果 iPad Air2 MH0W2CH</span>
                            <strong>3600</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="苹果 iPad mini3 MGY92CH" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/62142fec-eae0-4881-abc6-04ecb2afcbad-thumbnail.jpg" />
                            <span title="苹果 iPad mini3 MGY92CH">苹果 iPad mini3 MGY92CH</span>
                            <strong>2888</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="三星 Galaxy Tab3 T311" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/8d6f7b24-95fe-4c09-b85f-56568019e1d2-thumbnail.jpg" />
                            <span title="三星 Galaxy Tab3 T311">三星 Galaxy Tab3 T311</span>
                            <strong>2600</strong>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span12">
            <div class="hotGoods">
                <dl class="title3">
                    <dt>
                        <a href="/goods/list/3">家用电器</a>
                    </dt>
                    <dd>
                        <a href="/goods/list/21">生活电器</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/22">厨卫电器</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/23">个护健康</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/24">五金家装</a>
                    </dd>
                    <dd>
                        <a href="/goods/list/25">大家电</a>
                    </dd>
                </dl>
                <div>
                    <a href="#">
                        <img src="http://image.demo.shopxx.net/4.0/201501/001b365f-b2ec-428e-a8cf-c544c32a0fad.jpg" alt="腊八节促销" title="腊八节促销" />
                    </a>
                </div>
                <ul>
                    <li>
                        <a href="" title="飞利浦 55PFL3045" target="_blank">
                            <div>
                                <span title="飞利浦 55PFL3045">飞利浦 55PFL3045</span>
                                <em title="经典大屏，飞常完美">经典大屏，飞常完美</em>
                            </div>
                            <strong>3899</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/8384ad7b-a5e3-4ad1-96b8-bc2d9e924087-thumbnail.jpg" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="东芝 42L1353C" target="_blank">
                            <div>
                                <span title="东芝 42L1353C">东芝 42L1353C</span>
                                <em title="三维色彩管理，高还原色彩细节">三维色彩管理，高还原色彩细节</em>
                            </div>
                            <strong>2599</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/f8a42d04-c91b-473b-8549-606208b3dcb9-thumbnail.jpg" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="东芝 55L3305CS" target="_blank">
                            <div>
                                <span title="东芝 55L3305CS">东芝 55L3305CS</span>
                                <em title="享受澎湃画质，打造全高清3D盛宴">享受澎湃画质，打造全高清3D盛宴</em>
                            </div>
                            <strong>4988</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/726126d6-2cc4-4e19-86f5-9688beb88042-thumbnail.jpg" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="索尼 KDL-60WM15B" target="_blank">
                            <div>
                                <span title="索尼 KDL-60WM15B">索尼 KDL-60WM15B</span>
                                <em title="动人影音，智能娱乐">动人影音，智能娱乐</em>
                            </div>
                            <strong>6888</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/c54c97fe-017e-4363-99d5-4a263407e02d-thumbnail.jpg" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="索尼 KDL-50W700B" target="_blank">
                            <div>
                                <span title="索尼 KDL-50W700B">索尼 KDL-50W700B</span>
                                <em title="新升级智能娱乐功能">新升级智能娱乐功能</em>
                            </div>
                            <strong>4688</strong>
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/eee0bfc5-d5f6-48c4-aa75-73fb709d824b-thumbnail.jpg" />
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="格力 KFR-26GW FNDe-A3" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/91c37add-33fb-44bc-ac8c-b3387c5b73fb-thumbnail.jpg" />
                            <span title="格力 KFR-26GW FNDe-A3">格力 KFR-26GW FNDe-A3</span>
                            <strong>2999</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="格力 KF-23GW Ga-3" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/d7630e6b-b206-4655-b5a8-da424d9a39d2-thumbnail.jpg" />
                            <span title="格力 KF-23GW Ga-3">格力 KF-23GW Ga-3</span>
                            <strong>2380</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="格力 KFR-26GW FNBa-A3" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/f052efce-8045-4db7-bed2-1343823a7b53-thumbnail.jpg" />
                            <span title="格力 KFR-26GW FNBa-A3">格力 KFR-26GW FNBa-A3</span>
                            <strong>3690</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="美的 KFR-35GWBP3DN1Y" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/b03f83e2-357a-4991-b894-a361d20386a7-thumbnail.jpg" />
                            <span title="美的 KFR-35GWBP3DN1Y">美的 KFR-35GWBP3DN1Y</span>
                            <strong>2399</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="" title="美的 KFR-32GWDY-IF" target="_blank">
                            <img src="/upload/image/blank.gif" data-original="http://image.demo.shopxx.net/4.0/201501/acef11f4-93cf-44e7-b5f8-7b156f2b1809-thumbnail.jpg" />
                            <span title="美的 KFR-32GWDY-IF">美的 KFR-32GWDY-IF</span>
                            <strong>2399</strong>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="span12">
            <div class="bottomAd">
                <ul>
                    <li>
                        <a href="#">
                            <img src="http://image.demo.shopxx.net/4.0/201501/e44f5fe1-523d-4ba5-af75-c60ff9125ed4.jpg" alt="数码相机" title="数码相机" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="http://image.demo.shopxx.net/4.0/201501/b955bbb2-b9ad-4e6b-9dc2-5159a18cdaee.jpg" alt="智能手表" title="智能手表" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="http://image.demo.shopxx.net/4.0/201501/dff83843-d61a-4406-9a00-1d5efe7fbe38.jpg" alt="智能手机" title="智能手机" />
                        </a>
                    </li>
                </ul>
            </div>			</div>
    </div>


    <div class="row">
        <div class="span12">
            <div class="hotBrand">
                <ul class="clearfix">
                    <li>
                        <a href="" title="苹果">
                            <img src="http://image.demo.shopxx.net/4.0/201501/a8275260-f9fa-4e20-8173-35b755fabb14.gif" alt="苹果" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="三星">
                            <img src="http://image.demo.shopxx.net/4.0/201501/8aa08a42-f5b3-4f52-bea0-5ee8bd123b0c.gif" alt="三星" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="索尼">
                            <img src="http://image.demo.shopxx.net/4.0/201501/dd75c116-51a7-4fbd-b014-6cf4bedcd0bb.gif" alt="索尼" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="华为">
                            <img src="http://image.demo.shopxx.net/4.0/201501/2a5efa56-c4cd-4984-b11a-d56cadca6cff.gif" alt="华为" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="魅族">
                            <img src="http://image.demo.shopxx.net/4.0/201501/72657c6c-d279-4952-ac20-1abcff776b07.gif" alt="魅族" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="佳能">
                            <img src="http://image.demo.shopxx.net/4.0/201501/081d4e29-b631-4a49-8672-792a1308ce97.gif" alt="佳能" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="尼康">
                            <img src="http://image.demo.shopxx.net/4.0/201501/5bd8bec2-f2df-4c84-937a-6eead637abd4.gif" alt="尼康" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="松下">
                            <img src="http://image.demo.shopxx.net/4.0/201501/e921d086-358d-4610-9a53-b46a551b6557.gif" alt="松下" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="戴尔">
                            <img src="http://image.demo.shopxx.net/4.0/201501/1ff77e2d-6190-4fea-9e12-be75d2d4ce83.gif" alt="戴尔" />
                        </a>
                    </li>
                    <li>
                        <a href="" title="惠普">
                            <img src="http://image.demo.shopxx.net/4.0/201501/271e4fc7-4451-488b-9d10-a7f80b41d719.gif" alt="惠普" />
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>


</div>
<div class="footer">
    <div class="service clearfix">
        <dl>
            <dt class="icon1">新手指南</dt>
            <dd>
                <a href="#">购物流程</a>
            </dd>
            <dd>
                <a href="#">会员注册</a>
            </dd>
            <dd>
                <a href="#">购买宝贝</a>
            </dd>
            <dd>
                <a href="#">支付货款</a>
            </dd>
            <dd>
                <a href="#">用户协议</a>
            </dd>
        </dl>
        <dl>
            <dt class="icon2">特色服务</dt>
            <dd>
                <a href="#">购物流程</a>
            </dd>
            <dd>
                <a href="#">会员注册</a>
            </dd>
            <dd>
                <a href="#">购买宝贝</a>
            </dd>
            <dd>
                <a href="#">支付货款</a>
            </dd>
            <dd>
                <a href="#">用户协议</a>
            </dd>
        </dl>
        <dl>
            <dt class="icon3">支付方式</dt>
            <dd>
                <a href="#">购物流程</a>
            </dd>
            <dd>
                <a href="#">会员注册</a>
            </dd>
            <dd>
                <a href="#">购买宝贝</a>
            </dd>
            <dd>
                <a href="#">支付货款</a>
            </dd>
            <dd>
                <a href="#">用户协议</a>
            </dd>
        </dl>
        <dl>
            <dt class="icon4">配送方式</dt>
            <dd>
                <a href="#">购物流程</a>
            </dd>
            <dd>
                <a href="#">会员注册</a>
            </dd>
            <dd>
                <a href="#">购买宝贝</a>
            </dd>
            <dd>
                <a href="#">支付货款</a>
            </dd>
            <dd>
                <a href="#">用户协议</a>
            </dd>
        </dl>
        <div class="qrCode">
            <img src="/images/qr_code.gif" alt="官方微信" />
            官方微信
        </div>
    </div>
    <div class="bottom">
        <div class="bottom">
            <div class="bottomNav">
                <ul>
                    <li>
                        <a href="#">关于我们</a>
                        |
                    </li>
                    <li>
                        <a href="#">联系我们</a>
                        |
                    </li>
                    <li>
                        <a href="#">诚聘英才</a>
                        |
                    </li>
                    <li>
                        <a href="#">隐私政策</a>
                        |
                    </li>
                    <li>
                        <a href="#">法律声明</a>
                        |
                    </li>
                    <li>
                        <a href="#">客户服务</a>
                        |
                    </li>
                    <li>
                        <a href="/friend_link">友情链接</a>

                    </li>
                </ul>
            </div>
            <div class="info">
                <p>湘ICP备10000000号</p>
                <p>Copyright © 2005-2017 SHOP++商城 版权所有</p>
                <ul>
                    <li>
                        <a href="#" target="_blank">
                            <img src="http://image.demo.shopxx.net/b2b2c/5.0/201601/1c675feb-e488-4fd5-a186-b28bb6de445a.gif" alt="SHOP++">
                        </a>
                    </li>
                    <li>
                        <a href="http://www.alipay.com" target="_blank">
                            <img src="http://image.demo.shopxx.net/b2b2c/5.0/201601/ae13eddc-25ac-427a-875d-d1799d751076.gif" alt="支付宝">
                        </a>
                    </li>
                    <li>
                        <a href="http://www.tenpay.com" target="_blank">
                            <img src="http://image.demo.shopxx.net/b2b2c/5.0/201601/adaa9ac5-9994-4aa3-a336-b65613c85d50.gif" alt="财付通">
                        </a>
                    </li>
                    <li>
                        <a href="https://www.95516.com" target="_blank">
                            <img src="http://image.demo.shopxx.net/b2b2c/5.0/201601/41c18c8d-f69a-49fe-ace3-f16c2eb07983.gif" alt="中国银联">
                        </a>
                    </li>
                    <li>
                        <a href="http://www.kuaidi100.com" target="_blank">
                            <img src="http://image.demo.shopxx.net/b2b2c/5.0/201601/ea46ca0a-e8f0-4e2c-938a-5cb19a07cb9a.gif" alt="快递100">
                        </a>
                    </li>
                    <li>
                        <a href="http://www.cnzz.com" target="_blank">
                            <img src="http://image.demo.shopxx.net/b2b2c/5.0/201601/e12f226b-07f9-4895-bcc2-78dbe551964b.gif" alt="站长统计">
                        </a>
                    </li>
                    <li>
                        <a href="http://down.admin5.com" target="_blank">
                            <img src="http://image.demo.shopxx.net/b2b2c/5.0/201601/fd9d6268-e4e2-41f6-856d-4cb8a49eadd1.gif" alt="A5下载">
                        </a>
                    </li>
                    <li>
                        <a href="http://www.ccb.com" target="_blank">
                            <img src="http://image.demo.shopxx.net/b2b2c/5.0/201601/6c57f398-0498-4044-80d8-20f6c40d5cef.gif" alt="中国建设银行">
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>