<%@ page import="com.RuoLiang.User" %>
<%@ page import="com.RuoLiang.AddComment" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2018/12/5
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String text = new String(new String((request.getParameter("text")).getBytes("ISO-8859-1"),"UTF-8"));
int gid = Integer.parseInt(new String((request.getParameter("gid")).getBytes("ISO-8859-1"),"UTF-8"));

    if (session.getAttribute("theUser")!= null) {
        User user = (User) session.getAttribute("theUser");
        String name = user.getNowName();

        AddComment addComment = new AddComment();
        addComment.Add(name,text,gid);
        if (addComment.getFlag()==1) {
%>
        <script type="text/javascript" language="javascript">alert("评论成功！");history.go(-1);
        </script>
<%
        }
        else{
            %>
            <script type="text/javascript" language="javascript">alert("评论失败！");history.go(-1);
        </script>
<%
        }
    }
    else {
%>
            <script type="text/javascript" language="javascript">alert("您尚未登录！");window.document.location.href="signin.html";
            </script>
<%
    }
%>