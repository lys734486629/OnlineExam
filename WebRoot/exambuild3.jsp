<%@ page language="java" import="java.util.*,javabean.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>模式三</title>
<link type="text/css" rel="stylesheet" href="style/paper/main.css" /><link type="text/css" rel="stylesheet" href="style/paper/layout.css" /><link type="text/css" rel="stylesheet" href="style/login_style.css" /><script language="javascript" charset="UTF-8" src="js/jquery.js" ></script><script language="javascript" charset="UTF-8" src="include/Of/LanguagePacks/L.js"></script>
</head>
<body>
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
<h1>历史综合考试随机卷——模式三</h1>
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
																<a href="javascript:document.quesform.submit();" id="exam_submit_btn" class="btn2 ~btn_autowidth float_right">交卷</a>
							</div>
		</div>
		<!-- 工具条end -->		
		
		<iframe src="model3main.jsp" width="100%" height="1000px" frameborder="0" scrolling="no" name="model3main"></iframe>
</div>
</div>
</body>
</html>