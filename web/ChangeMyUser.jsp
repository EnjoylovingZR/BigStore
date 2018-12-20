<%@ page import="com.RuoLiang.User" %>
<%@ page import="com.RuoLiang.ChangeUser" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2018/12/8
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String password = new String(new String((request.getParameter("thepassword")).getBytes("ISO-8859-1"),"UTF-8"));
    String name = new String(new String((request.getParameter("thename")).getBytes("ISO-8859-1"),"UTF-8"));
    int num = Integer.parseInt(new String((request.getParameter("thenum")).getBytes("ISO-8859-1"),"UTF-8"));

    String email = null;
    if (session.getAttribute("theUser")!= null) {
        User user = (User) session.getAttribute("theUser");
        email = user.getNowEmail();
    }
    ChangeUser changeUser = new ChangeUser();
    changeUser.changeIt(email,name,password,num);

    if(changeUser.getFlag()==1){
%>
<script type="text/javascript" language="javascript">alert("修改成功！");window.document.location.href="signin.html";
</script>
<%
}
else{
%>
<script type="text/javascript" language="javascript">alert("修改失败！");history.go(-1);
</script>
<%
    }

%>
