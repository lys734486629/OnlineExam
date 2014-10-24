<%@ page language="java" import="java.util.*,javabean.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>模式二</title>
<link type="text/css" rel="stylesheet" href="style/paper/main.css" /><link type="text/css" rel="stylesheet" href="style/paper/layout.css" /><link type="text/css" rel="stylesheet" href="style/login_style.css" /><script language="javascript" charset="UTF-8" src="js/jquery.js" ></script><script language="javascript" charset="UTF-8" src="include/Of/LanguagePacks/L.js"></script>

</head>

<body>
<script language="javascript" charset="UTF-8" src="js/exam/exam_papr.js" ></script>
<style>
#tmp_message{ width:870px;	margin:0 auto;	height:100%;}
.tmp_info{margin:120px auto;border:1px solid #BABABA;width:320px;padding:40px;height:80px;}
.tmp_info p{text-align:center;}
</style>



<div id="container" class="box block_12">
<div class="box_inner">
<div class="paper_header">
<div class="col_left avatar avatar_male_default"></div>
<div class="col_right">
<h1>历史综合考试随机卷——模式二</h1>
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
<div class="clear"></div>
<!-- 考场须知start -->
		<div class="paper_notice" id="exam_notice_div">
			<h1 class="title_level_1"><a href="javascript:void(0)" onclick="examToggleExamNotice();return false;">考试须知</a></h1>
			<div class="contnet" id="exam_content_notice_div">
				<div class="inner">
					<P>随机出题：单选题 、填空题、判断题</P>					<div class="clear"></div>
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
																<a href="javascript:document.quesform2.submit();" id="exam_submit_btn" class="btn2 ~btn_autowidth float_right">交卷</a>
							</div>
		</div>
		<!-- 工具条end -->	
<form name="quesform2" action="./servlet/AcceptAnswerServlet" method="post" OnSubmit="check();">
<div class="paper_content">
<%
   ArrayList<SubjectVO> queslist=(ArrayList<SubjectVO>)session.getAttribute("queslist");
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
							    }
							    
							    if(fs.getSubType().equals("2")) //模式2填空题
							    {
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
							    
							    if(fs.getSubType().equals("3")) //模式2判断题
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
                            }%>
 
</div>
</form>
					<div class="conbox" style="margin-left:350px;margin-top:-10px;">
					<a href="javascript:document.quesform2.submit();" onClick="checkform(<%=j%>,<%=m%>,<%=n%>,<%=k%>,<%=l%>);" class="l_enter corner">确&nbsp;认&nbsp;交&nbsp;卷</a>
					</div>
					<br>
                    <br>
                    <br>
					<br>
                    <br>
                    <br>

</div>
</div>
</body>
</html>