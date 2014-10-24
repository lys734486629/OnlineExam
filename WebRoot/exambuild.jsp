<%@ page language="java" import="java.util.*,javabean.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>模式一</title>
<link type="text/css" rel="stylesheet" href="style/paper/main.css" /><link type="text/css" rel="stylesheet" href="style/paper/layout.css" /><link type="text/css" rel="stylesheet" href="style/login_style.css" /><script language="javascript" charset="UTF-8" src="js/jquery.js" ></script><script language="javascript" charset="UTF-8" src="include/Of/LanguagePacks/L.js"></script>
<script type="text/javascript">
function check()
{
 var len=document.quesform.elements.length;
 for(var i=0 ;i<len; i++)
 {
  if(document.quesform.elements[i].type=="radio")
  { 
    if(document.quesform.elements[i].name.search(/select/)!=-1)
    {
     if(document.quesform.elements[i].value==null&&document.quesform.elements[i+1].value==null&&document.quesform.elements[i+2].value==null&&document.quesform.elements[i+3].value==null)
     {
      alert("你有单选题需要完善");
      document.quesform.elements[i].focus();}
     else
     i=i+3;
    }
    else
    { 
     if(document.quesform.elements[i].value==null&&document.quesform.elements[i+1].value==null)
     alert("你有判断题需要完善");
     else
     i=i+1;
    }
    //document.quesform.elements[i].focus();
    return false;
  }
  else if(document.quesform.elements[i].type=="text")
  {
   if(document.quesform.elements[i].value=="")
   {
    alert("你有填空题需要完善");
    document.quesform.elements[i].focus();
    return false;
   }
  }
  else if(document.quesform.elements[i].type=="textarea")
  {
   if(document.quesform.elements[i].value=="")
   {
   if(document.quesform.elements[i].name.search(/simple/)!=-1)
   alert("你有简答题需要完善");
   else
   alert("你有分析题需要完善");
   }
   document.quesform.elements[i].focus();
   return false;
  }
 }
}
function checkform(select,fill,judge,simple,analy)
{
 //alert("选择"+select+"填空"+fill+"判断"+judge+"简答"+simple+"分析"+analy);
 var form = document.quesform;
 var flag=0,num1=0,num2=0,num3=0,num4=0,num5=0,string1="";
 for(var o=1;o<=select;o++)
 {
  flag=0;
  var o1="select"+o;
  var selectname=document.getElementsByName(o1);
  for(var o2=0;o2<selectname.length;o2++)
  {
   if(selectname[o2].checked==true)
   {flag=1;
   break;}
  }
  if(flag==0)
  var string1=string1+","+o;
  //alert("你有单选题需要完善"+string1);
  //form.select1.focus();
 }
 if(string1.equals("")!=true)
 alert("你有单选题需要完善"+string1);
}
</script>
</head>

<body>
<script language="javascript" charset="UTF-8" src="js/exam/exam_papr.js" ></script>
<style>
#tmp_message{ width:870px;	margin:0 auto;	height:100%;}
.tmp_info{margin:120px auto;border:1px solid #BABABA;width:320px;padding:40px;height:80px;}
.tmp_info p{text-align:center;}
</style>
<script>
//考试时间是否与答卷时间一致
window.onbeforeunload = function()
{
    return "";
}
EXAM_START_TIME = 0;
EXAM_LAST_TIME = 1800;
//已经考试时间
EXAM_EXAMED_TIME = 10;
EXAM_DISABLE_SUBMIT = 0;

EXAM_TIME_CONSISTENCY_FLG = 1;
//考试剩余时间
$(document).ready(function(){
	window.L.openCom('oDialogDiv');
	var d=new Date();
	EXAM_START_TIME = Math.round(d.getTime()/1000)-EXAM_EXAMED_TIME;
	
		//EXAM_LAST_TIME = EXAM_LAST_TIME-EXAM_EXAMED_TIME;
	//开始倒计时
	examStartCountingDown();
			//开始考试须知倒计时
	examNoticeCountingDown();
			//初始化滚动条
	examInitToolBar();
		if(typeof(EXAM_IS_LOCAL_SAVE) == 'undefined'){
		}
	
	
		
					
			 	});
</script>
<style>
</style>
<object id="ie" width=1 height=1 classid="clsid:68acce8b-f896-4091-bdc5-a93115a051dc">
    <param name="_version" value="65536">
    <param name="_extentx" value="164">
    <param name="_extenty" value="164">
    <param name="_stockprops" value="0">
</object>
<input type="hidden" id="exam_mode" value="030101" />
<input type="hidden" id="exam_times" value="2" />
<input type="hidden" id="user_id" value="1" />
<input type="hidden" id="papr_id" value="BC" />
<input type="hidden" id="exam_id" value="QC" /><input type="hidden" id="exam_type" value="0" />
<input type="hidden" id="exam_blank_flg" value="0" />
<input type="hidden" id="exam_cloze_flg" value="0" />
<input type="hidden" id="exam_submit_display_result" value="0" />
<div id="container" class="box block_12">
<div class="box_inner">
<div class="paper_header">
<div class="col_left avatar avatar_male_default"></div>
<div class="col_right">
<h1>历史综合考试随机卷——模式一</h1>
				<div class="left">
					<ul>
						<li>考试时间：<span class="col_9">2014-01-01 00:00:00 ~ 2034-12-31 00:00:00</span></li>
						<li>当前用户：<span class="col_9"><%=session.getAttribute("name")%></span></li>
					</ul>
				</div>
								<div class="right">
					<ul>
						<li>答卷时间：120分</li>
						<li>试题总数：30</li>
						<li>试题总分：100分</li>
					</ul>
				</div>

</div>
</div>
<%int a1=0,b1=0,c1=0,d1=0,e1=0; %>
<div class="clear"></div>
				<!-- 考场须知start -->
		<div class="paper_notice" id="exam_notice_div">
			<h1 class="title_level_1"><a href="javascript:void(0)" onclick="examToggleExamNotice();return false;">考试须知</a></h1>
			<div class="contnet" id="exam_content_notice_div">
				<div class="inner">
					<P>随机出题：单选题 、填空题、判断题、简答题、分析题</P>					<div class="clear"></div>
					<!-- // Button -->
					<div class="button_area button_center ~button_left ~button_right">
						<div class="inner_box">
							<a href="javascript:void(0)" class="btn btn_disable" onclick="examToggleExamNotice();return false;" ><span class="timeout_txt" id="exam_notice_cd_span"></span><script type="text/javascript">examNoticeCountingDown()</script>确认已读</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 考场须知end -->
        <!-- 工具条start -->
		<div class="paper_filter" style="height:40px;width:1000px; z-index: 10;" id="exam_toolbar">
			<div class="inner">
			<div class="paper_filter_timeout timeout_01 ~timeout_02 ~timeout_03">剩余时间：<label id="exam_last_time_label"></label></div>
								<div class="questions_index">
					<a href="javascript:void(0)" onclick="examDisplayDiv('exam_index_div');return false;" class="btn btn_autowidth">试题索引<span class="small_icon icon_view_list"></span></a>
					<div class="popup content" name="exam_ims_div" id="exam_index_div">
						<div class="inner">
							<h1>共30题，已答数目：<label id="exam_answered_qsn_count_label">0</label>，未答数目：<label id="exam_unanswered_qsn_count_label">0</label></h1>
							<div class="" id="exam_answered_qsn_div">
								<span>已答：</span>
							</div>
							<div class="" id="exam_unanswered_qsn_div">
								<span>未答：</span>
							</div>
						</div>
					</div>
				</div>
												<div class="questions_label">
					<a href="javascript:void(0)" onclick="examDisplayDiv('exam_mark_div');return false;" class="btn btn_autowidth">标记的试题<span class="small_icon icon_view_list"></span></a>
					<div class="popup content" name="exam_ims_div" id="exam_mark_div">
						<div class="inner">
							<h1>共30题，已标记试题数：<label id="exam_mark_qsn_count_label">0</label></h1>
							<div class="" id="exam_mark_qsn_div">
								<span>标记试题：</span>
							</div>
						</div>
					</div>
				</div>
																<a href="javascript:document.quesform.submit();" id="exam_submit_btn" class="btn2 ~btn_autowidth float_right">交卷</a>
							</div>
		</div>
		<!-- 工具条end -->		
<form name="quesform" action="./servlet/AcceptAnswerServlet" method="post" OnSubmit="check();">
<div class="paper_content">
<%ArrayList<SubjectVO> queslist=(ArrayList<SubjectVO>)session.getAttribute("queslist");
    //String iden=(String)session.getAttribute("identity");     
    SubjectVO fs=new SubjectVO();
    int i=0,j=0,m=0,n=0,k=0,l=0;
                            for(i=0;i<queslist.size();i++)
                              {         
                                fs=queslist.get(i);
                                //j=i+1;                 //题号
                                String sub;
                                String[] subject;
                                String ques;
                                String a,b,c,d;
                                
							    //out.print("<tr>");
							    //out.print("<td weight="+"50px"+">"+j+"</td>");
							    
							    //字符串预处理，先判断题目类型，然后提取题干，选项
							    if(fs.getSubType().equals("1"))
							   {
							    j=i+1;
							    //a1=j;
							    //out.print("<td weight="+"50px"+">"+"选择题"+"</td>");
							    sub=fs.getQuestion();
							    sub.replaceAll(" ","");
							    subject=sub.split("\\|");    //根据分隔符分割字符串
							    
					            ques=subject[0].replaceAll(" ", "");   //去掉多余空格
					            a=subject[1].replaceAll(" ", "");
					            b=subject[2].replaceAll(" ", "");
					            c=subject[3].replaceAll(" ", "");
					            d=subject[4].replaceAll(" ", "");
					if(j==1)
					{
					 out.println("<div class=\"paper_list\" name=\"papr_qsn_type_list_div\" id=\"papr_qsn_type_list_div_1\">");
					 out.println("<h1 class=\"title_level_1\"><b>一、单选题(每题2分，共20分)</b></h1>");
					 out.println("<div class=\"paper_info\"></div>");
					}%>
   					 
					<%
					 out.println("<div id=\"qsn_content_div_NB0\" qsn_id=\"NB\" qsn_sub_id=\"0\" name=\"qsn_content_div\" style=\"\">");
					 out.println("<div class=\"qt_main\">\n<div class=\"inner\">\n<div class=\"col_left\">");
					 out.println("<h1 class=\"num\">"+j+"</h1>");
					 out.println("<h2 class=\"label_btn\">\n<a class=\"icon_label_off\" id=\"exam_mark_icon_NB0\" title=\"进行标记\" href=\"javascript:void(0)\" onclick=\"examMarkQsn('NB0');return false;\" ></a></h2>");
					 out.println("<h3 class=\"score\">2分<input type=\"hidden\" id=\"exam_qsn_point_NB0\" name=\"exam_qsn_point\" value=\"2\"  /></h3></div>");
					 out.println("<div class=\"col_right_01\" style=\"width:85%\"><div class=\"content\"><div class=\"qt_title\">"+ques+"</div>");
					 out.println("<div class=\"qt_content\"><label><div style=\"float: left;margin-top:5px;\">");
					 out.println("<input class=\"radiobox\" name=\"select"+j+"\" id=\"option_NB010\" qsn_item_id=\"1\" qsn_item_sub_id=\"0\" type=\"radio\" value=\"1\" /></div>");
					 out.println("<div><div class=\"\" style=\"float: none;margin-left: 20px;\" >"+a+"</div></div></label>");
					 out.println("<label><div style=\"float: left;margin-top:5px;\">");
					 out.println("<input class=\"radiobox\" name=\"select"+j+"\" id=\"option_NB020\" qsn_item_id=\"2\" qsn_item_sub_id=\"0\" type=\"radio\" value=\"2\" /></div>");
					 out.println("<div><div class=\"\" style=\"float: none;margin-left: 20px;\" >"+b+"</div></div></label>");
					 out.println("<label><div style=\"float: left;margin-top:5px;\">");
					 out.println("<input class=\"radiobox\" name=\"select"+j+"\" id=\"option_NB020\" qsn_item_id=\"3\" qsn_item_sub_id=\"0\" type=\"radio\" value=\"3\" /></div>");
					 out.println("<div><div class=\"\" style=\"float: none;margin-left: 20px;\" >"+c+"</div></div></label>");
					 out.println("<label><div style=\"float: left;margin-top:5px;\">");
					 out.println("<input class=\"radiobox\" name=\"select"+j+"\" id=\"option_NB020\" qsn_item_id=\"4\" qsn_item_sub_id=\"0\" type=\"radio\" value=\"4\" /></div>");
					 out.println("<div><div class=\"\" style=\"float: none;margin-left: 20px;\" >"+d+"</div></div></label>");
					 out.println("</div></div></div></div></div></div>");
					 out.println("");
					 //System.out.print("j="+j+",i="+i);
					 
					}
					if(fs.getSubType().equals("2")) //模式一填空题
					{
					 //System.out.print("j="+j+",i="+i+"**");
					 m=i+1-j;  //题号
					 sub=fs.getQuestion();
					 ques=sub.replaceAll(" ", "");
					 if(m==1)
					 {
					  out.println("<div class=\"paper_list\" name=\"papr_qsn_type_list_div\" id=\"papr_qsn_type_list_div_1\">");
					  out.println("<h1 class=\"title_level_1\"><b>二、填空题(每题2分，共20分)</b></h1>");
					  out.println("<div class=\"paper_info\"></div>");
					 }
					 out.println("<div id=\"qsn_content_div_NB0\" qsn_id=\"NB\" qsn_sub_id=\"0\" name=\"qsn_content_div\" style=\"\">");
					 out.println("<div class=\"qt_main\">\n<div class=\"inner\">\n<div class=\"col_left\">");
					 out.println("<h1 class=\"num\">"+m+"</h1>");
					 out.println("<h2 class=\"label_btn\">\n<a class=\"icon_label_off\" id=\"exam_mark_icon_NB0\" title=\"进行标记\" href=\"javascript:void(0)\" onclick=\"examMarkQsn('NB0');return false;\" ></a></h2>");
					 out.println("<h3 class=\"score\">2分<input type=\"hidden\" id=\"exam_qsn_point_NB0\" name=\"exam_qsn_point\" value=\"2\"  /></h3></div>");
					 out.println("<div class=\"col_right_01\" style=\"width:85%\"><div class=\"content\"><div class=\"qt_title\">"+ques+"</div>");  //题目
                     out.println("<div class=\"qt_content\"><label><div style=\"float: left;margin-top:-3px;\">");
					 out.println("填空：</div>");
					 out.println("<div><div class=\"\" style=\"float: none;margin-left: 20px;\" ><input type=\"text\" name=\"fill"+m+"\"/></div></div></label>");
                     out.println("</div>");
                     out.println("</div></div></div></div></div>");
					}
					if(fs.getSubType().equals("3")) //模式一判断题
					{
					 n=i+1-(j+m);
					 sub=fs.getQuestion();
					 ques=sub.replaceAll(" ", "");
					 if(n==1)
					 {
					  out.println("<div class=\"paper_list\" name=\"papr_qsn_type_list_div\" id=\"papr_qsn_type_list_div_1\">");
					  out.println("<h1 class=\"title_level_1\"><b>三、判断题(每题2分，共20分)</b></h1>");
					  out.println("<div class=\"paper_info\"></div>");
					 }
					 out.println("<div id=\"qsn_content_div_NB0\" qsn_id=\"NB\" qsn_sub_id=\"0\" name=\"qsn_content_div\" style=\"\">");
					 out.println("<div class=\"qt_main\">\n<div class=\"inner\">\n<div class=\"col_left\">");
					 out.println("<h1 class=\"num\">"+n+"</h1>");
					 out.println("<h2 class=\"label_btn\">\n<a class=\"icon_label_off\" id=\"exam_mark_icon_NB0\" title=\"进行标记\" href=\"javascript:void(0)\" onclick=\"examMarkQsn('NB0');return false;\" ></a></h2>");
					 out.println("<h3 class=\"score\">2分<input type=\"hidden\" id=\"exam_qsn_point_NB0\" name=\"exam_qsn_point\" value=\"2\"  /></h3></div>");
					 out.println("<div class=\"col_right_01\" style=\"width:85%\"><div class=\"content\"><div class=\"qt_title\">"+ques+"</div>");  //题目
                     out.println("<div class=\"qt_content\"><label><div style=\"float: left;margin-top:5px;\">");
					 out.println("<input class=\"radiobox\" name=\"judge"+n+"\" id=\"option_NB010\" qsn_item_id=\"1\" qsn_item_sub_id=\"0\" type=\"radio\" value=\"1\" /></div>");
					 out.println("<div><div class=\"\" style=\"float: none;margin-left: 20px;\" >"+"√"+"</div></div></label>");
                     out.println("<label><div style=\"float: left;margin-top:5px;\">");
                     out.println("<input class=\"radiobox\" name=\"judge"+n+"\" id=\"option_NB010\" qsn_item_id=\"1\" qsn_item_sub_id=\"0\" type=\"radio\" value=\"0\" /></div>");
					 out.println("<div><div class=\"\" style=\"float: none;margin-left: 20px;\" >"+"×"+"</div></div></label>");
                     out.println("</div>");
                     out.println("</div></div></div></div></div>");
					}
					if(fs.getSubType().equals("4")) //模式一简答题
					{
					 k=i+1-(j+m+n);
					 sub=fs.getQuestion();
					 ques=sub.replaceAll(" ", "");
					 if(k==1)
					 {
					  out.println("<div class=\"paper_list\" name=\"papr_qsn_type_list_div\" id=\"papr_qsn_type_list_div_1\">");
					  out.println("<h1 class=\"title_level_1\"><b>四、简答题(每题2分，共20分)</b></h1>");
					  out.println("<div class=\"paper_info\"></div>");
					 }
					 out.println("<div id=\"qsn_content_div_NB0\" qsn_id=\"NB\" qsn_sub_id=\"0\" name=\"qsn_content_div\" style=\"\">");
					 out.println("<div class=\"qt_main\">\n<div class=\"inner\">\n<div class=\"col_left\">");
					 out.println("<h1 class=\"num\">"+k+"</h1>");
					 out.println("<h2 class=\"label_btn\">\n<a class=\"icon_label_off\" id=\"exam_mark_icon_NB0\" title=\"进行标记\" href=\"javascript:void(0)\" onclick=\"examMarkQsn('NB0');return false;\" ></a></h2>");
					 out.println("<h3 class=\"score\">2分<input type=\"hidden\" id=\"exam_qsn_point_NB0\" name=\"exam_qsn_point\" value=\"2\"  /></h3></div>");
					 out.println("<div class=\"col_right_01\" style=\"width:85%\"><div class=\"content\"><div class=\"qt_title\">"+ques+"</div>");  //题目
					 out.println("<div class=\"qt_content\"><label><div style=\"float: left;margin-top:-3px;\">");
					 out.println("答：</div>");
					 out.println("<div><div class=\"\" style=\"float: none;margin-left: 20px;\" ><textarea name=\"simple"+k+"\" rows=\"20\" cols=\"80\"></textarea></div></div></label>");
                     out.println("</div>");
                     out.println("</div></div></div></div></div>");
					}
					if(fs.getSubType().equals("5")) //模式一分析题
					{
					 l=i+1-(j+m+n+k);
					 sub=fs.getQuestion();
					 ques=sub.replaceAll(" ", "");
					 if(l==1)
					 {
					  out.println("<div class=\"paper_list\" name=\"papr_qsn_type_list_div\" id=\"papr_qsn_type_list_div_1\">");
					  out.println("<h1 class=\"title_level_1\"><b>五、分析题(每题2分，共20分)</b></h1>");
					  out.println("<div class=\"paper_info\"></div>");
					 }
					 out.println("<div id=\"qsn_content_div_NB0\" qsn_id=\"NB\" qsn_sub_id=\"0\" name=\"qsn_content_div\" style=\"\">");
					 out.println("<div class=\"qt_main\">\n<div class=\"inner\">\n<div class=\"col_left\">");
					 out.println("<h1 class=\"num\">"+l+"</h1>");
					 out.println("<h2 class=\"label_btn\">\n<a class=\"icon_label_off\" id=\"exam_mark_icon_NB0\" title=\"进行标记\" href=\"javascript:void(0)\" onclick=\"examMarkQsn('NB0');return false;\" ></a></h2>");
					 out.println("<h3 class=\"score\">2分<input type=\"hidden\" id=\"exam_qsn_point_NB0\" name=\"exam_qsn_point\" value=\"2\"  /></h3></div>");
					 out.println("<div class=\"col_right_01\" style=\"width:85%\"><div class=\"content\"><div class=\"qt_title\">"+ques+"</div>");  //题目
					 out.println("<div class=\"qt_content\"><label><div style=\"float: left;margin-top:-3px;\">");
					 out.println("答：</div>");
					 out.println("<div><div class=\"\" style=\"float: none;margin-left: 20px;\" ><textarea name=\"discuss"+l+"\" rows=\"20\" cols=\"80\"></textarea></div></div></label>");
                     out.println("</div>");
                     out.println("</div></div></div></div></div>");
					}
				   }
					%>
					</div></form>
					<div class="conbox" style="margin-left:350px;margin-top:-10px;">
                    <!--<a href="javascript:document.quesform.submit();" id="login" class="l_enter corner">确&nbsp;认&nbsp;交&nbsp;卷</a>-->
                    <a href="javascript:document.quesform.submit();" onClick="checkform(<%=j%>,<%=m%>,<%=n%>,<%=k%>,<%=l%>);" class="l_enter corner">确&nbsp;认&nbsp;交&nbsp;卷</a>
                    </div>
                    <br>
                    <br>
                    <br>
					<br>
                    <br>
                    <br>
                    </div>
</div>
<script>
$(document).ready(function(){
	$('#exam_perload_div').hide();
});
</script>
<script language="javascript"> 
/*
* 描述:限制oEditor的ofPlayer播放次数
* 使用:放在所有DOM节点之下,或放在$(document).ready(function(){这里})
*/
(function()
{
    var thisFun=arguments.callee;
    if(thisFun.ofPlayer==null)
    {
        var objectList=document.getElementsByTagName('object');
        thisFun.ofPlayer=[];
        //初始化,识别出所有需要播放限制和进度条禁用的ofPlayer对象
        for(var i=0,l=objectList.length;i<l;i++)
        {
            if(objectList[i].id.substr(0,9)=='player_id'&&objectList[i].getAttribute('playcount')!==null)
            {
                objectList[i].playcount=parseInt(objectList[i].getAttribute('playcount'));
                thisFun.ofPlayer[thisFun.ofPlayer.length]=objectList[i];
            }
        }
    }
    if(thisFun.ofPlayer.length)
    {
        if(typeof(JS_OFplayer)=='function')
        {
            for(var i=0,l=thisFun.ofPlayer.length;i<l;i++)
            {
                //播放次数限制
                if(!isNaN(thisFun.ofPlayer[i].playcount))
                {
                    try
                    {
                        var playTimeProgress = JS_OFplayer(thisFun.ofPlayer[i].id, 'getinfo', 'playback','PlayTimeProgress');
                        var state=JS_OFplayer(thisFun.ofPlayer[i].id, 'getinfo', 'playback','State');
                        if(playTimeProgress<2)
                        {
                            if(thisFun.ofPlayer[i].playcount==0&&(state=='Ready'||state=='Playing'||state=='Stop'))
                            {
                                //锁定相关按钮
                                JS_OFplayer(thisFun.ofPlayer[i].id, 'stop');
                                if(typeof(JS_OFplayer(thisFun.ofPlayer[i].id, 'getatt','play','y'))=='number')
                                {
                                    JS_OFplayer(thisFun.ofPlayer[i].id, 'adjust', 'play','hidden','false');
                                    JS_OFplayer(thisFun.ofPlayer[i].id, 'adjust', 'play','disable','true');
                                }
                                if(typeof(JS_OFplayer(thisFun.ofPlayer[i].id, 'getatt','fullscreen','y'))=='number')
                                {
                                    JS_OFplayer(thisFun.ofPlayer[i].id, 'adjust', 'fullscreen','hidden','false');
                                    JS_OFplayer(thisFun.ofPlayer[i].id, 'adjust', 'fullscreen','disable','true');
                                }
                                if(typeof(JS_OFplayer(thisFun.ofPlayer[i].id, 'getatt','progress','y'))=='number')
                                {
                                    JS_OFplayer(thisFun.ofPlayer[i].id, 'adjust', 'progress','prop','');
                                }
                                if(typeof(JS_OFplayer(thisFun.ofPlayer[i].id, 'getatt','volslide','y'))=='number')
                                {
                                    JS_OFplayer(thisFun.ofPlayer[i].id, 'adjust', 'volslide','prop','');
                                }
                                if(typeof(JS_OFplayer(thisFun.ofPlayer[i].id, 'getatt','unmute','y'))=='number')
                                {
                                    JS_OFplayer(thisFun.ofPlayer[i].id, 'adjust', 'unmute','hidden','true');
                                    JS_OFplayer(thisFun.ofPlayer[i].id, 'adjust', 'unmute','disable','true');
                                    JS_OFplayer(thisFun.ofPlayer[i].id, 'adjust', 'mute','hidden','false');
                                    JS_OFplayer(thisFun.ofPlayer[i].id, 'adjust', 'mute','disable','true');
                                }
                                if(typeof(JS_OFplayer(thisFun.ofPlayer[i].id, 'getatt','video','y'))=='number')
                                {
                                    JS_OFplayer(thisFun.ofPlayer[i].id, 'setsize', 'video',0,0);
                                }
                                if(typeof(JS_OFplayer(thisFun.ofPlayer[i].id, 'getatt','bigPlay','y'))=='number')
                                {
                                    JS_OFplayer(thisFun.ofPlayer[i].id, 'adjust', 'bigPlay','disable','true');
                                }
                                //并移除该对像
                                if(!JS_OFplayer(thisFun.ofPlayer[i].id,'getinfo','playerinfo','isFullScreen'))
                                {
                                    thisFun.ofPlayer.splice(i,1);
                                }
                            }
                            else
                            {
                                thisFun.ofPlayer[i].PlayCountTime=true;
                            }
                        }
                        else if(playTimeProgress>98&&thisFun.ofPlayer[i].PlayCountTime)
                        {
                            thisFun.ofPlayer[i].PlayCountTime=false;
                            thisFun.ofPlayer[i].playcount--;
                        }
                    }
                    catch(e){};
                }
            }
        }
        if(thisFun.ofPlayer.length)
        {
            setTimeout(thisFun,300);
        }
    }
})()
</script>
<script language="javascript" charset="UTF-8" src="js/admin/common.js" ></script>
<script language="javascript" charset="UTF-8" src="js/exam/exam_papr.js" ></script>
</body>
</html>
