<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>在线考试系统首页</title>
<link type="text/css" rel="stylesheet" href="style/exam/main.css" /><script language="javascript" charset="UTF-8" src="js/jquery.js" ></script><script language="javascript" charset="UTF-8" src="include/Of/LanguagePacks/L.js"></script>
</head>

<body>
<script language="javascript" charset="UTF-8" src="js/index/injectLogin.js" login="1" ></script>
<script>
function initArray(){
  for(i=0;i<initArray.arguments.length;i++)
  this[i]=initArray.arguments[i];
}

var isnMonths=new initArray("1","2","3","4","5","6","7","8","9","10","11","12");
var isnDays=new initArray("星期日","星期一","星期二","星期三","星期四","星期五","星期六","星期日");
today=new Date();
hrs=today.getHours();
min=today.getMinutes();
sec=today.getSeconds();
clckh=""+((hrs>12)?hrs-12:hrs);
clckm=((min<10)?"0":"")+min;clcks=((sec<10)?"0":"")+sec;
clck=(hrs>=12)?"下午":"上午";
var stnr="";
var ns="0123456789";
var a="";

function getFullYear(d){
  yr=d.getYear();
  if(yr<1000)
  yr+=1900;
  return yr;
}
</script>

<!--十，分，秒-->
<script type="text/javascript">
function showLocale(obj){
	var str;
	var hh = obj.getHours();
	if(hh<10)
	hh = '0' + hh;
	
	var mm = obj.getMinutes();
	if(mm<10) mm = '0' + mm;
	
	var ss = obj.getSeconds();
	if(ss<10) ss = '0' + ss;

	str = hh + ":" + mm + ":" + ss;
	return(str);
}
function tick(){
	var today;
	today = new Date();
	document.getElementById("clock").innerHTML = showLocale(today);
	window.setTimeout("tick()", 1000);
}
</script>
<table class="tnotice_box">
    <tr ><td class="tnotice_bleft"><div class="tnotice_bldiv">&nbsp;</div></td>
    <td class="tnotice_bcenter ">
        <table class="tnotice_bbox">
            <tr ><td class="tnotice_bbleft"><div class="minfo_bbldiv">&nbsp;</div></td>
                <td class="tnotice_bbcenter ">
                	<div class="current_time"><table cellspacing="0" style="color:white"><tr><td>当前时间：</td><td><script type="text/javascript">
//下面各行分别是一种风格，把不需要的删掉即可
document.write("<div class='time1'>"+ getFullYear(today)+"年"+ 

isnMonths[today.getMonth()] +"月"+ today.getDate() +"日,"+ isnDays

[today.getDay()] +","+"</div>");
</script></td><td><div id="clock"></div><script type="text/javascript">tick()</script></td></tr></table></div>
                    <h1>会计基础考试Demo_整卷模式</h1>
                    <div class="topdiv"><span>答卷时间：30分钟</span><span>及格分数：50分</span><span>试卷总分：80分</span>                    <div class="topdiv">考试时间：2014/01/01 00:00 - 2034/12/31 00:00 </div>
                   
                    <div class="line"></div>
                    <h2>请阅读考试须知</h2>
                    <div class="condiv"><P>随机出题：单选10、多选10、判断10</P></div>
                   
                </td>
            <td class="tnotice_bbright"><div class="tnotice_bbrdiv">&nbsp;</div></td></tr>
        </table>
        <div class="tnotice_btnbox">
            <a href="exambuild.jsp" class="tnotice_btn">
                <span class="left"></span>
                <span class="center">开始考试</span>
                <span class="right"></span>
            </a>
        </div>
    </td>
    <td class="tnotice_bright"><div class="tnotice_brdiv">&nbsp;</div></td></tr>
</table>
<script language="javascript" charset="UTF-8" src="js/admin/common.js" ></script>
</body>
</html>
