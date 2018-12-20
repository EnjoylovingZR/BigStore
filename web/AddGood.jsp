<%@ page import="com.RuoLiang.AddGood" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2018/12/1
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String name = new String(new String((request.getParameter("GName")).getBytes("ISO-8859-1"),"UTF-8"));
    String categorie = new String(new String((request.getParameter("type")).getBytes("ISO-8859-1"),"UTF-8"));
    int price = Integer.parseInt(new String((request.getParameter("GPrice")).getBytes("ISO-8859-1"),"UTF-8"));
    int num = Integer.parseInt(new String((request.getParameter("GNum")).getBytes("ISO-8859-1"),"UTF-8"));
    String url = new String(new String((request.getParameter("GImg1")).getBytes("ISO-8859-1"),"UTF-8"));
    String text = new String(new String((request.getParameter("text")).getBytes("ISO-8859-1"),"UTF-8"));


    AddGood addGood = new AddGood();
    addGood.Add(name,price,num,categorie,url,text);

    if(addGood.getFlag()==1){
%>
        <script type="text/javascript" language="javascript">alert("添加成功！");window.document.location.href="signin.html";
        </script>
<%
}
        else{
%>
        <script type="text/javascript" language="javascript">alert("添加失败！");window.document.location.href="signup.html";
        </script>
<%
    }

%>


