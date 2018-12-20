<%@ page import="com.RuoLiang.UserSignin" %>
<%@ page import="com.RuoLiang.User" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2018/11/29
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String password = new String(new String((request.getParameter("thepassword")).getBytes("ISO-8859-1"),"UTF-8"));
    String email = new String(new String((request.getParameter("theemail")).getBytes("ISO-8859-1"),"UTF-8"));
    int flag = 0;

    UserSignin userSignin = new UserSignin();
    userSignin.SignIn(email,password);
    flag = userSignin.getFlag();


    if(flag == 1){
    %>
        <script type="text/javascript" language="javascript">alert("登录成功！");window.document.location.href="index.jsp";
        </script>
    <%
        User user = new User(userSignin.getName(),password,email);
        session.setAttribute("theUser",user);
        } else{
    %>
        <script type="text/javascript" language="javascript">alert("邮箱或密码错误！");window.document.location.href="signin.html";
        </script>
    <%
    }



%>