<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2018/12/8
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.removeAttribute("theUser");
%>
<script type="text/javascript" language="javascript">alert("登出成功！");window.document.location.href="index.jsp";
</script>
<%
%>