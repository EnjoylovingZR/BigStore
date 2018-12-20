<%@ page import="com.RuoLiang.User" %>
<%@ page import="com.RuoLiang.GetUser" %>
<%@ page import="com.RuoLiang.ChangeGoodNum" %>
<%@ page import="com.RuoLiang.ChangeOrderStatus" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2018/12/4
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = new User();
    if (session.getAttribute("theUser")!= null) {
        user = (User) session.getAttribute("theUser");
    }
    GetUser getUser = new GetUser();
    User user1 = getUser.GetTheSelect(user.getNowEmail());

    int total = Integer.parseInt(new String((request.getParameter("total")).getBytes("ISO-8859-1"),"UTF-8"));
    if (total>user1.getNowBalance()){
%>
        <script type="text/javascript" language="javascript">alert("抱歉，您的余额不足！");window.document.location.href="cart.jsp";
        </script>
<%
    }else{


        ChangeOrderStatus changeOrderStatus = new ChangeOrderStatus();
        changeOrderStatus.changeIt(user.getNowEmail(),total);
        ChangeGoodNum changeGoodNum = new ChangeGoodNum();
        changeGoodNum.changeNum();

%>
        <script type="text/javascript" language="javascript">
            var nowB = <% out.print(user.getNowBalance()-total); %>
            alert("购买成功！您的当前余额为￥<% out.print(user1.getNowBalance()*1-total*1); %>");window.document.location.href="cart.jsp";
        </script>
<%
    }

%>
