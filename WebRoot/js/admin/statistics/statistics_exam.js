//考试统计js
/**
 * 初始化考试统计页面
 * 
 * @author	Dai
 * @date		12.01.17
 * @Copyright (c) 2007-2012 Orivon.Inc
 * @since    	
 * @param 
 * @return 	
 */
function statisticsExamInit()
{
	initResetArea({'selection':'#statistics_exam_search_param_div','id':'statistics_exam_search_param_div'});//初始化重置区域
	window.L.openCom('wDate', {
		'obj' : $('#exam_begin_tm').get(0), //需绑定的对象
		'params' : {'readOnly' : true} //传递WdatePicker的参数
		}); 
	window.L.openCom('wDate', {
		'obj' : $('#exam_end_tm').get(0), //需绑定的对象
		'params' : {'readOnly' : true} //传递WdatePicker的参数
		}); 
}

function statisticsExamRankInit()
{
	initResetArea({'selection':'#statistics_rank_search_param_div','id':'statistics_rank_search_param_div'});//初始化重置区域
}
/**
 * 显示考试分类树
 * 
 * @author	Dai
 * @date		12.01.17
 * @Copyright (c) 2007-2012 Orivon.Inc
 * @since    	
 * @param 
 * @return 	
 */
function statisticsExamCategoryTreeShow(name_id,value_id)
{
	var is_show_root=arguments[2]?arguments[2]:false;
	var option = {
	'targetNameId':name_id,
	'targetValueId':value_id,
	'dataType':'exam_category',
	'showRoot':is_show_root
	};
	getTree(option);
}
/**
 * 导出统计
 * @author	Dai
 * @date		12.01.17
 * @Copyright (c) 2007-2012 Orivon.Inc
 * @since    	
 * @param 
 * @return 	
 */
function statisticsExport(statics_type)
{
	var condition = 1;
	switch(statics_type)
	{
		case 'question':
			condition = statisticsExamQuestionGetSearchCondition();
		break;
		case 'rank':
			condition = statisticsExamRankGetSearchCondition();
		break;
		case 'group':
			condition = statisticsExamGroupGetSearchCondition();
		break;
		case 'user':
			condition = statisticsExamUserGetSearchCondition();
		break;
	}
	var params = encodeURIComponent(L.JSON.stringify(condition));
	
	$('#export_params').val(params);
	$('#export_type').val(statics_type);
	$("#statistics_export_form").submit(); 
}

function statisticGroupTreeShow(name_id,value_id)
{
	var is_show_root=arguments[2]?arguments[2]:false;
	var option = {
	'targetNameId':name_id,
	'targetValueId':value_id,
	'dataType':'group',
	'showRoot':is_show_root
	};
	getTree(option);
}

function statisticsQsnCategoryTreeShow(name_id,value_id)
{
	var is_show_root=arguments[2]?arguments[2]:false;
	var option = {
	'targetNameId':name_id,
	'targetValueId':value_id,
	'dataType':'qsn_category',
	'showRoot':is_show_root
	};
	getTree(option);
}

function statisticsQsnSourceTreeShow(name_id,value_id)
{
	var is_show_root=arguments[2]?arguments[2]:false;
	var option = {
	'targetNameId':name_id,
	'targetValueId':value_id,
	'dataType':'qsn_source',
	'showRoot':is_show_root
	};
	getTree(option);
}
var ExamStatisticsObj = {
    'searchSubmit' :function(){
      
      var type=  $('input[name=radio]:checked').attr('id');
      if(type=="allGroup"){
          var searchData = {
              'group' : $.trim($('#grouptext').attr('key')),
              'exam_id' : $.trim($("#exam_id").val()),
              'exam_times' : $.trim($("#exam_times").val()),
              'type' : 'allGroup'
          }
       }else if(type=="assignGroup"){
           var searchData = {
               'group' : $.trim($('#grouptext').attr('key')),
               'exam_id' : $.trim($("#exam_id").val()),
               'exam_times' : $.trim($("#exam_times").val()),
               'type' : 'assignGroup'
           }
       }
      var pageTableClassObj = window.L.extension.pageTable.classObj;
      var pageTableObj = document.getElementById('ExamGroupStatistics');
      var paramsObj = pageTableClassObj.params(pageTableObj);
      paramsObj.searchData = searchData;
      pageTableClassObj.params(pageTableObj, paramsObj, true);
      },
      'reSet' :function (){
          if($('#allGroup:checked')){
              $('#grouptext').text('');
              $('#grouptext').attr('key','');

          }
      },
  //获得分组
    'getGroupListTreeClickFun' : function(){
        var option = {
            'targetId'         : 'group_id',
            'callbackFn'       : function(callbackList)
            {  
                window.L.each(callbackList, function(k, data){
                    idList[k] = data[k].id;
                    nameList[k] = data[k].name;
                }, idList = [], nameList = []);

                $('#grouptext').attr('key', idList.join(','))
                          .text(nameList.join('- '));
            
            },
            'dataType'         : 'group',
            'isExpand'         : false,
            'showRoot'         : false,
            'isCheckBox'       : true,
            'expandLevel'      : 2,
            'chkboxType'       : { "Y": "", "N": "" }
            };
            getTree(option);
        },
    'orECharts'  : function (){
        var obj=new Array();
        var groupName    =[];
        var allcount     =[];
        var totalcount   =[];
        var passNum      =[];
        var passRate     =[];
        var count = 0;
        var show =false;
        $('#ExamGroupStatistics tbody tr').each(function(){
            groupName.push($(this).find('td:first-child').text());
            allcount.push($(this).find('td').eq(1).text());
            totalcount.push($(this).find('td').eq(2).text());
            passNum.push($(this).find('td').eq(3).text());
            passRate.push($(this).find('td').eq(4).text());
            count++;
            }
        )
        if(count>10){
            show= true;
        }else {
            show= false;
        }
        var lineName="";
        var eCharts = window.L.openCom('eCharts', {    // 返回图表对象
            'obj'       : document.getElementById('ExameCharts'),
            'setOption' : {
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                legend: {
                    data:['应参考人数','实际参考人数','及格人数','及格率%']
                },
                dataZoom : {
                    show : show,
                    realtime:show,
                    start : 0,
                    end : 100
                },
                xAxis : [
                    {
                        type : 'category',
                        boundaryGap :true,
                        data : groupName
                    }
                ],
                yAxis : [
                    {
                        type : 'value',
                        splitArea : {show : true}
                    },
                    {
                        type : 'value',
                        splitArea : {show : true}
                    },
                ],
                series : [
                          {
                    name:'及格率%',
                    type:'line',
                    yAxisIndex: 1,
                    symbol: 'none',
                    data:passRate
                    }, 
                    {
                        name:'应参考人数',
                        type:'bar',
                        data:allcount
                    },
                    {
                        name:'实际参考人数',
                        type:'bar',
                        data:totalcount
                    },
                    {
                        name:'及格人数',
                        type:'bar',
                        data:passNum
                    }
                ]
            }
        });
    }
    
}
/**
 * 显示考试人员
 * 
 * @author      Dai
 * @date                12.8.22
 * @Copyright (c) 2007-2010 Orivon.Inc
 * @since       
 * @param 1、真实参加考试人数，2、未参加考试人数，3、计划参加考试人数
 * @return      
 */
 
 function examAlertExamUserList(exam_id,exam_times,list_type)
 {
         var sendurl =window.L._adminUrl+'/examscore/examscoreCtl.php?';
         window.L.openCom('oDialogDiv')(window.L.getText("人员列表"),  'iframe:'+sendurl+'{"get":{"a":"alertExamUserList"}, "post" : {"exam_id":"'+exam_id+'","exam_times":"'+exam_times+'","list_type":"'+list_type+'"}}', '800px', '600px', [1],10,true);
 }

/**
 * 搜索考试统计信息
 * 
 * @author	Dai
 * @date		12.01.17
 * @Copyright (c) 2007-2012 Orivon.Inc
 * @since    	
 * @param 
 * @return 	
 */
function statisticsSearchExamStatistics()
{
        var searchData = {
            'exam_name' : $.trim($('#exam_name').val()),
            'exam_category' :$("#exam_category").val()=='3'?'':$("#exam_category").val(),
            'exam_end_tm' : $.trim($('#exam_end_tm').val()),
            'exam_begin_tm' : $.trim($('#exam_begin_tm').val())
        }
        if(searchData.exam_name === '')
        {
            delete searchData.exam_name;
        }
        if(searchData.exam_category === '')
        {
            delete searchData.exam_category;
        }
        if(searchData.exam_end_tm === '')
        {
            delete searchData.exam_end_tm;
        }
        if(searchData.exam_begin_tm === '')
        {
            delete searchData.exam_begin_tm;
        }

        var pageTableClassObj = window.L.extension.pageTable.classObj;
        var pageTableObj = document.getElementById('StatisticsExamListPageID');
        var paramsObj = pageTableClassObj.params(pageTableObj);
        paramsObj.searchData = searchData;
        pageTableClassObj.params(pageTableObj, paramsObj, true);
    
}

/**
 * 获得考试统计搜索条件
 * 
 * @author	Dai
 * @date		12.01.17
 * @Copyright (c) 2007-2012 Orivon.Inc
 * @since    	
 * @param 
 * @return 	
 */
function statisticsExamGetSearchCondition()
{
	var condition = {'exam_name': $.trim($("#exam_name").val()),
	'exam_category' : $("#exam_category").val()=='3'?'':$("#exam_category").val(),
	'exam_end_tm' : $("#exam_end_tm").val(),
	'exam_begin_tm' : $("#exam_begin_tm").val()
	};
	return condition;
}
function statisticsSearchExamUser()
{
	var condition = statisticsExamUserGetSearchCondition();
	var pageTableObj = $('table[_pagetabledataset="admin_statistics_statisticsCtl::displayExamUserList"]');
	window.L.extension.pageTable.classObj.params(pageTableObj.get(0), condition, true);
}
function statisticsExamUserGetSearchCondition()
{
	var condition = {
	'group_id' : $.trim($("#group_id").val()),
	'exam_id' : $.trim($("#exam_id").val()),
	'exam_times' : $.trim($("#exam_times").val()),
	'qsn_category': $("#qsn_category").val(),
	'qsn_source' : $.trim($("#qsn_source").val()),
	'qsn_level' : $.trim($("#qsn_level").val()),
	'qsn_type' : $.trim($("#qsn_type").val())
	};
	return condition;
}
function statisticsSearchExamGroup()
{
	var condition = statisticsExamGroupGetSearchCondition();
	var pageTableObj = $('table[_pagetabledataset="admin_statistics_statisticsCtl::displayExamGroupList"]');
	window.L.extension.pageTable.classObj.params(pageTableObj.get(0), condition, true);
}
function statisticsExamGroupGetSearchCondition()
{
	var condition = {
	'group_id' : $.trim($("#group_id").val()),
	'exam_id' : $.trim($("#exam_id").val()),
	'exam_times' : $.trim($("#exam_times").val())
	};
	return condition;
}
function statisticsSearchExamQuestion()
{
	var condition = statisticsExamQuestionGetSearchCondition();
	var pageTableObj = $('table[_pagetabledataset="admin_statistics_statisticsCtl::displayExamQuestionList"]');
	window.L.extension.pageTable.classObj.params(pageTableObj.get(0), condition, true);
}

function statisticsExamQuestionGetSearchCondition()
{
	var condition = {'qsn_category': $("#qsn_category").val(),
	'qsn_source' : $.trim($("#qsn_source").val()),
	'qsn_level' : $.trim($("#qsn_level").val()),
	'qsn_type' : $.trim($("#qsn_type").val()),
	'exam_id' : $.trim($("#exam_id").val()),
	'exam_times' : $.trim($("#exam_times").val())
	//,'tag_names':escape($.trim($("#tag_names").val()))
	};
	return condition;
}
/**
 * 搜索考试排名信息
 * 
 * @author	Dai
 * @date		12.01.17
 * @Copyright (c) 2007-2012 Orivon.Inc
 * @since    	
 * @param 
 * @return 	
 */
function statisticsSearchExamRank()
{
	var condition = statisticsExamRankGetSearchCondition();
	var pageTableObj = $('table[_pagetabledataset="admin_statistics_statisticsCtl::displayExamRankList"]');
	window.L.extension.pageTable.classObj.params(pageTableObj.get(0), condition, true);
	
}
function statisticsExamRankGetSearchCondition()
{
	var condition = {'group_id': $("#group_id").val(),
	'username' : $.trim($("#username").val()),
	'real_name' : $.trim($("#real_name").val()),
	'exam_id' : $.trim($("#exam_id").val()),
	'exam_times' : $.trim($("#exam_times").val())
	};
	return condition;
}

/**
 * 重置考试统计搜索条件
 * 
 * @author	Dai
 * @date		12.01.17
 * @Copyright (c) 2007-2012 Orivon.Inc
 * @since    	
 * @param 
 * @return 	
 */
function statisticsResetExamSearchParams()
{
	resetArea('statistics_exam_search_param_div');
	statisticsExamInit();
}

function statisticsResetExamRankParams()
{
	resetArea('statistics_rank_search_param_div');
	statisticsExamRankInit();
}

/**
 * 弹出单次考试统计
 * 
 * @author	Dai
 * @date		12.01.17
 * @Copyright (c) 2007-2012 Orivon.Inc
 * @since    	
 * @param 
 * @return 	
 */
function statisticsAlertSingleExamStatistics(exam_id,exam_times,statistics_type)
{
	var alert_option = {
		'exam_id':exam_id,
		'exam_times':exam_times,
		'statistics_type':statistics_type
	};
	alert_option = L.JSON.stringify(alert_option );
	var type= "";
	switch (statistics_type){
	    case 'question':
	        type="试题统计";
	        break;
	    case 'rank':
	        type="排名统计";
                break;
	    case 'group':
	        type="机构统计";
                break;
	    case 'user':
                type="考生统计";
                break;
	}
	if(window.L.openCom('oDialogDiv'))
	{
		var sendurl = window.L._adminUrl+'/statistics/statisticsCtl.php?';
		ALERT_DIV_MARK = oDialogDiv(window.L.getText(type),  "iframe:"+sendurl+"{'get':{'a':'alertSingleStatisticsExam'}, 'post' : {'_pageTableParams':'"+alert_option+"'}}", "1100px", "600px", [1],10,true);
	}
}

/**
 * 考试分析和排名之间替换
 * 
 * @author	Dai
 * @date		12.01.17
 * @Copyright (c) 2007-2012 Orivon.Inc
 * @since    	
 * @param 
 * @return 	
 */
function statisticsChangeStatisticsExamDiv(dtype)
{
	$("[name='exam_info_item_div']").hide();
	$("#statistics_menu_ul > li").removeAttr("id");

	switch(dtype)
	{
		case 'rank':
			$('#exam_rand_div').show();

			$($("#statistics_menu_ul > li").get(0)).attr("id","statistics_menu_btn2");
		break;
		case 'analysis':
			$('#exam_analysis_div').show();
			$($("#statistics_menu_ul > li").get(1)).attr("id","statistics_menu_btn2");
		break;
		case 'other':
			$('#exam_other_div').show();
			$($("#statistics_menu_ul > li").get(2)).attr("id","statistics_menu_btn2");
		break;
	}
	window.parent.oDialogDiv.skinLayout(window.parent.ALERT_DIV_MARK, "1100px", "600px");
}

/**
 * 获得试卷大题位置和大题名称
 * 
 * @author	Dai
 * @date		12.01.17
 * @Copyright (c) 2007-2012 Orivon.Inc
 * @since    	
 * @param 
 * @return 	
 */
function statisticsGetQsnTypePosition()
{
	var sendurl = window.L._adminUrl+'/statistics/statisticsCtl.php?a=getPaprQsnTypePositions';
	var params ='paprid='+$('#papr_id').val();
		
	$.ajax({
	   type: "POST",
	   async:false,
	   url: sendurl,
	   data: params,
	   dataType:"json",
	   success: function(data){
		   var qsn_type_position_innerhtml = '<option value="">'+window.L.getText('请选择大题标题')+'</option>';
		  $.each( data, function(i, qsn_type){
				qsn_type_position_innerhtml +='<option value="'+qsn_type.qsn_type_position+'">'+qsn_type.qsn_type_title+'</option>';
			});
		  	$("#qsn_type_position").empty();
			$("#qsn_type_position").append(qsn_type_position_innerhtml);
	   },
	   error:function (XMLHttpRequest, textStatus, errorThrown) {
		//alert("上传数据错误"+textStatus);
		} 
	});
}

/**
 * 搜索考试单体统计信息(正确率，错误率，半对率)
 * 
 * @author	Dai
 * @date		12.01.30
 * @Copyright (c) 2007-2012 Orivon.Inc
 * @since    	
 * @param 
 * @return 	
 */
function statisticsSearchExamQsnAnalysis()
{
	
	var condition = statisticsExamQsnAnalysisGetSearchCondition();
	if(condition.papr_id != '')
	{
		var pageTableObj = $('table[_pagetabledataset="admin_statistics_statisticsCtl::displayExamQsnAnalysisList"]');
		window.L.extension.pageTable.classObj.params(pageTableObj.get(0), condition, true);
	}else{
		 oDialogDivInfo(window.L.getText('请选择一张试卷'));
	}
}
window.L.strVar('L.extension.pageTable.callback.initLoadList[]', window.L.strVar('L.extension.pageTable.callback.afterLoadList[]', function(pageTableObj, pageTableClass)
{		
	if($(pageTableObj).attr('_pagetabledataset') === 'admin_statistics_statisticsCtl::displayExamQsnAnalysisList'||$(pageTableObj).attr('_pagetabledataset') === 'admin_statistics_statisticsCtl::displayExamRankList')
	{
		window.parent.oDialogDiv.skinLayout(window.parent.ALERT_DIV_MARK, "1100px", "600px");
	}
}));
/**
 * 搜索考试单题统计搜索条件
 * 
 * @author	Dai
 * @date		12.01.30
 * @Copyright (c) 2007-2012 Orivon.Inc
 * @since    	
 * @param 
 * @return 	
 */
function statisticsExamQsnAnalysisGetSearchCondition()
{
	var condition = {'exam_id': $("#exam_id").val(),
	'exam_times' : $("#exam_times").val(),
	'papr_id' : $("#papr_id").val(),
	'qsn_type_position' : $("#qsn_type_position").val(),
	'qsn_level' : $("#qsn_level").val()
	};
	return condition;
}

/**
 * 显示单题统计图表
 * 
 * @author	Dai
 * @date		12.01.31
 * @Copyright (c) 2007-2012 Orivon.Inc
 * @since    	
 * @param 
 * @return 	
 */
function statisticsShowExamQsnAnalysisFlot(q_position)
{
	switch(q_position)
	{
		case 'selected':
			var da_correct = new Array();
			var da_wrong = new Array();
			var da_half_correct = new Array();
			var da_xaxis = new Array();
			da_xaxis.push( [0, '']);
			var has_selected = true;
			$(":checkbox[name='qsn_analysis_cb']:checked").each(function(i){
				da_xaxis.push( [i+1, $(this).val()]);
				da_correct.push([i+0.75,$('#qsn_correct_count_hid_'+$(this).val()).val()]);
				da_wrong.push([i+0.95,$('#qsn_wrong_count_hid_'+$(this).val()).val()]);
				da_half_correct.push([i+1.15,$('#qsn_half_correct_count_hid_'+$(this).val()).val()]);
				has_selected = true;
			 });
			if(!has_selected)
			{
				oDialogDivInfo(window.L.getText('请至少选中一条数据'));
			}else{
				$("#exam_qsn_analysis_flot_div").height(300);
				 $.plot($("#exam_qsn_analysis_flot_div"), 
						  [{ label: window.L.getText("正确数"),  data: da_correct},{ label: window.L.getText("错误数"),  data: da_wrong} , { label: window.L.getText("半对数"),  data: da_half_correct} ], {
					series: {
						bars: { show: true, barWidth: 0.1,fillColor :{ colors: [ { opacity: 0.8 }, { opacity: 0.1 } ] } }
					},
					colors:["#0F0","#F00","#FF0"],
					xaxis:{ ticks:da_xaxis}
				});
			}
		break;
		default:
			
		break;
	}
	window.parent.oDialogDiv.skinLayout(window.parent.ALERT_DIV_MARK, "1100px", "600px");
}

/**
 * 显示单题统计图表
 * 
 * @author	Dai
 * @date		12.01.31
 * @Copyright (c) 2007-2012 Orivon.Inc
 * @since    	
 * @param 
 * @return 	
 */
function statisticsShowScoreAreaFlot()
{
	var exam_score_area = parseFloat($('#exam_score_area').val());
	//alert(STATISTICS_EXAM_POINT+','+STATISTICS_EXAM_PASSING_GRADE);
	//alert(L.JSON.stringify(STATISTICS_EXAM_POINT_LIST ));
	var valid_res = {'res':'success','info':''};
	if(!validPositive(STATISTICS_EXAM_PASSING_GRADE)||!validPositive(STATISTICS_EXAM_POINT))
	{
		valid_res.res = 'failed';
		valid_res.info = window.L.getText('数据有误');
	}
	if(!validPositive(exam_score_area)||exam_score_area==0)
	{
		valid_res.res = 'failed';
		valid_res.info = window.L.getText('区间段请输入一个正数');
	}
	
	if(valid_res.res  == 'success')
	{
		 $("#exam_score_area_flot_div").height(300);
		 var date_arr = {};
		 for(f = exam_score_area;(f-exam_score_area)<STATISTICS_EXAM_POINT;f+=exam_score_area)
		 {
			 var bar_width = exam_score_area;
			 var area_ed_val = f;
			 if(f>STATISTICS_EXAM_POINT)
			 {
				 bar_width = STATISTICS_EXAM_POINT-(f-exam_score_area);
				 area_ed_val= STATISTICS_EXAM_POINT;
			 }
			 date_arr[f] = {bars: { show: true , barWidth: bar_width,fillColor:{colors:[{opacity:0.8},{opacity: 0.1}]}},label:f-exam_score_area+'-'+area_ed_val,data:new Array([f-exam_score_area+0.05,0])};
		 }
		 var markings = [
			{ color: '#F00', lineWidth: 1, xaxis: { from: STATISTICS_EXAM_PASSING_GRADE, to: STATISTICS_EXAM_PASSING_GRADE } }
		];
		
		 $.each(STATISTICS_EXAM_POINT_LIST, function(k,v){
			 for(f = exam_score_area;f-exam_score_area<STATISTICS_EXAM_POINT;f+=exam_score_area)
			 {
				 if(v.exam_point <= f)
				 {
					 date_arr[f].data[0][1]++;
					 break;
				 }
			 }
		});
		 dat_info = new Array();
		 $.each(date_arr, function(k,v){
							dat_info.push(v);		
				});
		 var score_area_plot = $.plot($("#exam_score_area_flot_div"), 
				  dat_info,
				  { grid: { markings: markings }}
				);
	
		 $.each(dat_info, function(k,v){
				var s_pos =score_area_plot.pointOffset({ x: v.data[0][0], y:  v.data[0][1]});	
				$("#exam_score_area_flot_div").append('<div style="position:absolute;left:' + (s_pos.left + 4) + 'px;top:' + (s_pos.top-25) + 'px;color:#666;font-size:smaller">'+v.data[0][1]+window.L.getText('人')+'</div>');
			});
		
	}else{
		oDialogDivInfo(valid_res.info);
	}
	window.parent.oDialogDiv.skinLayout(window.parent.ALERT_DIV_MARK, "1100px", "600px");
}