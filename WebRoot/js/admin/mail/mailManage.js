var mailObj={reset:function(){$("input[type=text]").val("")},search:function(){var c=$("#title").val(),a=$("#startTime").val(),b=$("#endTime").val();if(""===c&&""===a&&""===b)return!1;var c={title:c,startTime:a,endTime:b},a=window.L.extension.pageTable.classObj,b=document.getElementById("mailListPageTable"),d=a.params(b);d.searchData=c;a.params(b,d,!0)},mailDetail:function(c){if(window.L.openCom("oDialogDiv")){var a=window.L._adminUrl+"/mail/mserverCtl.php?";ALERT_DIV_MARK=oDialogDiv(window.L.getText("\u90ae\u4ef6\u8be6\u7ec6"),
"iframe:"+a+"{'get':{'a':'mailDetail'}, 'post' : {'mail_id':'"+c+"'}}","1000px","400px",[1],null,!0)}},delMailIdClickFun:function(){var c=window.L.extension.pageTable.classObj,a=document.getElementById("mailListPageTable"),b={delMailId:[]};c.eachTbody(a,"*",0,function(a){$("input:checked",a.tdObj).each(function(){b.delMailId[b.delMailId.length]=$(this).attr("key")})});b.delMailId.length?window.L.openCom("oDialogDiv")("\u786e\u5b9a\u5220\u9664\u9009\u4e2d\u7684\u6570\u636e\u5417?","","auto","auto",
[2,function(d){d&&$.post("?a=delMailList",b,function(){c.params(a,null,!0)})}]):window.L.openCom("tip")(window.L.getText("\u8bf7\u9009\u62e9\u5220\u9664\u6570\u636e\u7684\u590d\u9009\u6846"))}};$(function(){window.L.openCom("wDate",{obj:document.getElementById("startTime"),params:{readOnly:!0}});window.L.openCom("wDate",{obj:document.getElementById("endTime"),params:{readOnly:!0}})});