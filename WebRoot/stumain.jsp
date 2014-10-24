<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>在线考试系统首页</title>
<link type="text/css" rel="stylesheet" href="style/mainindex.css" /><link type="text/css" rel="stylesheet" href="style/components/pageTable/pageTable.css" /><script language="javascript" charset="UTF-8" src="js/jquery.js" ></script><script language="javascript" charset="UTF-8" src="include/Of/LanguagePacks/L.js"></script>
</head>

<body>
<div id="head">
<div id="content">
                <div class="inner">
                    <div class="main_div home_logged">
                        <h1 class="main_title">
                            <div class="left"> <span class="icon"></span>考试列表</div>
                            
                        </h1>
                        <!-- // 列表项目 -->
                        <table  class="pageTable"  _pageTableDataset='exam_examCtl::getAllowExamPageTable' _pageTableTotalItems='4' _pageTablePageSize='5' _pageTableCurPage='1' _pageTableTotalPages='1' _pageTableColspan='1' _pageTableStarterPrint=''   ><thead></thead><tbody><tr><td class="list_item" style="padding:0px; padding-bottom:8px; background-color:#FCFCFC; border:0px;border-bottom:1px solid #ECECEC;color:inherit; font-weight:inherit; height:inherit; text-align:inherit;"><div class="">
                        <input type="hidden" value='' id="include_group_json_QC" name="include_group_json" />
                        <input type="hidden" value="QC" id="exam_list_id_QC" name="exam_list_id" />
						<input type="hidden" value="" id="include_user_ids_QC" name="include_user_ids" />
						<input type="hidden" value="" id="exclude_user_ids_QC" name="exclude_user_ids" />
						<input type="hidden" value="0" id="exam_user_verify_flg_QC" name="exam_user_verify_flg" />
						<input type="hidden" value="1" id="exam_all_person_QC" name="exam_all_person" />
						<input type="hidden" value="0" id="exam_group_person_QC" name="exam_group_person" />
                        <input type="hidden" value="0" id="exam_user_signup_flg_QC" name="exam_user_signup_flg" />
                         <input type="hidden" value="" id="exam_user_verify_QC" name="exam_user_verify" />
                        	<form name="model1" action="./servlet/Exambuild?exammode=1" method="post" target="_blank">
                        	<div class="content">
								<!-- // 左边icon -->
								<div class="l"><a title=""  href="/exam/examCtl.php?a=displayExam&exam_id=QC" target="_blank" class="icon_list list_thumb_big" style="padding-bottom: 2px;"><img src="/include/oFileManager/fileExtension.php?fileUrl=" style="display:none;" onload="this.style.display=''"></a></div>
								<div class="right_info l"> 
								<!-- // 第一行：主标题 -->
								<h2 class="title">历史综合考试··模式一··整卷模式</h2>
								<!-- // 第三行 -->
								<div class="col_LR intro">
									<div class="inner">
										<div class="sidebar">
											<div class="btn_area" id="exam_join_div_QC">
												<a class="btn" href="javascript:document.model1.submit();" target="_blank">立即参加</a>
											</div>
										</div>
										<div class="con">
											<dl class="dd">
												<dt class="s_bt_text">类别：</dt>
												<dd class="s_info_text">正式考试&nbsp;&nbsp;&nbsp;&nbsp;</dd>
												
											</dl>
											<dl class="dd">
												<dt class="s_bt_text">考试时间：</dt>
												<dd class="s_info_text">2014/01/01 00:00 ~ 2034/12/31 00:00</dd>
											</dl>
											<dl class="dd">
												<dt class="s_bt_text">答卷时间：</dt>
												<dd class="s_info_text">120分钟</dd>
											</dl>
											<dl class="dd">
												<dt class="s_bt_text">请输入套题编号：</dt>
												<dd class="s_info_text" style="margin-top:2px;"><input type="text" name="paperid_1"/></dd>
											</dl>
										</div>
									</div>
								</div>
								</div>
							</div></form>
							<!-- // contnet end -->
						</div></td></tr><tr><td class="list_item" style="padding:0px; padding-bottom:8px; background-color:#FCFCFC; border:0px;border-bottom:1px solid #ECECEC;color:inherit; font-weight:inherit; height:inherit; text-align:inherit;"><div class="">
                        <input type="hidden" value='' id="include_group_json_CC" name="include_group_json" />
                        <input type="hidden" value="CC" id="exam_list_id_CC" name="exam_list_id" />
						<input type="hidden" value="" id="include_user_ids_CC" name="include_user_ids" />
						<input type="hidden" value="" id="exclude_user_ids_CC" name="exclude_user_ids" />
						<input type="hidden" value="0" id="exam_user_verify_flg_CC" name="exam_user_verify_flg" />
						<input type="hidden" value="1" id="exam_all_person_CC" name="exam_all_person" />
						<input type="hidden" value="0" id="exam_group_person_CC" name="exam_group_person" />
                        <input type="hidden" value="0" id="exam_user_signup_flg_CC" name="exam_user_signup_flg" />
                         <input type="hidden" value="" id="exam_user_verify_CC" name="exam_user_verify" />
                         
                         <form name="model2" action="./servlet/Exambuild?exammode=2" method="post" target="_blank">
                        	<div class="content">
								<!-- // 左边icon -->
								<div class="l"><a title=""  href="/exam/examCtl.php?a=displayExam&exam_id=CC" target="_blank" class="icon_list list_thumb_big" style="padding-bottom: 2px;"><img src="/include/oFileManager/fileExtension.php?fileUrl=" style="display:none;" onload="this.style.display=''"></a></div>
								<div class="right_info l"> 
								<!-- // 第一行：主标题 -->
								<h2 class="title">历史综合考试··模式二··整卷模式</h2>
								<!-- // 第三行 -->
								<div class="col_LR intro">
									<div class="inner">
										<div class="sidebar">
											<div class="btn_area" id="exam_join_div_CC">
												<a class="btn" href="javascript:document.model2.submit();"  target="_blank">立即参加</a>
											</div>
										</div>
										<div class="con">
											<dl class="dd">
												<dt class="s_bt_text">类别：</dt>
												<dd class="s_info_text">正式考试&nbsp;&nbsp;&nbsp;&nbsp;</dd>
												
											</dl>
											<dl class="dd">
												<dt class="s_bt_text">考试时间：</dt>
												<dd class="s_info_text">2014/01/01 00:00 ~ 2034/12/31 00:00</dd>
											</dl>
											<dl class="dd">
												<dt class="s_bt_text">答卷时间：</dt>
												<dd class="s_info_text">120分钟</dd>
											</dl>
											<dl class="dd">
												<dt class="s_bt_text">请输入套题编号：</dt>
												<dd class="s_info_text" style="margin-top:2px;"><input type="text" name="paperid_2"/></dd>
											</dl>
										</div>
									</div>
								</div>
								</div>
							</div></form>
							<!-- // contnet end -->
						</div></td></tr><tr><td class="list_item" style="padding:0px; padding-bottom:8px; background-color:#FCFCFC; border:0px;border-bottom:1px solid #ECECEC;color:inherit; font-weight:inherit; height:inherit; text-align:inherit;"><div class="">
                        <input type="hidden" value='' id="include_group_json_5C" name="include_group_json" />
                        <input type="hidden" value="5C" id="exam_list_id_5C" name="exam_list_id" />
						<input type="hidden" value="" id="include_user_ids_5C" name="include_user_ids" />
						<input type="hidden" value="" id="exclude_user_ids_5C" name="exclude_user_ids" />
						<input type="hidden" value="0" id="exam_user_verify_flg_5C" name="exam_user_verify_flg" />
						<input type="hidden" value="1" id="exam_all_person_5C" name="exam_all_person" />
						<input type="hidden" value="0" id="exam_group_person_5C" name="exam_group_person" />
                        <input type="hidden" value="0" id="exam_user_signup_flg_5C" name="exam_user_signup_flg" />
                         <input type="hidden" value="" id="exam_user_verify_5C" name="exam_user_verify" />
                        	<div class="content">
								<!-- // 左边icon -->
								<div class="l"><a title=""  href="/exam/examCtl.php?a=displayExam&exam_id=5C" target="_blank" class="icon_list list_thumb_big" style="padding-bottom: 2px;"><img src="/include/oFileManager/fileExtension.php?fileUrl=" style="display:none;" onload="this.style.display=''"></a></div>
								<div class="right_info l"> 
								<!-- // 第一行：主标题 -->
								<h2 class="title">历史综合考试··模式三··逐题模式</h2>
								<!-- // 第三行 -->
								<div class="col_LR intro">
									<div class="inner">
										<div class="sidebar">
											<div class="btn_area" id="exam_join_div_5C">
												<a class="btn" href="./servlet/Exambuild?exammode=3" target="_blank">立即参加</a>
											</div>
										</div>
										<div class="con">
											<dl class="dd">
												<dt class="s_bt_text">类别：</dt>
												<dd class="s_info_text">正式考试&nbsp;&nbsp;&nbsp;&nbsp;</dd>
												
											</dl>
											<dl class="dd">
												<dt class="s_bt_text">考试时间：</dt>
												<dd class="s_info_text">2014/01/01 00:00 ~ 2034/12/31 00:00</dd>
											</dl>
											<dl class="dd">
												<dt class="s_bt_text">答卷时间：</dt>
												<dd class="s_info_text">120分钟</dd>
											</dl>
										</div>
									</div>
								</div>
								</div>
							</div><!-- // contnet end -->
						</div></td></tr><tr><td class="list_item" style="padding:0px; padding-bottom:8px; background-color:#FCFCFC; border:0px;border-bottom:1px solid #ECECEC;color:inherit; font-weight:inherit; height:inherit; text-align:inherit;"><div class="">
                        <input type="hidden" value='' id="include_group_json_NZ" name="include_group_json" />
                        <input type="hidden" value="NZ" id="exam_list_id_NZ" name="exam_list_id" />
						<input type="hidden" value="" id="include_user_ids_NZ" name="include_user_ids" />
						<input type="hidden" value="" id="exclude_user_ids_NZ" name="exclude_user_ids" />
						<input type="hidden" value="0" id="exam_user_verify_flg_NZ" name="exam_user_verify_flg" />
						<input type="hidden" value="1" id="exam_all_person_NZ" name="exam_all_person" />
						<input type="hidden" value="0" id="exam_group_person_NZ" name="exam_group_person" />
                        <input type="hidden" value="0" id="exam_user_signup_flg_NZ" name="exam_user_signup_flg" />
                         <input type="hidden" value="070202" id="exam_user_verify_NZ" name="exam_user_verify" />
                        	</td></tr></tbody><tfoot><tr><td colspan=1><div id="page_nav" class="page_nav"><a id="page_first" href="javascript:" onClick="return false;" class="page_first">&nbsp;</a><a id="page_prev" href="javascript:" onClick="return false;" class="page_prev">&nbsp;</a><a id="page_next" href="javascript:" onClick="return false;" class="page_next">&nbsp;</a><a id="page_last" href="javascript:" onClick="return false;" class="page_last">&nbsp;</a><span id="page_num" class="page_num"></span><input id="toPage" type="text" class="input toPage" /><input id="pageSize" type="text" class="input pageSize" /><a id="page_submit" href="javascript:" onClick="return false;" class="page_submit">&nbsp;</a></div></td></tr></tfoot></table><script type="text/javascript">window.L.strVar("L.extension.pageTable.callback.afterLoadList[]", window.L.strVar("L.extension.pageTable.callback.initLoadList[]", function(pageTableObj, pageTableClass, index, type){if(pageTableObj.getAttribute("_pagetabledataset") === "exam_examCtl::getAllowExamPageTable"){}}));</script>                    </div>
                       
                </div>
  </div>
        </div>
        <!-- // main_body end -->
</body>
</html>
