var modfiyCoursewareObj={searchSubmit:function(){var a="",b={};if(""!==(a=$.trim($("#w_name").val())))b.w_name=a;if(""!==(a=$.trim($("#w_tagName").val())))b.w_tagName=a;if(""!==(a=$.trim($("#w_category").attr("w_category_id"))))b.w_category=a;if(""!==(a=$.trim($("#w_length_min").val())))b.w_length_min=a;if(""!==(a=$.trim($("#w_length_max").val())))b.w_length_max=a;if(""!==(a=$.trim($("#w_credit_min").val())))b.w_credit_min=a;if(""!==(a=$.trim($("#w_credit_max").val())))b.w_credit_max=a;if(""!==(a=
$.trim($("#create_tm_min").val())))b.create_tm_min=a;if(""!==(a=$.trim($("#create_tm_max").val())))b.create_tm_max=a;if(""!==(a=$.trim($("#w_username").val())))b.w_username=a;a=L.extension.pageTable.classObj.params(document.getElementById("coursewareListPageTable"));($.isArray(a)?a={}:a).searchVar=b;L.extension.pageTable.classObj.params(document.getElementById("coursewareListPageTable"),a,!0)},pageTableCustomDel:function(){var a=[],b=L.extension.pageTable.classObj,c=document.getElementById("coursewareListPageTable");
$("tbody:first > tr > td:first-child input:checked",c).each(function(){a[a.length]=$(this).attr("key")});0<a.length?window.L.openCom("oDialogDiv")(window.L.getText("\u786e\u5b9a\u5220\u9664\u9009\u4e2d\u7684\u6570\u636e\u5417?"),"","auto","auto",[2,function(e){e&&(b.loadLock(c,window.L.getText("\u6b63\u5728\u5220\u9664...")),$.post("?a=delCourseware",{delList:a},function(a){0<a?b.params(c,null,!0):(0!=a&&window.L.openCom("oDialogDiv")("Error:","text:"+a,"auto","auto",[1]),b.loadLock(c,!1))}))}]):
window.L.openCom("tip")(window.L.getText("\u8bf7\u9009\u62e9\u5220\u9664\u6570\u636e\u7684\u590d\u9009\u6846"));return!1},coursewareCategoryClick:function(){getTree({targetId:"w_category",callbackFn:function(a){window.L.each(a,function(a,c){idList[a]=c[a].id;nameList[a]=c[a].name},idList=[],nameList=[]);$("#w_category").val(nameList.join(",")).attr("w_category_id",idList.join(","))},dataType:"courseware_category",isCheckBox:!0,isExpand:!1,showRoot:!1,chkboxType:{Y:"s",N:"ps"}})}};
$(function(){window.L.openCom("wDate",{obj:$("#create_tm_min").get(0),eventType:"focus",params:{readOnly:!0}});window.L.openCom("wDate",{obj:$("#create_tm_max").get(0),eventType:"focus",params:{readOnly:!0}})});
-1<window.location.href.indexOf("&share=1")&&(window.L.strVar("L.extension.pageTable.callback.beforeLoadList[]",function(a,b){if("coursewareListPageTable"===a.id){var c=b.params(a);b.eachTbody(a,"*",0,function(a){var b=$("input",a.tdObj),a=b.prop("checked"),b=b.attr("key");if(a&&!c.associatedCoursewareList[b]){var a=1,d;for(d in c.associatedCoursewareList)0!=d&&c.associatedCoursewareList[d]>=a&&(a=c.associatedCoursewareList[d]+1);c.associatedCoursewareList[b]=a}else!a&&c.associatedCoursewareList[b]&&
delete c.associatedCoursewareList[b]});b.params(a,c)}}),window.L.strVar("L.extension.pageTable.callback.initLoadList[]",window.L.strVar("L.extension.pageTable.callback.afterLoadList[]",function(a,b){if("coursewareListPageTable"===a.id){var c=b.params(a);b.eachTbody(a,"*",0,function(a){a=$("input",a.tdObj);c.associatedCoursewareList[a.attr("key")]&&a.prop("checked",!0)});window.L.openCom("oDialogDiv").skinLayout()}})));
