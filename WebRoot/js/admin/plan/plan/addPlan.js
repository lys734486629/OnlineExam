var addPlanObj={getStudyPlanSourceListTreeClickFun:function(a){getTree({targetId:a.id,callbackFn:function(c,b){$(a).attr("key",c).val(b)},dataType:"study_plan_source",isExpand:!1,showRoot:!1})},allowIpRadioClickFun:function(a){"0"===a.value?$(document.getElementById("allowIp").parentNode).hide():$(document.getElementById("allowIp").parentNode).show()},inputIpBlurCheckFun:function(a){if(/^(?:(?:1?\d{1,2}|2[0-4]\d|25[0-5])\.){3}(?:1?\d{1,2}|2[0-4]\d|25[0-5])$/.test(a.value)||""===$.trim(a.value))return!0;
window.L.openCom("tip")(window.L.getText("IP\u5730\u5740\u65e0\u6548,\u8bf7\u786e\u8ba4"));window.setTimeout(function(){a.focus();a.select()},0);return!1},addIpClickFun:function(a){var c=!0;$("#allowIp > div").each(function(){if(""===$.trim($("input:eq(0)",this).val())&&""===$.trim($("input:eq(1)",this).val()))return $("input:eq(0)",this).focus(),c=!1});c&&$(a.parentNode).clone().appendTo(a.parentNode.parentNode).find("input").val("")},delIpClickFun:function(a){1<$("> div",a.parentNode.parentNode).length?
$(a.parentNode).remove():($("input",a.parentNode).val(""),$("input[name=allowIpRadio][value=0]").click())},getTagList:function(){tagDisplayTag({tagType:"8",callbackFn:"addPlanObj.addTagList",targetId:"getAddTagListButton"})},addTagList:function(a,c){0===$('#tagList > span[tagId="'+a+'"]').length&&$('<span tagId="'+a+'" class="icon_link"><a href="#">'+c+'</a><a class="icon_del" href="#" onclick="addPlanObj.delTag(this, \''+a+"'); return false;\"></a></span>").appendTo("#tagList")},delTag:function(a){$(a.parentNode).remove()},
delAllTag:function(){$("#tagList").html("")},delfrontCoverClick:function(a){a.getAttribute("fileUrl")&&window.L.openCom("oDialogDiv")(window.L.getText("\u786e\u5b9a\u8981\u5220\u9664\u5c01\u9762\u5417?"),"","auto","auto",[2,function(c){c&&(a.src=window.L._rootUrl+"/include/oFileManager/fileExtension.php?fileUrl=/images/icon/icon_thumb_default1.png",a.setAttribute("fileUrl",""))}])},getAllAddCourseList:function(a,c){var b=null,d={};"object"===$.type(a)&&(b=$(a).parents("#courseBlock").get(-1));$("#courseListBlock > div").each(function(){var a=
$("#c_name",this).get(0).getAttribute("key");a&&(d[c+a]={type:this!==b,c_name:window.L.strTranscoding.textToHtml($("#c_name",this).val())})});return d},clearCourseBlock:function(a){$(a).find(".whereBlock").remove().end().find("#timePeriod > span:gt(0)").remove().end().find("input:radio").prop("name","courseBlockPassCondition").end().find("input:text").attr("value","").eq(0).val($("#courseListBlock > div").length+(a.parent().length^1)).end().get(1).setAttribute("key","")},updateCourseBlockSortVlue:function(){$("#courseListBlock > div").each(function(a){$("input.num",
this).val(a+1)})},courseBlockSortKeypressFun:function(a,c){if("13"==a.keyCode){var b=parseInt($.trim(c.value),10)-1;if(isNaN(b)||0>b)window.L.openCom("tip")(window.L.getText("\u65e0\u6548\u6392\u5e8f"));else{var d=$(c).parents("#courseBlock").eq(-1).remove(),e=$("#courseListBlock > div");b>=e.length?$("#courseListBlock").append(d):e.eq(b).before(d);var f={},g=!1;$("#courseListBlock > div").each(function(){var a=$("#c_name",this).get(0).getAttribute("key");a&&(f[a]=!0);$(".whereCourse > div",this).each(function(){f[this.getAttribute("key")]||
(g=!0,$(this).remove())})});$("#courseListBlock .whereCourse:empty").each(function(){$(this.parentNode).remove()});g&&window.L.openCom("tip")(window.L.getText("\u76f8\u5173\u5b66\u4e60\u6761\u4ef6\u5df2\u53d8\u66f4,\u8bf7\u91cd\u65b0\u8c03\u6574"));this.updateCourseBlockSortVlue()}}},addCourseBlockClickFun:function(){if(!$('#courseListBlock input[key=""]').length||!$('#courseListBlock input[key][value=""]').length){var a=$("#courseListBlock > div:eq(0)").clone();this.clearCourseBlock(a);a.appendTo("#courseListBlock")}else window.L.openCom("tip")(window.L.getText("\u8bf7\u5728\u8be5\u5904\u9009\u62e9\u60a8\u6307\u5b9a\u7684\u8bfe\u7a0b")),
$("#courseListBlock input[key]").focus()},delCourseBlockClickFun:function(a){a=$(a).parents("#courseBlock").eq(-1);if(1<$("#courseListBlock > div").length){var c=a.find("input:text").get(1).getAttribute("key");c&&(a.nextAll().find(".whereCourse > div[key="+c+"]").remove(),a.nextAll().find(".whereCourse:empty").each(function(){$(this.parentNode).remove()}));a.remove();this.updateCourseBlockSortVlue()}else this.clearCourseBlock(a)},slideToggleCourseBlockClickFun:function(a){$(a).parents("#courseBlock").eq(-1).children(".sub_content").slideToggle("fast")},
updateCourseBlockClickFun:function(a){var c=window.L.JSON.stringify(this.getAllAddCourseList(a,""));window.L.openCom("oDialogDiv")(window.L.getText(window.L.getText("\u8bf7\u9009\u62e9\u8bfe\u7a0b")),"iframe:"+window.L._adminUrl+'/course/course.php?{"get" : {"a" : "modfiyCourse", "share" : 1},"post" : {"associatedCourseList" : \''+c+"'}}","auto","auto",[2,function(b,c,e){if(b&&"visible"===e.oDialogDivObj.find("> .scroll iframe").css("visibility")){var b=e.oDialogDivObj.find("> .scroll iframe").prop("contentWindow"),
c=b.document.getElementById("modfiyCourseListPageTable"),c=b.L.extension.pageTable.classObj.params(c),f;for(f in c.associatedCourseList)if(!1===c.associatedCourseList[f].type){b=a.getAttribute("key");c=window.L.strTranscoding.htmlToText(c.associatedCourseList[f].c_name);b&&$("#courseListBlock .whereCourse > div[key="+b+"]").attr("key",f).find("font").text(c);a.setAttribute("key",f);$(a).attr("value",c).parents("#courseBlock").eq(-1).find("input:radio").prop("name","courseBlockPassCondition_"+f);break}}}])},
addStudyWhere:function(a){a=a.parentNode.parentNode;(!$(".whereBlock",a).length||!$(".whereCourse:empty",a).length)&&$('<div class="whereBlock"><h1><a class="icon_del" onclick="addPlanObj.delCourseWhere(this);" title="'+window.L.getText("\u5220\u9664\u6761\u4ef6")+'"></a><a class="icon_add" title="'+window.L.getText("\u6dfb\u52a0\u8bfe\u7a0b")+'" onclick="addPlanObj.addCourseWhere(this);"></a>'+window.L.getText("\u901a\u8fc7\u4ee5\u4e0b\u8bfe\u7a0b\u53ef\u5b66\u4e60\u672c\u8bfe\u7a0b\uff1a")+'</h1><div class="whereCourse" ></div></div>').appendTo(a);
$(".whereCourse:empty",a).parent().find("> h1 > .icon_add").click()},addCourseWhere:function(a){if(""===a.innerHTML){var c=a.parentNode.parentNode,b=$(".whereCourse > div",c),d=this.getAllAddCourseList(a," "),e={},f="";b.each(function(){e[$(this).attr("key")]=!0});for(var g in d)if(d[g].type)e[$.trim(g)]||(f+='<label><input type="checkbox" class="checkbox" key="'+$.trim(g)+'" name="floatDivWhereCourse">'+d[g].c_name+"</label>");else break;""===f?window.L.openCom("tip")("\u6ca1\u6709\u53ef\u9009\u7684\u8bfe\u7a0b"):
(a.innerHTML='<div class="float_div">'+f+"</div>",$(document).click(function(b){"A"!==b.target.tagName&&!$(b.target).parents(".icon_add").eq(-1).hasClass("icon_add")&&($("label > input:checked",a).each(function(){$(".whereCourse",c).append('<div key="'+this.getAttribute("key")+'"><span>'+window.L.getText("\u5fc5\u987b\u901a\u8fc7\uff1a")+"</span><span><font>"+window.L.strTranscoding.textToHtml($.trim($(this.parentNode).text()))+'</font><a class="icon_del" onclick="addPlanObj.delCourse(this);"></a></span></div>')}),
a.innerHTML="",$(document).unbind("click",arguments.callee))}))}},delCourseWhere:function(a){$(a.parentNode.parentNode).remove()},delCourse:function(a){$(a.parentNode.parentNode).remove()},addStubyTimePeriod:function(a){var c=!0;$(a.parentNode.parentNode).children("div").each(function(a){var d=$("input",this);if(2===a||""===d.get(0).value&&""===d.get(1).value)return c=!1});c&&$(a.parentNode).clone().appendTo(a.parentNode.parentNode).find("input").val("")},delStubyTimePeriod:function(a){a=$(a.parentNode);
0===a.siblings("div").length?a.find("input").val(""):a.remove()},getCourseUserListDialogDivClickFun:function(a,c){var b=window.L.extension.pageTable.classObj,d=document.getElementById("planUserListPageTable"),e=b.params(d),f={"00":{type:!1}},g;for(g in e.associatedPlanUserList)e.associatedPlanUserList[g].type===c&&(f[g]={type:!0});window.L.openCom("oDialogDiv")(window.L.getText("\u8bf7\u9009\u62e9\u7528\u6237"),"iframe:"+window.L._adminUrl+'/course/course.php?{"get" : {"a" : "getAssociatedCourseUserList"}, "post" : {"associatedCourseUserList" : \''+
window.L.JSON.stringify(f)+"'}}","auto","auto",[2,function(a,g,h){if(a&&"visible"===h.oDialogDivObj.find("> .scroll iframe").css("visibility")){var a=h.oDialogDivObj.find("> .scroll iframe").prop("contentWindow"),g=a.document.getElementById("getAssociatedCourseUserListPageTable"),a=a.L.extension.pageTable.classObj.params(g),j;for(j in a.associatedCourseUserList)e.associatedPlanUserList[j]={type:c},delete f[j];for(j in f)"00"!==j&&delete e.associatedPlanUserList[j];b.params(d,e,!0)}}])},changeCourseUserListStateClickFun:function(a){var c=
window.L.extension.pageTable.classObj,b=document.getElementById("planUserListPageTable"),d=c.params(b),e=a.getAttribute("key");a.innerHTML=window.L.getText((d.associatedPlanUserList[e].type=!d.associatedPlanUserList[e].type)?"\u5305\u542b":"\u6392\u9664");c.params(b,d)},delCourseUserList:function(){var a=window.L.extension.pageTable.classObj,c=document.getElementById("planUserListPageTable"),b=a.params(c);a.eachTbody(c,"*",0,function(a){(a=$("input:checked",a.tdObj).attr("key"))&&delete b.associatedPlanUserList[a]});
a.params(c,b,!0)},changeCourseUserListStatus:function(a){var c=window.L.extension.pageTable.classObj,b=document.getElementById("planUserListPageTable"),d=c.params(b);c.eachTbody(b,"*",0,function(b){if(b=$("input:checked",b.tdObj).attr("key"))d.associatedPlanUserList[b].type=a});c.params(b,d,!0)},getCourseGroupListTreeClickFun:function(a,c){var b=window.L.extension.pageTable.classObj,d=document.getElementById("planGroupListPageTable"),e=b.params(d),f={},g;for(g in e.associatedPlanGroupList)e.associatedPlanGroupList[g].type===
c&&(f[g]=g);getTree({targetId:a.id,treeMark:a.id,callbackFn:function(a){for(var g in a)window.L.strVar(e,"associatedPlanGroupList."+a[g].id+".type",c),null==e.associatedPlanGroupList[a[g].id].isIncludeSub&&(e.associatedPlanGroupList[a[g].id].isIncludeSub=!0),delete f[a[g].id];for(g in f)"00"!==g&&delete e.associatedPlanGroupList[g];b.params(d,e,!0)},dataType:"group",isCheckBox:!0,isExpand:!1,showRoot:!1,expandLevel:2,checkedId:f,chkboxType:{Y:"",N:""}})},delCourseGroupList:function(){var a=window.L.extension.pageTable.classObj,
c=document.getElementById("planGroupListPageTable"),b=a.params(c);a.eachTbody(c,"*",0,function(a){(a=$("input:checked",a.tdObj).attr("key"))&&delete b.associatedPlanGroupList[a]});a.params(c,b,!0)},changeCourseGroupListStateClickFun:function(a){var c=window.L.extension.pageTable.classObj,b=document.getElementById("planGroupListPageTable"),d=c.params(b),e=a.getAttribute("key");a.innerHTML=window.L.getText((d.associatedPlanGroupList[e].type=!d.associatedPlanGroupList[e].type)?"\u5305\u542b":"\u6392\u9664");
c.params(b,d)},changeCourseGroupListStatus:function(a){var c=window.L.extension.pageTable.classObj,b=document.getElementById("planGroupListPageTable"),d=c.params(b);c.eachTbody(b,"*",0,function(b){if(b=$("input:checked",b.tdObj).attr("key"))d.associatedPlanGroupList[b].type=a});c.params(b,d,!0)},changeCourseGroupListIncludeSubClickFun:function(a){var c=window.L.extension.pageTable.classObj,b=document.getElementById("planGroupListPageTable"),d=c.params(b),a=a.getAttribute("key");d.associatedPlanGroupList[a].isIncludeSub=
!d.associatedPlanGroupList[a].isIncludeSub;c.params(b,d)},delPlanExamListClickFun:function(){var a=window.L.extension.pageTable.classObj,c=document.getElementById("planExamListPageTable"),b=a.params(c);a.eachTbody(c,"*",0,function(a){(a=$("input:checked",a.tdObj).attr("key"))&&delete b.associatedPlanExamList[a]});a.params(c,b,!0)},getCourseExamListDialogDivClickFun:function(){var a=window.L.extension.pageTable.classObj,c=document.getElementById("planExamListPageTable"),b=a.params(c),d={"00":{}},e;
for(e in b.associatedPlanExamList)d[e]={};window.L.openCom("oDialogDiv")(window.L.getText("\u8bf7\u9009\u62e9\u8003\u8bd5"),"iframe:"+window.L._adminUrl+'/course/course.php?{"get" : {"a" : "getAssociatedCourseExamList"}, "post" : {"associatedCourseExamList" : \''+window.L.JSON.stringify(d)+'\', "examType" : "'+b.examType+'"}}',"auto","auto",[2,function(e,g,k){if(e&&"visible"===k.oDialogDivObj.find("> .scroll iframe").css("visibility")){var e=k.oDialogDivObj.find("> .scroll iframe").prop("contentWindow"),
g=e.document.getElementById("getAssociatedCourseExamListPageTable"),e=e.L.extension.pageTable.classObj.params(g),i;for(i in e.associatedCourseExamList)b.associatedPlanExamList[i]={},delete d[i];for(i in d)"00"!==i&&delete b.associatedPlanExamList[i];a.params(c,b,!0)}}])},formatDateObj:function(a,c){var b={minStr:"",maxStr:"",minInt:0,maxInt:0},a=$(a),c=$(c);if(b.minStr=$.trim(a.val()))b.minInt=b.minStr.split("-"),b.minInt=(new Date(b.minInt[0],b.minInt[1],b.minInt[2])).getTime();if(b.maxStr=$.trim(c.val()))b.maxInt=
b.maxStr.split("-"),b.maxInt=(new Date(b.maxInt[0],b.maxInt[1],b.maxInt[2])).getTime();if(b.minInt&&b.maxInt&&b.minInt>b.maxInt){var d;a.val(b.maxStr);c.val(d=b.minStr);b.minStr=b.maxStr;b.maxStr=d;d=b.maxInt;b.maxInt=b.minInt;b.minInt=d}return b},saveClickFun:function(){var a=window.L.extension.pageTable.classObj,c=this.formatDateObj("#p_begin_tm","#p_end_tm"),b={p_id:$("#p_id").val(),p_name:$.trim($("#p_name").val()),p_category:$.trim($("#p_category").attr("key")),p_begin_tm:c.minStr,p_end_tm:c.maxStr,
p_status:$("input[name=p_status]:checked").val(),frontCoverImg:$.trim($("#frontCoverImg").attr("fileUrl")),p_elective:$("input[name=p_elective]:checked").val(),p_pass_condition:$("input[name=p_pass_condition]:checked").val(),p_des:$("#p_des").val(),p_tagList:{},courseList:{}};if(""===b.p_name)return $("#p_name").focus(),window.L.openCom("tip")(window.L.getText("\u8ba1\u5212\u540d\u79f0\u4e0d\u80fd\u4e3a\u7a7a")),!1;if(""===b.p_category)return $("#p_category").focus(),window.L.openCom("tip")(window.L.getText("\u8ba1\u5212\u5206\u7c7b\u4e0d\u80fd\u4e3a\u7a7a")),
!1;var d=[];$("#allowIp > div").each(function(){var a=$("input",this),b=$.trim(a.eq(0).val()),c=$.trim(a.eq(1).val());if(!(""===b&&""===c)){if(addPlanObj.inputIpBlurCheckFun(a.get(0))&&addPlanObj.inputIpBlurCheckFun(a.get(1))){""===b?b="0.0.0.0":""===c&&(c="255.255.255.255");for(var a=b.split("."),e=c.split("."),f=0;4>f;++f)if(a[f]>e[f]){a=b;b=c;c=a;break}else if(a[f]<e[f])break}else return d=!1;d[d.length]=b+"-"+c}});if(d){b.allowIp=d.join(",");$("#tagList > span").each(function(){b.p_tagList[$(this).attr("tagid")]=
!0});var e=!0;$('#courseListBlock input[id=c_name][key!=""]').each(function(){var a=$(this).parents("#courseBlock").get(-1),d=$("td[name=studyDatePeriod] input",a),f=addPlanObj.formatDateObj(d.eq(0),d.eq(1));if(f.minInt&&(c.minInt&&f.minInt<c.minInt||c.maxInt&&f.minInt>c.maxInt))return e=!1,window.L.openCom("tip")(window.L.getText("\u65e5\u671f\u8303\u56f4\u6709\u8bef")),d.eq(0).focus(),!1;if(f.maxInt&&(c.minInt&&f.maxInt<c.minInt||c.maxInt&&f.maxInt>c.maxInt))return e=!1,window.L.openCom("tip")(window.L.getText("\u65e5\u671f\u8303\u56f4\u6709\u8bef")),
d.eq(1).focus(),!1;var h=" "+this.getAttribute("key");b.courseList[h]={c_pass_condition:$("input[name=courseBlockPassCondition_"+$.trim(h)+"]:checked").val(),opening_begin_tm:f.minStr,opening_end_tm:f.maxStr,c_elective:$("input[name=c_elective]",a).prop("checked")?1:0,c_isModifyProgress:$("input[name=c_isModifyProgress]",a).prop("checked")?1:0,courseCondition:[]};$("#timePeriod > div",a).each(function(a){var c=$("input:eq(0)",this).val(),d=$("input:eq(1)",this).val();if(c||d)b.courseList[h]["s"+(a+
1)+"_begin_tm"]=c||"00:00:00",b.courseList[h]["s"+(a+1)+"_end_tm"]=d||"23:59:59"});$(".whereCourse:parent",a).each(function(){$("> div",this).each(function(a){b.courseList[h].courseCondition[b.courseList[h].courseCondition.length]={c_id:$.trim(h),c_c_id:this.getAttribute("key"),c_condition:a?"AND":"OR"}})})});if(!e)return!1;b.associatedPlanGroupList=a.params(document.getElementById("planGroupListPageTable")).associatedPlanGroupList;b.associatedPlanUserList=a.params(document.getElementById("planUserListPageTable")).associatedPlanUserList;
b.associatedPlanExamList=a.params(document.getElementById("planExamListPageTable")).associatedPlanExamList;for(var f in b.associatedPlanExamList)b.associatedPlanExamList[f]=!0;window.L.openCom("tip")(window.L.getText("\u6b63\u5728\u4fdd\u5b58,\u8bf7\u7a0d\u540e..."),!1,!1,!0);$.post("?a=savePlan",b,function(a){"1"===a?(window.L.openCom("tip")(window.L.getText(b.p_id?"\u64cd\u4f5c\u6210\u529f,\u5373\u5c06\u8df3\u8f6c\u5230\u5217\u8868\u9875":"\u64cd\u4f5c\u6210\u529f,\u5373\u5c06\u5237\u65b0\u9875\u9762"),
null,!1,!0),addPlanObj.beforeUnloadTip.tipState=!1,window.setTimeout(function(){window.location.href=b.p_id?"?a=modfiyPlan":window.location.href},1500)):"0"===a?(addPlanObj.beforeUnloadTip.tipState=!1,window.L.openCom("tip")(window.L.getText("\u670d\u52a1\u7aef\u5224\u5b9a,\u60a8\u63d0\u4ea4\u7684\u6570\u636e\u65e0\u6548"))):(window.L.openCom("tip")(),window.L.openCom("oDialogDiv")(window.L.getText("\u64cd\u4f5c\u5931\u8d25:"),"text:"+a,"auto","auto",[1]))})}},beforeUnloadTip:function(a){if(arguments.callee.tipState)return a.originalEvent.returnValue=
""}};
$(function(){var a;a=$("#allowIp > div");1===a.length&&""===$.trim(a.find("input:eq(0)").val())&&""===$.trim(a.find("input:eq(1)").val())?$("input[name=allowIpRadio][value=0]").click():$("input[name=allowIpRadio][value=1]").click();window.L.openCom("upload")("frontCoverImgUpload",{onComplete:function(a){$("#frontCoverImg").attr({src:window.L._rootUrl+"/include/oFileManager/fileExtension.php?fileUrl="+a,fileUrl:a});document.getElementById("frontCoverImgProgress").childNodes[1].nodeValue=window.L.getText("\u4e0a\u4f20\u5c01\u9762\u56fe\u7247")},onProgress:function(a){document.getElementById("frontCoverImgProgress").childNodes[1].nodeValue=
a.percentage+"%"}},"gif;jpg;bmp;png"," ",65,18,{auto:!0,queueID:"  ",multi:!1,folder:"/frontCover"});window.L.openCom("wDate",{obj:document.getElementById("p_begin_tm"),params:{readOnly:!0}});window.L.openCom("wDate",{obj:document.getElementById("p_end_tm"),params:{readOnly:!0}});$(document).keyup(function(){addPlanObj.beforeUnloadTip.tipState=!0});$(window).bind("beforeunload",addPlanObj.beforeUnloadTip)});
window.L.strVar("L.extension.pageTable.callback.initLoadList[]",window.L.strVar("L.extension.pageTable.callback.afterLoadList[]",function(a,c){if("planExamListPageTable"===a.id)c.eachTbody(a,"*",2,function(a){switch(a.tdObj.innerHTML){case "030301":a.tdObj.innerHTML=window.L.getText("\u53ef\u7528");break;case "030302":a.tdObj.innerHTML=window.L.getText("\u7981\u7528");break;case "030303":a.tdObj.innerHTML=window.L.getText("\u7f16\u8f91");break;default:a.tdObj.innerHTML=window.L.getText("\u672a\u77e5")}});
else if("planGroupListPageTable"===a.id){var b=c.params(a);c.eachTbody(a,"*",2,function(a){var c=a.tdObj.innerHTML;a.tdObj.innerHTML='<a href="#" key="'+c+'" onclick="addPlanObj.changeCourseGroupListStateClickFun(this); return false;" title="'+window.L.getText("\u70b9\u51fb\u66f4\u6539")+'" >'+window.L.getText(b.associatedPlanGroupList[c].type?"\u5305\u542b":"\u6392\u9664")+"</a>"});c.eachTbody(a,"*",3,function(a){var c=a.tdObj.innerHTML;a.tdObj.innerHTML='<input key="'+c+'" type="checkbox" class="checkbox" '+
(b.associatedPlanGroupList[c].isIncludeSub?'checked="checked"':"")+' onclick="addPlanObj.changeCourseGroupListIncludeSubClickFun(this)" />'})}else"planUserListPageTable"===a.id&&(b=c.params(a),c.eachTbody(a,"*",2,function(a){var c=a.tdObj.innerHTML;a.tdObj.innerHTML='<a href="#" key="'+c+'" onclick="addPlanObj.changeCourseUserListStateClickFun(this); return false;" title="'+window.L.getText("\u70b9\u51fb\u66f4\u6539")+'" >'+window.L.getText(b.associatedPlanUserList[c].type?"\u5305\u542b":"\u6392\u9664")+
"</a>"}))}));