<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<html>
 <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>注销页面 </title>
 </head>
 <body> 
 <center>
  <%
   response.setHeader("refresh", "2; URL = login.jsp");  // 定时跳转
   session.invalidate(); // 注销 session 
  %>
  
  <h3>您已成功退出本系统，两秒钟后跳转到登陆页</h3>
  <h3>如果没有自动跳转，请点击<a href="login.jsp">这里</a></h3>
  </center>
 </body>
</html>

