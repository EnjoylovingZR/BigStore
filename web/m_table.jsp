<%@ page import="com.RuoLiang.GetGood" %>
<%@ page import="java.util.List" %>
<%@ page import="com.RuoLiang.Good" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>BIG STORE 后台管理系统</title>
<meta name="keywords"  content="设置关键词..." />
<meta name="description" content="设置描述..." />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<link rel="icon" href="images/icon/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="javascript/jquery.js"></script>
<script src="javascript/plug-ins/customScrollbar.min.js"></script>
<script src="javascript/plug-ins/echarts.min.js"></script>
<script src="javascript/plug-ins/layerUi/layer.js"></script>
<script src="editor/ueditor.config.js"></script>
<script src="editor/ueditor.all.js"></script>
<script src="javascript/plug-ins/pagination.js"></script>
<script src="javascript/public.js"></script>
</head>
<body>
<div class="main-wrap">
	<div class="side-nav">
		<div class="side-logo">
			<div class="logo">
				<span class="logo-ico">
					<i class="i-l-1"></i>
					<i class="i-l-2"></i>
					<i class="i-l-3"></i>
				</span>
				<strong>BIG STORE 后台管理系统</strong>
			</div>
		</div>
		
		<nav class="side-menu content mCustomScrollbar" data-mcs-theme="minimal-dark">
			<h2>
				<a href="m_index.html" class="InitialPage"><i class="icon-home"></i>首页</a>
			</h2>
			<ul>
				<h2>
					<a href="m_form2.html" class="InitialPage"><i class="icon-fighter-jet"></i></i>商品发布</a>
				</h2>
				<h2>
					<a href="m_table.jsp" class="InitialPage"><i class="icon-table"></i>商品管理</a>
				</h2>
			</ul>
		</nav>
		
		<footer class="side-footer">© BIG STORE 版权所有</footer>
		
	</div>
	<div class="content-wrap">
		<header class="top-hd">
			<div class="hd-lt">
				<a class="icon-reorder"></a>
			</div>
			<div class="hd-rt">
				<ul>
					<li>
						<a href="index.html" target="_blank"><i class="icon-home"></i>前台访问</a>
					</li>
					<!-- <li>
						<a><i class="icon-random"></i>清除缓存</a>
					</li>
					<li>
						<a><i class="icon-user"></i>管理员:<em>DeathGhost</em></a>
					</li>
					<li>
						<a><i class="icon-bell-alt"></i>系统消息</a>
					</li> -->
					<li>
						<a href="javascript:void(0)" id="JsSignOut"><i class="icon-signout"></i>安全退出</a>
					</li>
				</ul>
			</div>
		</header>

		<main class="main-cont content mCustomScrollbar">
			<div class="page-wrap">
				<!--开始::内容-->
				<section class="page-hd">
					<header>
						<h2 class="title">商品管理</h2>
						<p class="title-description">
							您可以在这里查看、编辑、修改、删除已发布的商品。
						</p>
					</header>
					<hr>
				</section>
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>id</th>
							<th>商品名称</th>
							<th>库存数量</th>
							<th>已售</th>
							<th>售价</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
                    <%
                        GetGood getGood = new GetGood();
                        List<Good> list = getGood.GetIt();
                        int num=1;
                        for (Good good : list){
                    %>
                            <tr class="cen">
                                <td><% out.print(num++); %></td>
                                <td class="lt"><a href="product.jsp?thegid=<% out.print(good.getGID()); %>"><% out.print(good.getGName()); %></a></td>
                                <td><% out.print(good.getGNum()); %></td>
                                <td><% out.print(50-good.getGNum()); %></td>
                                <td><% out.print(good.getGPrice()); %></td>
                                <td>
                                    <a title="编辑" class="mr-5" href="m_change.jsp?gid=<% out.print(good.getGID()); %>">编辑</a>
                                    <a title="详情" class="mr-5" href="product.jsp?thegid=<% out.print(good.getGID()); %>">详情</a>
                                    <a title="删除" class="mr-5" href="DelSelectGood.jsp?gid=<% out.print(good.getGID()); %>">删除</a>
                                </td>
                            </tr>
                    <%
                        }
                    %>


					</tbody>
				</table>
				<!--开始::结束-->
			</div>
		</main>
		<footer class="btm-ft">
			<p class="clear">
				<span class="fl">©Copyright 2018</span>
			</p>
		</footer>
	</div>
</div>

</body>
</html>
