<%@ page import="com.RuoLiang.GetSelectGood" %>
<%@ page import="com.RuoLiang.Good" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2018/12/5
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Good good = new Good(); %>
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
                        <h2 class="title">商品修改</h2>
                        <p class="title-description">
                            您可以在这里编辑并发布商品信息。
                        </p>
                    </header>
                    <hr>
                </section>
                <%
                    Integer gid = Integer.parseInt(new String((request.getParameter("gid")).getBytes("ISO-8859-1"), "UTF-8"));
                    GetSelectGood getSelectGood = new GetSelectGood();
                    good = getSelectGood.GetTheSelect(gid);
                %>
                <form action="ChangeGood.jsp" method="post">
                    <input name="gid" value="<% out.print(gid); %>" style="display: none">
                    <div class="form-group-col-2">
                        <div class="form-label" >商品名称：</div>
                        <div class="form-cont" style="width: 80%;">
                            <input type="text" placeholder="请输入名称" class="form-control form-boxed" name="GName" value="<% out.print(good.getGName()); %>">
                        </div>
                    </div>
                    <div class="form-group-col-2">
                        <div class="form-label" >商品价格：</div>
                        <div class="form-cont" style="width: 80%;">
                            <input type="text" placeholder="请输入价格" class="form-control form-boxed" name="GPrice" value="<% out.print(good.getGPrice()); %>">
                        </div>
                    </div>
                    <div class="form-group-col-2">
                        <div class="form-label" >商品数量：</div>
                        <div class="form-cont" style="width: 80%;">
                            <input type="text" placeholder="请输入数量" class="form-control form-boxed" name="GNum" value="<% out.print(good.getGNum()); %>">
                        </div>
                    </div>
                    <div class="form-group-col-2">
                        <div class="form-label" >上传图片：</div>
                        <div class="form-cont" style="width: 80%;">
                            <input type="text" class="form-control form-boxed" name="GImg1" placeholder="请输入URL" value="<% out.print(good.getGUrl()); %>">
                        </div>
                    </div>
                    <div class="form-group-col-2">
                        <div class="form-label" >上传图片：</div>
                        <div class="form-cont" style="width: 80%;">
                            <input type="text" class="form-control form-boxed" name="GImg2" placeholder="请输入URL">
                        </div>
                    </div>
                    <div class="form-group-col-2">
                        <div class="form-label" >上传图片：</div>
                        <div class="form-cont" style="width: 80%;">
                            <input type="text" class="form-control form-boxed" name="GImg3" placeholder="请输入URL">
                        </div>
                    </div>
                    <div class="form-group-col-2">
                        <div class="form-label" >上传图片：</div>
                        <div class="form-cont" style="width: 80%;">
                            <input type="text" class="form-control form-boxed" name="GImg4" placeholder="请输入URL">
                        </div>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label" >商品类别：</div>
                        <div class="form-cont">
                            <label class="radio">
                                <input type="radio" name="type" checked="checked" value="Phone" />
                                <span>智能手机</span>
                            </label>
                            <label class="radio">
                                <input type="radio" name="type" value="Computer"/>
                                <span>个人电脑</span>
                            </label>
                            <label class="radio">
                                <input type="radio" name="type" value="Smart Device"/>
                                <span>智能设备</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group-col-2">
                        <div class="form-label">商品介绍：</div>
                        <div id="editor" class="Myeditor" style="display: inline-block;width: 80%;">
                            <p><% out.print(good.getGText()); %></p>
                        </div>
                    </div>
                    <div style="display: none;">
                        <textarea id="text1" style="resize:none;" name="text"></textarea>
                    </div>

                    <div class="form-group-col-2">
                        <div class="form-label"></div>
                        <div class="form-cont">

                            <input type="submit" class="btn btn-primary" value="提交" />
                            <a class="btn btn-primary" href="https://sm.ms/" style="margin-left: 30px;color: white;" target="_blank">图床</a>
                        </div>
                    </div>
                </form>
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

<div class="mask"></div>
<div class="dialog">
    <div class="dialog-hd">
        <strong class="lt-title">标题</strong>
        <a class="rt-operate icon-remove JclosePanel" title="关闭"></a>
    </div>
    <div class="dialog-bd">
        <!--start::-->
        <p>这里是基础弹窗,可以定义文本信息，HTML信息这里是基础弹窗,可以定义文本信息，HTML信息。</p>
        <!--end::-->
    </div>
    <div class="dialog-ft">
        <button class="btn btn-info JyesBtn">确认</button>
        <button class="btn btn-secondary JnoBtn">关闭</button>
    </div>
</div>

<script type="text/javascript" src="javascript/wangEditor.min.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#editor')
    var $text1 = $('#text1')
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $text1.val(html)
    }
    editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
    editor.create()
    $text1.val(editor.txt.html())
    document.getElementById('btn1').addEventListener('click', function () {
        // 读取 html
        alert(editor.txt.html())
    }, false)

    document.getElementById('btn2').addEventListener('click', function () {
        // 读取 text
        alert(editor.txt.text())
    }, false)

</script>
</body>
</html>
