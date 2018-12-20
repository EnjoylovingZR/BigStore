<%@ page import="com.RuoLiang.CleanCar" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2018/12/9
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String email = new String(new String((request.getParameter("email")).getBytes("ISO-8859-1"),"UTF-8"));
    CleanCar cleanCar = new CleanCar();
    cleanCar.delIt(email);
    if(cleanCar.getFlag()==1) {
%>
<script type="text/javascript" language="javascript">window.document.location.href="cart.jsp";
</script>
<%
}else {
%>
<script type="text/javascript" language="javascript">window.document.location.href="cart.jsp";
</script>
<%
    }
%>