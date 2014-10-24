<%@ page language="java" import="java.util.*,javabean.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>在线考试系统首页</title>
<link type="text/css" rel="stylesheet" href="style/mainindex.css" /><link type="text/css" rel="stylesheet" href="style/components/pageTable/pageTable.css" /><script language="javascript" charset="UTF-8" src="js/jquery.js" ></script>
</head>

<body>
<script language="javascript" charset="UTF-8" src="js/index/injectLogin.js" login="1" ></script>

<div id="container" class="box block_12">
    <!-- // header -->
    <div id="head">
    <div class="head_top">
        <div class="logo"><img src="images/oes_logo.jpg"/></div>
        <div class="company_title" style="font-weight: bold;">在线考试系统v5.0</div>
        <div class="head_right">
            <div class="user_photo"><a href="/user.php?a=information"><img src="images/user_photo.jpg" width="42" height="42" /></a></div>
            <div class="user_information">
                <div id="userLoginBlock" class="user_information_top">
                    <h1><a href="stublank.jsp" target="main"><%=session.getAttribute("name") %></a> 欢迎使用本系统</h1>
                    <ul class="user_menu" style="display:none;">
                        <li><a href="#" onclick="window.L.extension.injectLogin(); return false;">登入</a></li>                        <li><a href="/index.php?a=retrievePassword" target="_blank">找回</a></li>
                    </ul>
                                                <ul class="user_menu">
                                                   <li><a href="/user.php?a=changePassword" target="_blank">修改密码</a></li>
                                <li><a href="logout.jsp">退出</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class=" cl"></div>
    <div class="nav">
        <div class="navbox">
            <div class="nav_menu">
                <ul>
                                        <li onmouseover="style.background='#2b79ad'" onmouseout="style.background='#589BC8'"><a href="stublank.jsp" target="main">首页</a></li>
                                       <li onmouseover="style.background='#2b79ad'" onmouseout="style.background='#589BC8'"><a href="stumain.jsp" target="main">开始考试</a></li>
                    <li onmouseover="style.background='#2b79ad'" onmouseout="style.background='#589BC8'"><a href="stugrade.jsp" target="main">查看历史成绩</a></li>
                                    </ul>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="head">
<table>
<tr><iframe src="stublank.jsp" width="100%" height="700px" frameborder="0" scrolling="no" name="main"></iframe></tr>
<tr><iframe src="" width="100%" height="100px" frameborder="0" scrolling="no"></iframe></tr>
</table></div>
</body>
</html>
