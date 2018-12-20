<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.RuoLiang.UserSignup" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2018/11/27
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    String name = new String(new String((request.getParameter("thename")).getBytes("ISO-8859-1"),"UTF-8"));
    String password = new String(new String((request.getParameter("thepassword")).getBytes("ISO-8859-1"),"UTF-8"));
    String email = new String(new String((request.getParameter("theemail")).getBytes("ISO-8859-1"),"UTF-8"));

    UserSignup userSignup = new UserSignup();
    userSignup.SignUp(name,password,email);

    if(userSignup.getFlag()==1){
    %>
        <script type="text/javascript" language="javascript">alert("注册成功！");window.document.location.href="signin.html";
        </script>
    <%
    }
    else{
    %>
        <script type="text/javascript" language="javascript">alert("注册失败！");window.document.location.href="signup.html";
        </script>
    <%
    }

%>
<%--

--%>
