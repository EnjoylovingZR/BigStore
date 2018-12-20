<%@ page import="com.RuoLiang.DelFromCar" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2018/12/5
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int oid = Integer.parseInt(new String((request.getParameter("oid")).getBytes("ISO-8859-1"),"UTF-8"));
    DelFromCar delFromCar = new DelFromCar();
    delFromCar.delIt(oid);
    if(delFromCar.getFlag()==1) {
%>
<script type="text/javascript" language="javascript">alert("删除成功！");window.document.location.href="cart.jsp";
</script>
<%
}else {
%>
<script type="text/javascript" language="javascript">alert("删除失败！");window.document.location.href="cart.jsp";
</script>
<%
    }
%>