var modfiyCourseObj={operation:function(a){a=a.id;window.L.openCom("oDialogDiv")&&(a=window.L._adminUrl+"/review/course.php?a=courseReview&c_id="+a,oDialogDiv(window.L.getText("\u9009\u62e9\u8bd5\u9898"),"iframe:"+a,"1100px","600px",[1],10,!0))},searchSubmit:function(){var a={c_name:$.trim($("#c_name").val()),desc_cn:$.trim($("#desc_cn").val()),start_time:$.trim($("#start_time").val()),end_time:$.trim($("#end_time").val())};""===a.c_name&&delete a.c_name;""===a.desc_cn||!$("#desc_cn").attr("key")?
delete a.desc_cn:a.desc_cn=$("#desc_cn").attr("key");""===a.start_time&&delete a.start_time;""===a.end_time&&delete a.end_time;var c=window.L.extension.pageTable.classObj,d=document.getElementById("courseReviewListPageTable"),b=c.params(d);b.searchData=a;c.params(d,b,!0)},getGroupListTreeClickFun:function(a){getTree({targetId:"desc_cn",callbackFn:function(c){window.L.each(c,function(a,b){idList[a]=b[a].id;nameList[a]=b[a].name},idList=[],nameList=[]);$(a).attr("key",idList.join(",")).val(nameList.join(","))},
dataType:"course_category",isExpand:!1,showRoot:!1,isCheckBox:!0,chkboxType:{Y:"s",N:"ps"}})}};$(function(){window.L.openCom("wDate",{obj:document.getElementById("start_time"),params:{readOnly:!0}});window.L.openCom("wDate",{obj:document.getElementById("end_time"),params:{readOnly:!0}})});
