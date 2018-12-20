<%@ page import="java.util.List" %>
<%@ page import="com.RuoLiang.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>购物车</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Sublime project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/cart.css">
<link rel="stylesheet" type="text/css" href="styles/cart_responsive.css">
</head>
<body>

<div class="super_container">

    <%
        int flag = 0;
        String nowName;
        User user = new User();
        if (session.getAttribute("theUser")!= null) {
            user = (User) session.getAttribute("theUser");
            /*        System.out.println(user.getNowName());*/
            flag = 1;
        }
        else {
            %>
            <script type="text/javascript" language="javascript">alert("您尚未登录！");window.document.location.href="signin.html";
            </script>
    <%
        }
    %>

    <!-- Header -->

    <header class="header">
        <div class="header_container">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="header_content d-flex flex-row align-items-center justify-content-start">
                            <div class="logo"><a href="#">BIG STORE</a></div>
                            <nav class="main_nav">
                                <ul>
                                    <li >
                                        <a href="index.jsp">首页</a>
                                        <!-- <ul>
                                            <li><a href="categories.jsp">Categories </a></li>
                                            <li><a href="product.html">Product</a></li>
                                            <li><a href="cart.jsp">Cart</a></li>
                                            <li><a href="checkout.html">Check out</a></li>
                                            <li><a href="contact.jsp">Contact</a></li>
                                        </ul> -->
                                    </li>
                                    <li>
                                        <a href="categories.jsp">分类</a>
                                        <!-- <ul>
                                            <li><a href="categories.jsp">Category</a></li>
                                            <li><a href="categories.jsp">Category</a></li>
                                            <li><a href="categories.jsp">Category</a></li>
                                            <li><a href="categories.jsp">Category</a></li>
                                            <li><a href="categories.jsp">Category</a></li>
                                        </ul> -->
                                    </li>
                                    <li><a href="#">我的收藏</a></li>
                                    <li><a href="contact.jsp">联系我们</a></li>
                                    <%
                                        if (flag == 0){
                                    %>
                                    <li class="hassubs hassubs2_ul"><a href="">用户中心 &nbsp</a>
                                        <ul style="text-align: center;">
                                            <li style="width: 50px;"><a href="signin.html">登 录</a></li>
                                            <li><a href="signup.html">注 册</a></li>
                                        </ul>
                                    </li>
                                    <%
                                    } else{
                                    %>
                                    <li class="hassubs hassubs2_ul"><a href=""><% out.print(user.getNowName()); %>&nbsp</a>
                                        <ul style="text-align: center;">
                                            <li style="width: 60px;"><a href="signin.html">用户中心</a></li>
                                            <li><a href="signup.html">登 出</a></li>
                                        </ul>
                                    </li>
                                    <%
                                        }
                                    %>

                                </ul>
                            </nav>
							<div class="header_extra ml-auto">
								<%
									if (flag==1) {
										GetCar getCar = new GetCar();
										getCar.GetIt(user.getNowEmail());
										int num = getCar.getThenum();
								%>
								<div class="shopping_cart">
									<a href="cart.jsp">
										<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
											 viewBox="0 0 489 489" style="enable-background:new 0 0 489 489;" xml:space="preserve">
                                                <g>
													<path d="M440.1,422.7l-28-315.3c-0.6-7-6.5-12.3-13.4-12.3h-57.6C340.3,42.5,297.3,0,244.5,0s-95.8,42.5-96.6,95.1H90.3
								        					c-7,0-12.8,5.3-13.4,12.3l-28,315.3c0,0.4-0.1,0.8-0.1,1.2c0,35.9,32.9,65.1,73.4,65.1h244.6c40.5,0,73.4-29.2,73.4-65.1
								        					C440.2,423.5,440.2,423.1,440.1,422.7z M244.5,27c37.9,0,68.8,30.4,69.6,68.1H174.9C175.7,57.4,206.6,27,244.5,27z M366.8,462
								        					H122.2c-25.4,0-46-16.8-46.4-37.5l26.8-302.3h45.2v41c0,7.5,6,13.5,13.5,13.5s13.5-6,13.5-13.5v-41h139.3v41
								        					c0,7.5,6,13.5,13.5,13.5s13.5-6,13.5-13.5v-41h45.2l26.9,302.3C412.8,445.2,392.1,462,366.8,462z"/>
												</g>
                                            </svg>
										<div>购物车 <span>(<% out.print(num); %>)</span></div>
									</a>
								</div>
								<%
								}else{
								%>
								<div class="shopping_cart">
									<a href="cart.jsp">
										<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
											 viewBox="0 0 489 489" style="enable-background:new 0 0 489 489;" xml:space="preserve">
                                                <g>
													<path d="M440.1,422.7l-28-315.3c-0.6-7-6.5-12.3-13.4-12.3h-57.6C340.3,42.5,297.3,0,244.5,0s-95.8,42.5-96.6,95.1H90.3
                                                        c-7,0-12.8,5.3-13.4,12.3l-28,315.3c0,0.4-0.1,0.8-0.1,1.2c0,35.9,32.9,65.1,73.4,65.1h244.6c40.5,0,73.4-29.2,73.4-65.1
                                                        C440.2,423.5,440.2,423.1,440.1,422.7z M244.5,27c37.9,0,68.8,30.4,69.6,68.1H174.9C175.7,57.4,206.6,27,244.5,27z M366.8,462
                                                        H122.2c-25.4,0-46-16.8-46.4-37.5l26.8-302.3h45.2v41c0,7.5,6,13.5,13.5,13.5s13.5-6,13.5-13.5v-41h139.3v41
                                                        c0,7.5,6,13.5,13.5,13.5s13.5-6,13.5-13.5v-41h45.2l26.9,302.3C412.8,445.2,392.1,462,366.8,462z"/>
												</g>
                                            </svg>

										<div>购物车 <span>(0)</span></div>
									</a>
								</div>
								<%
									}
								%>
                                <div class="search">
                                    <div class="search_icon">
                                        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                             viewBox="0 0 475.084 475.084" style="enable-background:new 0 0 475.084 475.084;"
                                             xml:space="preserve">
										<g>
                                            <path d="M464.524,412.846l-97.929-97.925c23.6-34.068,35.406-72.047,35.406-113.917c0-27.218-5.284-53.249-15.852-78.087
												c-10.561-24.842-24.838-46.254-42.825-64.241c-17.987-17.987-39.396-32.264-64.233-42.826
												C254.246,5.285,228.217,0.003,200.999,0.003c-27.216,0-53.247,5.282-78.085,15.847C98.072,26.412,76.66,40.689,58.673,58.676
												c-17.989,17.987-32.264,39.403-42.827,64.241C5.282,147.758,0,173.786,0,201.004c0,27.216,5.282,53.238,15.846,78.083
												c10.562,24.838,24.838,46.247,42.827,64.234c17.987,17.993,39.403,32.264,64.241,42.832c24.841,10.563,50.869,15.844,78.085,15.844
												c41.879,0,79.852-11.807,113.922-35.405l97.929,97.641c6.852,7.231,15.406,10.849,25.693,10.849
												c9.897,0,18.467-3.617,25.694-10.849c7.23-7.23,10.848-15.796,10.848-25.693C475.088,428.458,471.567,419.889,464.524,412.846z
												 M291.363,291.358c-25.029,25.033-55.148,37.549-90.364,37.549c-35.21,0-65.329-12.519-90.36-37.549
												c-25.031-25.029-37.546-55.144-37.546-90.36c0-35.21,12.518-65.334,37.546-90.36c25.026-25.032,55.15-37.546,90.36-37.546
												c35.212,0,65.331,12.519,90.364,37.546c25.033,25.026,37.548,55.15,37.548,90.36C328.911,236.214,316.392,266.329,291.363,291.358z
												"/>
                                        </g>
									</svg>
                                    </div>
                                </div>
                                <div class="hamburger"><i class="fa fa-bars" aria-hidden="true"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Search Panel -->
        <div class="search_panel trans_300">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="search_panel_content d-flex flex-row align-items-center justify-content-end">
                            <form action="#">
                                <input type="text" class="search_input" placeholder="Search" required="required">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Social -->
        <div class="header_social">
            <ul>
                <li><a href="#"><i class="fa fa-weixin" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-qq" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
            </ul>
        </div>
    </header>

	<!-- Menu -->

	<div class="menu menu_mm trans_300">
		<div class="menu_container menu_mm">
			<div class="page_menu_content">
							
				<div class="page_menu_search menu_mm">
					<form action="#">
						<input type="search" required="required" class="page_menu_search_input menu_mm" placeholder="Search for products...">
					</form>
				</div>
				<ul class="page_menu_nav menu_mm">
					<li class="page_menu_item has-children menu_mm">
						<a href="index.jsp">Home<i class="fa fa-angle-down"></i></a>
						<ul class="page_menu_selection menu_mm">
							<li class="page_menu_item menu_mm"><a href="categories.jsp">Categories<i class="fa fa-angle-down"></i></a></li>
							<li class="page_menu_item menu_mm"><a href="product.html">Product<i class="fa fa-angle-down"></i></a></li>
							<li class="page_menu_item menu_mm"><a href="cart.jsp">Cart<i class="fa fa-angle-down"></i></a></li>
							<li class="page_menu_item menu_mm"><a href="checkout.html">Checkout<i class="fa fa-angle-down"></i></a></li>
							<li class="page_menu_item menu_mm"><a href="contact.jsp">Contact<i class="fa fa-angle-down"></i></a></li>
						</ul>
					</li>
					<li class="page_menu_item has-children menu_mm">
						<a href="categories.jsp">Categories<i class="fa fa-angle-down"></i></a>
						<ul class="page_menu_selection menu_mm">
							<li class="page_menu_item menu_mm"><a href="categories.jsp">Category<i class="fa fa-angle-down"></i></a></li>
							<li class="page_menu_item menu_mm"><a href="categories.jsp">Category<i class="fa fa-angle-down"></i></a></li>
							<li class="page_menu_item menu_mm"><a href="categories.jsp">Category<i class="fa fa-angle-down"></i></a></li>
							<li class="page_menu_item menu_mm"><a href="categories.jsp">Category<i class="fa fa-angle-down"></i></a></li>
						</ul>
					</li>
					<li class="page_menu_item menu_mm"><a href="index.jsp">Accessories<i class="fa fa-angle-down"></i></a></li>
					<li class="page_menu_item menu_mm"><a href="#">Offers<i class="fa fa-angle-down"></i></a></li>
					<li class="page_menu_item menu_mm"><a href="contact.jsp">Contact<i class="fa fa-angle-down"></i></a></li>
				</ul>
			</div>
		</div>

		<div class="menu_close"><i class="fa fa-times" aria-hidden="true"></i></div>

		<div class="menu_social">
			<ul>
				<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</div>
	
	<!-- Home -->

	<div class="home">
		<div class="home_container">
			<div class="home_background" style="background-image:url(images/cart.jpg)"></div>
			<div class="home_content_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="home_content">
								<div class="breadcrumbs">
									<ul>
										<li><a href="index.jsp">首页</a></li>
										<li><a href="categories.jsp">商品分类</a></li>
										<li>购物车</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Cart Info -->

	<div class="cart_info">
		<div class="container">
			<div class="row">
				<div class="col">
					<!-- Column Titles -->
					<div class="cart_info_columns clearfix">
						<div class="cart_info_col cart_info_col_product">商品</div>
						<div class="cart_info_col cart_info_col_price">价格</div>
						<div class="cart_info_col cart_info_col_quantity">数量</div>
						<div class="cart_info_col cart_info_col_total">总计</div>
					</div>
				</div>
			</div>
			<div class="row cart_items_row">
				<div class="col">
                    <%
                        GetCar getCar = new GetCar();
                        List<Car> list = getCar.GetIt(user.getNowEmail());
                        int count = 1;
                        for (Car car:list){
                            if (car.getOStatus()==0){
                            GetSelectGood getSelectGood = new GetSelectGood();
                            Good good = getSelectGood.GetTheSelect(car.getOGID());
                    %>
                            <!-- Cart Item -->
                            <div class="cart_item d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start" onclick="calIt<% out.print(count); %>();calTotal();">
                                <!-- Name -->
                                <div class="cart_item_product d-flex flex-row align-items-center justify-content-start">
                                    <div class="cart_item_image">
                                        <div><img src="<% out.print(good.getGUrl()); %>" alt=""></div>
                                    </div>
                                    <div class="cart_item_name_container">
                                        <div class="cart_item_name"><a href="product.jsp?thegid=<% out.print(good.getGID()); %>"><% out.print(good.getGName()); %></a></div>
                                        <div class="cart_item_edit"><a href="DelFromCar.jsp?oid=<% out.print(car.getOID()); %>">删除</a></div>
                                    </div>
                                </div>
                                <!-- Price -->
                                <div class="cart_item_price">￥<span id="theprice<% out.print(count); %>"><% out.print(good.getGPrice()); %></span></div>
                                <script>
                                    function calIt<% out.print(count); %>(){
                                        var Num = $("#quantity_input<% out.print(count); %>").val();
                                        var Price = $("#theprice<% out.print(count); %>").text();
                                        var total = Num*Price;
                                        $("#thetotal<% out.print(count); %>").text(total);
                                    }
                                </script>
                                <!-- Quantity -->
                                <div class="cart_item_quantity">
                                    <div class="product_quantity_container">
                                        <div class="product_quantity clearfix">
                                            <span>数量</span>
                                            <input id="quantity_input<% out.print(count); %>" name="thenum" type="text" pattern="[0-9]*" value="<% out.print(car.getONum()); %>">
                                            <%--<div class="quantity_buttons">
                                                <div id="quantity_inc_button<% out.print(count); %>" class="quantity_inc quantity_control"><i class="fa fa-chevron-up" aria-hidden="true"></i></div>
                                                <div id="quantity_dec_button<% out.print(count); %>" class="quantity_dec quantity_control"><i class="fa fa-chevron-down" aria-hidden="true" ></i></div>
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                                <!-- Total -->
                                <div class="cart_item_total">￥<span id="thetotal<% out.print(count); %>" ><% out.print(good.getGPrice()*car.getONum()); %></span></div>
                            </div>
                    <%
                            count++;
                            }
                        }
                    %>


				</div>
			</div>

            <script>
                function calTotal() {
                    var total = 0;
                    for (var i=1;i<=<% out.print(count); %>;i++){
                        total = total*1+$("#thetotal"+i).text()*1;
                    }
                    $("#mytotal").text(total);
                    $("#mytotal2").text(total);
                    $("#jiesuan").attr("href","settlement.jsp?total="+total);
                }
                window.onload = calTotal;
            </script>
			<div class="row row_cart_buttons">
				<div class="col">
					<div class="cart_buttons d-flex flex-lg-row flex-column align-items-start justify-content-start">
						<div class="button continue_shopping_button"><a href="categories.jsp">继续购物</a></div>
						<div class="cart_buttons_right ml-lg-auto">
							<div class="button clear_cart_button"><a href="cleanCar.jsp?email=<% out.print(user.getNowEmail()); %>">清空购物车</a></div>
							<%--<div class="button update_cart_button"><a href="settlement.jsp?">更新购物车</a></div>--%>
						</div>
					</div>
				</div>
			</div>
			<div class="row row_extra">
				<div class="col-lg-4">
					
					<!-- Delivery -->
					<div class="delivery">
						<div class="section_title">配送方式</div>
						<div class="section_subtitle">Select the one you want</div>
						<div class="delivery_options">
							<label class="delivery_option clearfix">次日达
								<input type="radio" name="radio">
								<span class="checkmark"></span>
								<span class="delivery_price">￥<span>4.99</span></span>
							</label>
							<label class="delivery_option clearfix">隔日达
								<input type="radio" name="radio">
								<span class="checkmark"></span>
								<span class="delivery_price">￥<span>1.99</span></span>
							</label>
							<label class="delivery_option clearfix">自取
								<input type="radio" checked="checked" name="radio">
								<span class="checkmark"></span>
								<span class="delivery_price">Free<span></span></span>
							</label>
						</div>
					</div>

					<!-- Coupon Code -->
					<div class="coupon">
						<div class="section_title">折扣码</div>
						<div class="section_subtitle">Enter your coupon code</div>
						<div class="coupon_form_container">
							<form action="#" id="coupon_form" class="coupon_form">
								<input type="text" class="coupon_input" required="required">
								<button class="button coupon_button"><span>应用</span></button>
							</form>
						</div>
					</div>
				</div>
                <script>

                </script>
				<div class="col-lg-6 offset-lg-2">
					<div class="cart_total">
						<div class="section_title">合计</div>
						<div class="section_subtitle">Final info</div>
						<div class="cart_total_container"  onclick="calTotal();" >
							<ul>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="cart_total_title">商品</div>
									<div class="cart_total_value ml-auto">￥<span id="mytotal"></span></div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="cart_total_title">运费</div>
									<div class="cart_total_value ml-auto">Free</div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="cart_total_title">总价</div>
									<div class="cart_total_value ml-auto">￥<span id="mytotal2"></span></div>
								</li>
							</ul>
						</div>
						<div class="button checkout_button"><a id="jiesuan" href="#">结算</a></div>
					</div>
				</div>
			</div>
		</div>		
	</div>

	<!-- Footer -->
	
	<div class="footer_overlay"></div>
	<footer class="footer">
		<div class="footer_background" style="background-image:url(images/footer.jpg)"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="footer_content d-flex flex-lg-row flex-column align-items-center justify-content-lg-start justify-content-center">
						<div class="footer_logo"><a href="#">BIG Store</a></div>
						<div class="copyright ml-auto mr-auto"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">RuoLiang</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
						<div class="footer_social ml-lg-auto">
							<ul>
								<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/greensock/TweenMax.min.js"></script>
<script src="plugins/greensock/TimelineMax.min.js"></script>
<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="plugins/greensock/animation.gsap.min.js"></script>
<script src="plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/cart.js"></script>

<script type="text/javascript">
    /*function c() {
        var Num = document.getElementById("quantity_input").value;
        var Price = document.getElementById("theprice").value;
        var total = Num*Price;
        document.getElementById("thetotal").innerText = total;
    }*/

</script>

</body>
</html>