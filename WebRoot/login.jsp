<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>在线考试系统首页</title>
<link type="text/css" rel="stylesheet" href="style/login_style.css" /><link type="text/css" rel="stylesheet" href="style/login_reset.css" /><script language="javascript" charset="UTF-8" src="js/jquery.js" ></script>
</head>

<body class="bg">
<!----------login部分----------------------------------->
 <form name="loginform" action="./servlet/Loginservlet" method="post">
<div class="log">
<div class="wrapper">
<div class="login_bg_oes">
    <div class="login corner">
       <div class="login_title">
            <h3 class="login_title_1">登&nbsp;录</h3>
       </div>
       <div class="loginbox">    
          <div class="conbox">
              <span class="boxname">账号:</span>
              <div class="l_username corner">
                   <input name="username" id="username" type="text" placeholder="请输入账号">
              </div> 
          </div>
          <div class="conbox">
              <span class="boxname">密码:</span> 
              <div class="l_password corner">
                   <input name="password" id="password" type="password" placeholder="请输入密码">
              </div>
          </div>
          <div></div><!--虽然我是空的div 但是删除了我，在ie6下，你就不好用 呵呵呵---->
          <div id="captchaDl" class="conbox" style="display:none;">
              <span class="boxname">验证码</span>
              <div class="captchaDl">
              </div>
          </div>
          <div class="conbox_autoLogin">
              <div class="l_autoLogin">教师：<input type="radio" name="identity" value="2" checked="checked">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学生：<input type="radio" name="identity" value="1"></div>
                        </div>
                 
          <div class="conbox">
              <div class="boxname"></div>
              <a href="javascript:document.loginform.submit();" id="login" class="l_enter corner" alt="登录按钮">登&nbsp;&nbsp;录</a>

              <a href="javascript:document.loginform.reset();" id="reset" class="l_enter corner" alt="重置按钮" style="margin-left:90px;margin-top:10px;">重&nbsp;&nbsp;置</a>
          </div>
          <div></div><!--虽然我是空的div 但是删除了我，在ie6下，你就不好用 呵呵呵---->
          <div class="l_hint" >
             <div id="error" class="l_wrong" style="display:;"></div>
          </div>
       </div>
    </div>
</div>
</div>
</div>
       </form>
       </body></html>