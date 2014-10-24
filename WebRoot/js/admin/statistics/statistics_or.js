
var OrStatisticsObj = {
    'searchSubmit' :function(){
      
      var type=  $('input[name=radio]:checked').attr('id');
      if(type=="allGroup"){
          var searchData = {
              'group' : $.trim($('#grouptext').attr('key')),
              'courseId' :$.trim($('#c_id').attr('key')),
              'type' : 'allGroup'
          }
       }else if(type=="assignGroup"){
           var searchData = {
               'group' : $.trim($('#grouptext').attr('key')),
               'courseId' :$.trim($('#c_id').attr('key')),
               'type' : 'assignGroup'
           }
       }
      var pageTableClassObj = window.L.extension.pageTable.classObj;
      var pageTableObj = document.getElementById('courseStatisticsOrganpage');
      var paramsObj = pageTableClassObj.params(pageTableObj);
      paramsObj.searchData = searchData;
      pageTableClassObj.params(pageTableObj, paramsObj, true);
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
        'reSet' :function (){
            if($('#allGroup:checked')){
                $('#grouptext').text('');
                $('#grouptext').attr('key','');

            }
        },
    'orECharts'  : function (){
        var obj=new Array();
        var typeName     =[];
        var lenrningNum  =[];
        var lenNum       =[];
        var passNum      =[];
        var pass         =[];
        var count = 0;
        var show =false;
        //var grouptext="";
        $('#courseStatisticsOrganpage tbody tr ').each(function(){
            //grouptext+=$(this).find('td:first-child').text()+"- ";
            typeName.push($(this).find('td:first-child').text());
            lenrningNum.push($(this).find('td').eq(1).text());
            lenNum.push($(this).find('td').eq(2).text());
            passNum.push($(this).find('td').eq(3).text());
            pass.push($(this).find('td').eq(6).text());
            count++;
            }
        )
       // $('#grouptext').html(grouptext);
        if(count>10){
            show= true;
        }else {
            show= false;
        }
        var lineName="";
        var eCharts = window.L.openCom('eCharts', {    // 返回图表对象
            'obj'       : document.getElementById('eChartsMain'),
            'setOption' : {
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                legend: {
                    data:['应学习人数','当前学习人数','已通过人数','通过率%']
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
                        data : typeName
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
                    name:'通过率%',
                    type:'line',
                    yAxisIndex: 1,
                    symbol: 'none',
                    data:pass
                    }, 
                    {
                        name:'应学习人数',
                        type:'bar',
                        data:lenrningNum
                    },
                    {
                        name:'当前学习人数',
                        type:'bar',
                        data:lenNum
                    },
                    {
                        name:'已通过人数',
                        type:'bar',
                        data:passNum
                    }
                ]
            }
        });
    }
    
}