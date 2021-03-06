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
<div class="header">
	<div class="top">
		<div class="topNav">
			<ul class="left">
				<li>
					<span>您好，欢迎来到商HAI购</span>
				</li>
				<li id="headerLogin" class="headerLogin">
					<a href="/login">登录</a>|
				</li>
				<li id="headerRegister" class="headerRegister">
					<a href="/register">注册</a>
				</li>
			</ul>
			<ul class="right">
				[@navigation_list position = 0]
					[#list navigations as navigation]
                        <li>
                            <a href="${navigation.url}" [#if navigation.isBlankTarget()]target = "_blank"[/#if] >
							${navigation.name}
                            </a>|
                        </li>
					[/#list]
				[/@navigation_list]

				<li id="headerCart" class="headerCart">
					<a href="/cart/list">购物车</a>
					(<em>0</em>)
				</li>
			</ul>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="span3">
				<a href="${ctx}/index">
					<img src="${ctx}/upload/image/logo.gif" alt="尚HAI购" />
				</a>
			</div>
			<div class="span6">
				<div class="search">
					<form id="goodsSearchForm" action="${ctx}/goods/search" method="get">
						<input name="keyword" class="keyword" value="" autocomplete="off" x-webkit-speech="x-webkit-speech" x-webkit-grammar="builtin:search" maxlength="30" />
						<button type="submit">&nbsp;</button>
					</form>
				</div>
				<div class="hotSearch">
					热门搜索:
					[@hot_search_keywords]
						[#list keywords as keyword]
                            <a href="${ctx}/goods/search?keyword=${keyword}">${keyword}</a>
						[/#list]
					[/@hot_search_keywords]

				</div>
			</div>
			<div class="span3">
				<div class="phone">
					<em>服务电话</em>
					800-8888888
				</div>
			</div>
		</div>
		<div class="row">
			<div class="span12">
				<dl class="mainNav">
					<dt>
						<a href="/product_category">所有商品分类</a>
					</dt>
							<dd>
								<a href="/shopxx/" >
									首页
								</a>
							</dd>
							<dd>
								<a href="/shopxx/goods/list/1.jhtml" >
									手机数码
								</a>
							</dd>
							<dd>
								<a href="/shopxx/goods/list/2.jhtml" >
									电脑办公
								</a>
							</dd>
							<dd>
								<a href="/shopxx/goods/list/3.jhtml" >
									家用电器
								</a>
							</dd>
							<dd>
								<a href="/shopxx/goods/list/4.jhtml" >
									服装鞋靴
								</a>
							</dd>
							<dd>
								<a href="/shopxx/goods/list/5.jhtml" >
									化妆护理
								</a>
							</dd>
							<dd>
								<a href="/shopxx/goods/list/241.jhtml" >
									积分商城
								</a>
							</dd>
				</dl>
			</div>
		</div>
	</div>
</div>
<script>
	$.post("/cart/count", {}, function (data) {
		if (data.resultCode == 1) {
			var count = data.result;
			$("#headerCart").find('em').html(count);
		}
	});
</script>
<div class="container index">
		<div class="row">
			<div class="span2">
					<div id="productCategoryMenu" class="productCategoryMenu">
						<ul>
								<li>
										<div class="item">
											<div>
													<a href="/goods/list/7">
														<strong>手机通讯</strong>
													</a>
													<a href="/goods/list/8">
														<strong>手机配件</strong>
													</a>
													<a href="/goods/list/9">
														<strong>摄影摄像</strong>
													</a>
											</div>
											<div>
														<a href="">苹果</a>
														<a href="">三星</a>
														<a href="">索尼</a>
														<a href="">华为</a>
											</div>
										</div>
										<div class="menu">
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/7">手机通讯</a>
													</dt>
															<dd>
																<a href="/goods/list/41">手机</a>|
															</dd>
															<dd>
																<a href="/goods/list/42">对讲机</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/8">手机配件</a>
													</dt>
															<dd>
																<a href="/goods/list/43">手机电池</a>|
															</dd>
															<dd>
																<a href="/goods/list/44">移动电源</a>|
															</dd>
															<dd>
																<a href="/goods/list/45">充电器</a>|
															</dd>
															<dd>
																<a href="/goods/list/46">手机耳机</a>|
															</dd>
															<dd>
																<a href="/goods/list/47">手机贴膜</a>|
															</dd>
															<dd>
																<a href="/goods/list/48">手机保护套</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/9">摄影摄像</a>
													</dt>
															<dd>
																<a href="/goods/list/49">数码相机</a>|
															</dd>
															<dd>
																<a href="/goods/list/50">单反相机</a>|
															</dd>
															<dd>
																<a href="/goods/list/51">数码摄像机</a>|
															</dd>
															<dd>
																<a href="/goods/list/52">拍立得</a>|
															</dd>
															<dd>
																<a href="/goods/list/53">镜头</a>|
															</dd>
															<dd>
																<a href="/goods/list/54">户外器材</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/10">数码配件</a>
													</dt>
															<dd>
																<a href="/goods/list/55">存储卡</a>|
															</dd>
															<dd>
																<a href="/goods/list/56">读卡器</a>|
															</dd>
															<dd>
																<a href="/goods/list/57">数码贴膜</a>|
															</dd>
															<dd>
																<a href="/goods/list/58">充电器</a>|
															</dd>
															<dd>
																<a href="/goods/list/59">相机包</a>|
															</dd>
															<dd>
																<a href="/goods/list/60">滤镜</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/11">智能设备</a>
													</dt>
															<dd>
																<a href="/goods/list/61">智能手环</a>|
															</dd>
															<dd>
																<a href="/goods/list/62">智能手表</a>|
															</dd>
															<dd>
																<a href="/goods/list/63">智能眼镜</a>|
															</dd>
															<dd>
																<a href="/goods/list/64">智能配饰</a>|
															</dd>
															<dd>
																<a href="/goods/list/65">智能家居</a>|
															</dd>
															<dd>
																<a href="/goods/list/66">健康监测</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/12">时尚影音</a>
													</dt>
															<dd>
																<a href="/goods/list/67">MP3/MP4</a>|
															</dd>
															<dd>
																<a href="/goods/list/68">收录音机</a>|
															</dd>
															<dd>
																<a href="/goods/list/69">数码相框</a>|
															</dd>
															<dd>
																<a href="/goods/list/70">耳机耳麦</a>|
															</dd>
															<dd>
																<a href="/goods/list/71">录音笔</a>|
															</dd>
															<dd>
																<a href="/goods/list/72">音箱</a>
															</dd>
												</dl>
												<dl class="clearfix last">
													<dt>
														<a href="/goods/list/13">电子教育</a>
													</dt>
															<dd>
																<a href="/goods/list/73">电子词典</a>|
															</dd>
															<dd>
																<a href="/goods/list/74">学生平板</a>|
															</dd>
															<dd>
																<a href="/goods/list/75">复读机</a>|
															</dd>
															<dd>
																<a href="/goods/list/76">点读机</a>|
															</dd>
															<dd>
																<a href="/goods/list/77">早教机</a>|
															</dd>
															<dd>
																<a href="/goods/list/78">学习机</a>
															</dd>
												</dl>
											<div class="auxiliary">
														<div>
															<strong>推荐品牌</strong>
																<a href="">苹果</a>
																<a href="">三星</a>
																<a href="">索尼</a>
																<a href="">华为</a>
																<a href="">魅族</a>
																<a href="">佳能</a>
																<a href="">尼康</a>
																<a href="">松下</a>
														</div>
														<div>
															<strong>热门促销</strong>
																	<a href="" title="iPhone促销专场">
																		<img src="http://image.demo.shopxx.net/4.0/201501/0a1ceb47-f51c-4dfb-9d51-cb723c2f8e78.jpg" alt="iPhone促销专场" />
																	</a>
														</div>
											</div>
										</div>
								</li>
								<li>
										<div class="item">
											<div>
													<a href="/goods/list/14">
														<strong>电脑整机</strong>
													</a>
													<a href="/goods/list/15">
														<strong>电脑配件</strong>
													</a>
													<a href="/goods/list/16">
														<strong>电脑外设</strong>
													</a>
											</div>
											<div>
														<a href="">戴尔</a>
														<a href="">惠普</a>
														<a href="">华硕</a>
														<a href="">微星</a>
											</div>
										</div>
										<div class="menu">
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/14">电脑整机</a>
													</dt>
															<dd>
																<a href="/goods/list/79">笔记本</a>|
															</dd>
															<dd>
																<a href="/goods/list/80">超极本</a>|
															</dd>
															<dd>
																<a href="/goods/list/81">游戏本</a>|
															</dd>
															<dd>
																<a href="/goods/list/82">平板电脑</a>|
															</dd>
															<dd>
																<a href="/goods/list/83">台式机</a>|
															</dd>
															<dd>
																<a href="/goods/list/84">服务器</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/15">电脑配件</a>
													</dt>
															<dd>
																<a href="/goods/list/85">CPU</a>|
															</dd>
															<dd>
																<a href="/goods/list/86">主板</a>|
															</dd>
															<dd>
																<a href="/goods/list/87">硬盘</a>|
															</dd>
															<dd>
																<a href="/goods/list/88">内存</a>|
															</dd>
															<dd>
																<a href="/goods/list/89">机箱</a>|
															</dd>
															<dd>
																<a href="/goods/list/90">显示器</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/16">电脑外设</a>
													</dt>
															<dd>
																<a href="/goods/list/91">移动硬盘</a>|
															</dd>
															<dd>
																<a href="/goods/list/92">U盘</a>|
															</dd>
															<dd>
																<a href="/goods/list/93">鼠标</a>|
															</dd>
															<dd>
																<a href="/goods/list/94">键盘</a>|
															</dd>
															<dd>
																<a href="/goods/list/95">摄像头</a>|
															</dd>
															<dd>
																<a href="/goods/list/96">手写板</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/17">网络设备</a>
													</dt>
															<dd>
																<a href="/goods/list/97">路由器</a>|
															</dd>
															<dd>
																<a href="/goods/list/98">交换机</a>|
															</dd>
															<dd>
																<a href="/goods/list/99">网卡</a>|
															</dd>
															<dd>
																<a href="/goods/list/100">网络存储</a>|
															</dd>
															<dd>
																<a href="/goods/list/101">3G/4G上网</a>|
															</dd>
															<dd>
																<a href="/goods/list/102">网络盒子</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/18">办公打印</a>
													</dt>
															<dd>
																<a href="/goods/list/103">打印机</a>|
															</dd>
															<dd>
																<a href="/goods/list/104">扫描仪</a>|
															</dd>
															<dd>
																<a href="/goods/list/105">传真机</a>|
															</dd>
															<dd>
																<a href="/goods/list/106">一体机</a>|
															</dd>
															<dd>
																<a href="/goods/list/107">投影机</a>|
															</dd>
															<dd>
																<a href="/goods/list/108">考勤机</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/19">办公文仪</a>
													</dt>
															<dd>
																<a href="/goods/list/109">办公文具</a>|
															</dd>
															<dd>
																<a href="/goods/list/110">办公用纸</a>|
															</dd>
															<dd>
																<a href="/goods/list/111">财务用品</a>|
															</dd>
															<dd>
																<a href="/goods/list/112">学生文具</a>|
															</dd>
															<dd>
																<a href="/goods/list/113">文件管理</a>|
															</dd>
															<dd>
																<a href="/goods/list/114">计算器</a>
															</dd>
												</dl>
												<dl class="clearfix last">
													<dt>
														<a href="/goods/list/20">办公耗材</a>
													</dt>
															<dd>
																<a href="/goods/list/115">硒鼓</a>|
															</dd>
															<dd>
																<a href="/goods/list/116">墨粉</a>|
															</dd>
															<dd>
																<a href="/goods/list/117">墨盒</a>|
															</dd>
															<dd>
																<a href="/goods/list/118">色带</a>|
															</dd>
															<dd>
																<a href="/goods/list/119">纸类</a>|
															</dd>
															<dd>
																<a href="/goods/list/120">刻录光盘</a>
															</dd>
												</dl>
											<div class="auxiliary">
														<div>
															<strong>推荐品牌</strong>
																<a href="">戴尔</a>
																<a href="">惠普</a>
																<a href="">华硕</a>
																<a href="">微星</a>
																<a href="">宏碁</a>
																<a href="">联想</a>
																<a href="">兄弟</a>
																<a href="">得力</a>
														</div>
														<div>
															<strong>热门促销</strong>
																	<a href="" title="联想笔记本促销专场">
																		<img src="http://image.demo.shopxx.net/4.0/201501/98229d3b-08b7-4888-a99e-cf21a2a03b65.jpg" alt="联想笔记本促销专场" />
																	</a>
														</div>
											</div>
										</div>
								</li>
								<li>
										<div class="item">
											<div>
													<a href="/goods/list/21">
														<strong>生活电器</strong>
													</a>
													<a href="/goods/list/22">
														<strong>厨卫电器</strong>
													</a>
													<a href="/goods/list/23">
														<strong>个护健康</strong>
													</a>
											</div>
											<div>
														<a href="">海尔</a>
														<a href="">美的</a>
														<a href="">格力</a>
														<a href="">海信</a>
											</div>
										</div>
										<div class="menu">
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/21">生活电器</a>
													</dt>
															<dd>
																<a href="/goods/list/121">电风扇</a>|
															</dd>
															<dd>
																<a href="/goods/list/122">吸尘器</a>|
															</dd>
															<dd>
																<a href="/goods/list/123">饮水机</a>|
															</dd>
															<dd>
																<a href="/goods/list/124">加湿器</a>|
															</dd>
															<dd>
																<a href="/goods/list/125">干衣机</a>|
															</dd>
															<dd>
																<a href="/goods/list/126">电话机</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/22">厨卫电器</a>
													</dt>
															<dd>
																<a href="/goods/list/127">电饭煲</a>|
															</dd>
															<dd>
																<a href="/goods/list/128">微波炉</a>|
															</dd>
															<dd>
																<a href="/goods/list/129">电磁炉</a>|
															</dd>
															<dd>
																<a href="/goods/list/130">豆浆机</a>|
															</dd>
															<dd>
																<a href="/goods/list/131">榨汁机</a>|
															</dd>
															<dd>
																<a href="/goods/list/132">面包机</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/23">个护健康</a>
													</dt>
															<dd>
																<a href="/goods/list/133">剃须刀</a>|
															</dd>
															<dd>
																<a href="/goods/list/134">电吹风</a>|
															</dd>
															<dd>
																<a href="/goods/list/135">理发器</a>|
															</dd>
															<dd>
																<a href="/goods/list/136">体温计</a>|
															</dd>
															<dd>
																<a href="/goods/list/137">血压计</a>|
															</dd>
															<dd>
																<a href="/goods/list/138">血糖仪</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/24">五金家装</a>
													</dt>
															<dd>
																<a href="/goods/list/139">电动工具</a>|
															</dd>
															<dd>
																<a href="/goods/list/140">手动工具</a>|
															</dd>
															<dd>
																<a href="/goods/list/141">仪器仪表</a>|
															</dd>
															<dd>
																<a href="/goods/list/142">淋浴花洒</a>|
															</dd>
															<dd>
																<a href="/goods/list/143">厨卫五金</a>|
															</dd>
															<dd>
																<a href="/goods/list/144">家具五金</a>
															</dd>
												</dl>
												<dl class="clearfix last">
													<dt>
														<a href="/goods/list/25">大家电</a>
													</dt>
															<dd>
																<a href="/goods/list/145">平板电视</a>|
															</dd>
															<dd>
																<a href="/goods/list/146">家庭影院</a>|
															</dd>
															<dd>
																<a href="/goods/list/147">洗衣机</a>|
															</dd>
															<dd>
																<a href="/goods/list/148">热水器</a>|
															</dd>
															<dd>
																<a href="/goods/list/149">冰箱</a>|
															</dd>
															<dd>
																<a href="/goods/list/150">空调</a>
															</dd>
												</dl>
											<div class="auxiliary">
														<div>
															<strong>推荐品牌</strong>
																<a href="">海尔</a>
																<a href="">美的</a>
																<a href="">格力</a>
																<a href="">海信</a>
																<a href="">创维</a>
																<a href="">先锋</a>
																<a href="">夏普</a>
																<a href="">九阳</a>
														</div>
														<div>
															<strong>热门促销</strong>
																	<a href="" title="平板电视促销专场">
																		<img src="http://image.demo.shopxx.net/4.0/201501/2b71bacf-bd18-46fb-adab-072dd544ed66.jpg" alt="平板电视促销专场" />
																	</a>
														</div>
											</div>
										</div>
								</li>
								<li>
										<div class="item">
											<div>
													<a href="/goods/list/26">
														<strong>品质男装</strong>
													</a>
													<a href="/goods/list/27">
														<strong>时尚女装</strong>
													</a>
													<a href="/goods/list/28">
														<strong>精品内衣</strong>
													</a>
											</div>
											<div>
														<a href="">耐克</a>
														<a href="">特步</a>
														<a href="">安踏</a>
														<a href="">劲霸</a>
											</div>
										</div>
										<div class="menu">
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/26">品质男装</a>
													</dt>
															<dd>
																<a href="/goods/list/151">衬衫</a>|
															</dd>
															<dd>
																<a href="/goods/list/152">T恤</a>|
															</dd>
															<dd>
																<a href="/goods/list/153">夹克</a>|
															</dd>
															<dd>
																<a href="/goods/list/154">针织衫</a>|
															</dd>
															<dd>
																<a href="/goods/list/155">羊绒衫</a>|
															</dd>
															<dd>
																<a href="/goods/list/156">羽绒服</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/27">时尚女装</a>
													</dt>
															<dd>
																<a href="/goods/list/157">衬衫</a>|
															</dd>
															<dd>
																<a href="/goods/list/158">T恤</a>|
															</dd>
															<dd>
																<a href="/goods/list/159">风衣</a>|
															</dd>
															<dd>
																<a href="/goods/list/160">连衣裙</a>|
															</dd>
															<dd>
																<a href="/goods/list/161">牛仔裤</a>|
															</dd>
															<dd>
																<a href="/goods/list/162">休闲裤</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/28">精品内衣</a>
													</dt>
															<dd>
																<a href="/goods/list/163">文胸</a>|
															</dd>
															<dd>
																<a href="/goods/list/164">女式内裤</a>|
															</dd>
															<dd>
																<a href="/goods/list/165">男式内裤</a>|
															</dd>
															<dd>
																<a href="/goods/list/166">保暖内衣</a>|
															</dd>
															<dd>
																<a href="/goods/list/167">秋衣秋裤</a>|
															</dd>
															<dd>
																<a href="/goods/list/168">塑身美体</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/29">精品男鞋</a>
													</dt>
															<dd>
																<a href="/goods/list/169">正装鞋</a>|
															</dd>
															<dd>
																<a href="/goods/list/170">休闲鞋</a>|
															</dd>
															<dd>
																<a href="/goods/list/171">运动鞋</a>|
															</dd>
															<dd>
																<a href="/goods/list/172">凉鞋</a>|
															</dd>
															<dd>
																<a href="/goods/list/173">拖鞋</a>|
															</dd>
															<dd>
																<a href="/goods/list/174">男靴</a>
															</dd>
												</dl>
												<dl class="clearfix last">
													<dt>
														<a href="/goods/list/30">潮流女鞋</a>
													</dt>
															<dd>
																<a href="/goods/list/175">高跟鞋</a>|
															</dd>
															<dd>
																<a href="/goods/list/176">休闲鞋</a>|
															</dd>
															<dd>
																<a href="/goods/list/177">运动鞋</a>|
															</dd>
															<dd>
																<a href="/goods/list/178">凉鞋</a>|
															</dd>
															<dd>
																<a href="/goods/list/179">拖鞋</a>|
															</dd>
															<dd>
																<a href="/goods/list/180">女靴</a>
															</dd>
												</dl>
											<div class="auxiliary">
														<div>
															<strong>推荐品牌</strong>
																<a href="">耐克</a>
																<a href="">特步</a>
																<a href="">安踏</a>
																<a href="">劲霸</a>
																<a href="">柒牌</a>
																<a href="">杉杉</a>
																<a href="">红豆</a>
																<a href="">婷美</a>
														</div>
											</div>
										</div>
								</li>
								<li>
										<div class="item">
											<div>
													<a href="/goods/list/31">
														<strong>面部护肤</strong>
													</a>
													<a href="/goods/list/32">
														<strong>身体护肤</strong>
													</a>
													<a href="/goods/list/33">
														<strong>口腔护理</strong>
													</a>
											</div>
											<div>
														<a href="">薇姿</a>
														<a href="">美即</a>
														<a href="">多芬</a>
														<a href="">沙宣</a>
											</div>
										</div>
										<div class="menu">
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/31">面部护肤</a>
													</dt>
															<dd>
																<a href="/goods/list/181">清洁</a>|
															</dd>
															<dd>
																<a href="/goods/list/182">护肤</a>|
															</dd>
															<dd>
																<a href="/goods/list/183">面膜</a>|
															</dd>
															<dd>
																<a href="/goods/list/184">剃须</a>|
															</dd>
															<dd>
																<a href="/goods/list/185">化妆水</a>|
															</dd>
															<dd>
																<a href="/goods/list/186">套装</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/32">身体护肤</a>
													</dt>
															<dd>
																<a href="/goods/list/187">沐浴</a>|
															</dd>
															<dd>
																<a href="/goods/list/188">润肤</a>|
															</dd>
															<dd>
																<a href="/goods/list/189">颈部</a>|
															</dd>
															<dd>
																<a href="/goods/list/190">手足</a>|
															</dd>
															<dd>
																<a href="/goods/list/191">塑形</a>|
															</dd>
															<dd>
																<a href="/goods/list/192">美胸</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/33">口腔护理</a>
													</dt>
															<dd>
																<a href="/goods/list/193">牙膏</a>|
															</dd>
															<dd>
																<a href="/goods/list/194">牙粉</a>|
															</dd>
															<dd>
																<a href="/goods/list/195">牙刷</a>|
															</dd>
															<dd>
																<a href="/goods/list/196">牙线</a>|
															</dd>
															<dd>
																<a href="/goods/list/197">漱口水</a>|
															</dd>
															<dd>
																<a href="/goods/list/198">套装</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/34">洗发护发</a>
													</dt>
															<dd>
																<a href="/goods/list/199">洗发</a>|
															</dd>
															<dd>
																<a href="/goods/list/200">护发</a>|
															</dd>
															<dd>
																<a href="/goods/list/201">染发</a>|
															</dd>
															<dd>
																<a href="/goods/list/202">造型</a>|
															</dd>
															<dd>
																<a href="/goods/list/203">假发</a>|
															</dd>
															<dd>
																<a href="/goods/list/204">套装</a>
															</dd>
												</dl>
												<dl class="clearfix last">
													<dt>
														<a href="/goods/list/35">香水彩妆</a>
													</dt>
															<dd>
																<a href="/goods/list/205">香水</a>|
															</dd>
															<dd>
																<a href="/goods/list/206">底妆</a>|
															</dd>
															<dd>
																<a href="/goods/list/207">腮红</a>|
															</dd>
															<dd>
																<a href="/goods/list/208">眼部</a>|
															</dd>
															<dd>
																<a href="/goods/list/209">唇部</a>|
															</dd>
															<dd>
																<a href="/goods/list/210">美甲</a>
															</dd>
												</dl>
											<div class="auxiliary">
														<div>
															<strong>推荐品牌</strong>
																<a href="">薇姿</a>
																<a href="">美即</a>
																<a href="">多芬</a>
																<a href="">沙宣</a>
																<a href="">欧莱雅</a>
																<a href="">美宝莲</a>
																<a href="">妮维雅</a>
																<a href="">海飞丝</a>
														</div>
											</div>
										</div>
								</li>
								<li>
										<div class="item last">
											<div>
													<a href="/goods/list/36">
														<strong>家纺布艺</strong>
													</a>
													<a href="/goods/list/37">
														<strong>家居照明</strong>
													</a>
													<a href="/goods/list/38">
														<strong>家装建材</strong>
													</a>
											</div>
											<div>
														<a href="">欧普</a>
														<a href="">公牛</a>
														<a href="">妙洁</a>
														<a href="">中宇</a>
											</div>
										</div>
										<div class="menu">
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/36">家纺布艺</a>
													</dt>
															<dd>
																<a href="/goods/list/211">被子</a>|
															</dd>
															<dd>
																<a href="/goods/list/212">毯子</a>|
															</dd>
															<dd>
																<a href="/goods/list/213">凉席</a>|
															</dd>
															<dd>
																<a href="/goods/list/214">蚊帐</a>|
															</dd>
															<dd>
																<a href="/goods/list/215">床垫</a>|
															</dd>
															<dd>
																<a href="/goods/list/216">布艺</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/37">家居照明</a>
													</dt>
															<dd>
																<a href="/goods/list/217">台灯</a>|
															</dd>
															<dd>
																<a href="/goods/list/218">吊灯</a>|
															</dd>
															<dd>
																<a href="/goods/list/219">壁灯</a>|
															</dd>
															<dd>
																<a href="/goods/list/220">射灯</a>|
															</dd>
															<dd>
																<a href="/goods/list/221">吸顶灯</a>|
															</dd>
															<dd>
																<a href="/goods/list/222">落地灯</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/38">家装建材</a>
													</dt>
															<dd>
																<a href="/goods/list/223">开关</a>|
															</dd>
															<dd>
																<a href="/goods/list/224">插座</a>|
															</dd>
															<dd>
																<a href="/goods/list/225">电线</a>|
															</dd>
															<dd>
																<a href="/goods/list/226">转换插头</a>|
															</dd>
															<dd>
																<a href="/goods/list/227">电工电料</a>|
															</dd>
															<dd>
																<a href="/goods/list/228">监控安防</a>
															</dd>
												</dl>
												<dl class="clearfix">
													<dt>
														<a href="/goods/list/39">生活日用</a>
													</dt>
															<dd>
																<a href="/goods/list/229">收纳用品</a>|
															</dd>
															<dd>
																<a href="/goods/list/230">晴雨用具</a>|
															</dd>
															<dd>
																<a href="/goods/list/231">浴室用品</a>|
															</dd>
															<dd>
																<a href="/goods/list/232">针织用品</a>|
															</dd>
															<dd>
																<a href="/goods/list/233">净化除味</a>|
															</dd>
															<dd>
																<a href="/goods/list/234">驱蚊驱虫</a>
															</dd>
												</dl>
												<dl class="clearfix last">
													<dt>
														<a href="/goods/list/40">清洁用品</a>
													</dt>
															<dd>
																<a href="/goods/list/235">纸品湿巾</a>|
															</dd>
															<dd>
																<a href="/goods/list/236">衣物洗护</a>|
															</dd>
															<dd>
																<a href="/goods/list/237">皮具护理</a>|
															</dd>
															<dd>
																<a href="/goods/list/238">居家清洁</a>|
															</dd>
															<dd>
																<a href="/goods/list/239">清洁工具</a>|
															</dd>
															<dd>
																<a href="/goods/list/240">驱虫用品</a>
															</dd>
												</dl>
											<div class="auxiliary">
														<div>
															<strong>推荐品牌</strong>
																<a href="">欧普</a>
																<a href="">公牛</a>
																<a href="">妙洁</a>
																<a href="">中宇</a>
																<a href="">多喜爱</a>
																<a href="">北极绒</a>
																<a href="">恒源祥</a>
																<a href="">富安娜</a>
														</div>
											</div>
										</div>
								</li>
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