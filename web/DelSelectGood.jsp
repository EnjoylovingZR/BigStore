<%@ page import="com.RuoLiang.DelSelectGood" %>
<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2018/12/5
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int gid = Integer.parseInt(new String((request.getParameter("gid")).getBytes("ISO-8859-1"),"UTF-8"));
    DelSelectGood delSelectGood = new DelSelectGood();
    delSelectGood.delIt(gid);
    if(delSelectGood.getFlag()==1) {
%>
    <script type="text/javascript" language="javascript">alert("删除成功！");window.document.location.href="m_table.jsp";
    </script>
<%
    }else {
%>
    <script type="text/javascript" language="javascript">alert("删除失败！");window.document.location.href="m_table.jsp";
    </script>
<%
    }
%>