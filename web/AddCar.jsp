<%@ page import="com.RuoLiang.AddCar" %>
<%@ page import="com.RuoLiang.User" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2018/12/3
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getParameter("gid")!=null&&request.getParameter("num")!=null) {
        Integer gid = Integer.parseInt(new String((request.getParameter("gid")).getBytes("ISO-8859-1"), "UTF-8"));
        Integer num = Integer.parseInt(new String((request.getParameter("num")).getBytes("ISO-8859-1"), "UTF-8"));

        System.out.println(gid+" "+num);

        User user = new User();
        if (session.getAttribute("theUser")!=null){
            user = (User) session.getAttribute("theUser");
            AddCar addCar = new AddCar();
            addCar.Add(user.getNowEmail(),gid,num,0);
            if(addCar.getFlag()==1) {
                %>
                <script type="text/javascript" language="javascript">alert("添加成功！");window.document.location.href="cart.jsp";
                </script>
                <%
            }else {
                %>
                <script type="text/javascript" language="javascript">alert("添加失败！");history.go(-1);
                </script>
                <%
            }
        }

    }
%>