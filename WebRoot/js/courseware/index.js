var indexObj={tabClickFun:function(a,b){$("li",a.parentNode).prop("id","");a.id="player_bottom_menu_btn2";$(".tab_content").hide().eq(b).show()},delNote:function(a){var b=window.L.openCom("oDialogDiv")(window.L.getText("\u60a8\u786e\u5b9a\u5220\u9664\u5417?"),"","auto","auto",[[window.L.getText("\u786e\u5b9a"),window.L.getText("\u53d6\u6d88")],function(b){0===b&&(b={coursewareId:$(a).attr("key")},$.post(window.L._rootUrl+"/user.php?a=delNote",b,function(a){"1"===a?(indexObj.hideReplyNote(),$("#notePreview").html(""),
window.L.openCom("tip")(window.L.getText("\u64cd\u4f5c\u6210\u529f"))):window.L.openCom("tip")(window.L.getText("\u64cd\u4f5c\u5931\u8d25,\u8bf7\u8054\u7cfb\u7ba1\u7406\u5458"))}))}]);$("> .title",oDialogDiv.callBackList[b].oDialogDivObj).css("backgroundColor","#C8DEF2")},showReplyNote:function(){var a=$("#noteOperat > a");a.eq(0).children("font").html(window.L.getText("\u91cd\u7f6e"));a.eq(1).show();$("#noteTextarea").val(window.L.strTranscoding.htmlToText($("#notePreview").hide().html())).parent().show();
setTimeout(function(){indexObj.keyupNote(document.getElementById("noteTextarea"))},0)},hideReplyNote:function(){var a=$("#noteOperat > a");a.eq(0).children("font").html(window.L.getText("\u7f16\u8f91"));a.eq(1).hide();$("#noteTextarea").val("").keyup().parent().hide();$("#notePreview").show()},keyupNote:function(a){var b=$(a.parentNode);$(a).css("height",50).css("height",a.scrollHeight);b.css("height",a.scrollHeight)},submitNote:function(a){var b={noteContent:$("#noteTextarea").val()};window.L.openCom("tip")(window.L.getText("\u6b63\u5728\u53d1\u9001,\u8bf7\u7a0d\u540e..."));
b.coursewareId=$(a).attr("key");$.post(window.L._rootUrl+"/user.php?a=sendNote",b,function(a){"1"===a?(window.L.openCom("tip")(window.L.getText("\u53d1\u9001\u6210\u529f")),$("#notePreview").html(window.L.strTranscoding.textToHtml(b.noteContent)),indexObj.hideReplyNote()):window.L.openCom("tip")(window.L.getText("\u64cd\u4f5c\u5931\u8d25,\u8bf7\u8054\u7cfb\u7ba1\u7406\u5458"))})},imgDrag:function(a,b){a=$(a);b=$(b);arguments.callee.mouseDragObj||(arguments.callee.mouseDragObj=new mouseDrag);arguments.callee.mouseDragObj.init(a.get(0),
{mouseMoveFn:function(a){b.scrollTop(b.scrollTop()-a.nH);b.scrollLeft(b.scrollLeft()-a.nW)}});a.bind("DOMMouseScroll mousewheel",{},function(a){var b=$(this),e=b.height()*((-a.originalEvent.detail||a.originalEvent.wheelDelta)>0?1.2:0.8);a.preventDefault();b.height(e>300?e:300)})},mouseScroll:function(a,b,c,d,e){var j,f,i,g,h,a=$(a),b=$(b),c=$(c);f=a.prop("clientHeight");i=b.outerHeight(!0);d||(d=0);e=f-c.height()-(e||0);g=(i-f)/(e-d);if(1>(h=f/g/3))h=1;if(i<=f)return c.hide(),!1;this.mouseScrollFun=
function(a){a.preventDefault();j=(0<(-a.originalEvent.detail||a.originalEvent.wheelDelta)?-1:1)*h;a.data.originalThis.mainContentFun(j)};this.mouseDragFun=function(a){a.fn.originalThis.mainContentFun(a.nH)};this.mainContentFun=function(a){a=parseInt("auto"===c.css("top")?d:c.css("top"))+a;a<d?a=d:a>e&&(a=e);c.css("top",a);b.css("top",(d-a)*g)};arguments.callee.mouseDragObj||(arguments.callee.mouseDragObj=new mouseDrag);arguments.callee.mouseDragObj.init(c.get(0),{mouseMoveFn:this.mouseDragFun,originalThis:this});
a.bind("DOMMouseScroll mousewheel",{originalThis:this},this.mouseScrollFun)},slideTabFun:function(a,b){var c=a.getAttribute("progressMemoryPoint");$(a).parents("[name=imgDragLocate]").find("[name=imgDragBlock] img").prop("src",window.L._rootUrl+indexConfigObj.imgSrcRootUrl+b);c&&(c*=indexConfigObj.w_length/$("[progressMemoryPoint]").length,indexObj.progressMemory(c))},coursewareListTab:function(a){var a=$("> span",a),b=$("[coursewareListTab]");"icon_nail"===a.prop("className")?(b.eq(0).css("position",
"static"),b.eq(1).hide(),a.prop("className","icon_del2")):(b.eq(0).css("position","absolute"),b.eq(1).show(),a.prop("className","icon_nail"))},locationCourseware:function(a,b){if("_"===b)window.L.openCom("tip")(window.L.getText("\u79ef\u5206\u4e0d\u8db3,\u65e0\u6cd5\u5b66\u4e60\u8be5\u8bfe\u4ef6"));else if("0"===b)$(a).attr("openHref")!==window.location.href&&window.open($(a).attr("openHref"),"openCourseWare");else{var c=window.L.openCom("oDialogDiv")(window.L.getText("\u5b66\u4e60\u8be5\u8bfe\u4ef6\u9700\u8981\u6263\u9664{s}\u79ef\u5206,\u60a8\u786e\u5b9a\u5417?").replace("{s}",
b),"","auto","auto",[[window.L.getText("\u786e\u5b9a"),window.L.getText("\u53d6\u6d88")],function(b){0===b&&window.open($(a).attr("openHref"),"openCourseWare")}]);$("> .title",oDialogDiv.callBackList[c].oDialogDivObj).css("backgroundColor","#C8DEF2")}},progressMemory:function(a){if(!isNaN(a)&&(a=Number(a.toFixed(2)))<=indexConfigObj.w_length){var b={};b["coursewareProgressMemory["+indexConfigObj.coursewareId+"]"]=a;b["coursewareProgressMemoryUserName["+indexConfigObj.coursewareId+"]"]=indexConfigObj.userName;
window.L.cookie.set(b,864E5,"");a>indexConfigObj.uc_length&&(indexConfigObj.uc_length=a)}},saveProgress:function(a,b){$.ajax({type:"POST",url:"?a=saveProgress",data:indexConfigObj,async:Boolean(a),success:function(c){a&&!b&&window.L.openCom("tip")(window.L.getText("1"===c?"\u4fdd\u5b58\u6210\u529f":"\u64cd\u4f5c\u5931\u8d25,\u8bf7\u8054\u7cfb\u7ba1\u7406\u5458"))}})}};window.L.openCom("oDialogDiv");$("[coursewareListTab]:eq(0)").css("position","static");
$("[name=mainScrollBlock]").each(function(){new indexObj.mouseScroll(this,$("[name=contentScrollBlock]",this),$("[name=scrollBarBlock]",this),8)});$("[coursewareListTab]:eq(0)").css("position","absolute");$("[name=imgDragBlock]").each(function(){indexObj.imgDrag(this.getElementsByTagName("img")[0],this)});$("[name=contentScrollBlock] > div:first-child > a:not([progressMemoryPoint])").click();
(function(){if("swf"===indexConfigObj.coursewareType||"none"===indexConfigObj.coursewareType){if("swf"===indexConfigObj.coursewareType){var a=/^\w+:\/\/.+$/.test(window.L.cookie.get("coursewareMediaU"))?window.L.cookie.get("coursewareMediaU"):"?a=getMediaData&u="+window.L.cookie.get("coursewareMediaU");document.getElementById("playerBlock").innerHTML='<embed width="720" height="350" wmode="opaque" quality="high" allowscriptaccess="always" allowfullscreen="true" src="'+a+'" id="player_id" type="application/x-shockwave-flash">';
window.L.cookie.del("coursewareMediaU",!1,"")}setInterval(function(){null==arguments.callee.count&&(arguments.callee.count=indexConfigObj.uc_length);indexObj.progressMemory(++arguments.callee.count)},1E3)}else if("flv"===indexConfigObj.coursewareType||"youku"===indexConfigObj.coursewareType||"mp3"===indexConfigObj.coursewareType)$(function(){var a=new ofPlayerClass({vars:"AutoPlay=true&cycle=true&BrokenPlay=true&Ctn=true&LinkNum=0&Decoders=getYoukuVideo.swf&JSenable=true&SkinURL=skin/blackBlueSingle.swf",
url:window.L._rootUrl+"/include/oFileManager/include/player/ofplayer.swf",obj:"playerBlock",height:350});a.$(function(){a.stopIntervalFn();setTimeout(function(){var b="type:"+indexConfigObj.coursewareType,c=0,d=window.L.cookie.get("coursewareProgressMemory["+indexConfigObj.coursewareId+"]"),g=window.L.cookie.get("coursewareProgressMemoryUserName["+indexConfigObj.coursewareId+"]"),h=window.L.cookie.get("user[username]");"0"===indexConfigObj.auxiliaryConfig.c_isModifyProgress&&a.jsOfPlayerFn("adjust",
"progress","prop","");d&&d<indexConfigObj.w_length&&g===h?c=1E3*d:indexConfigObj.uc_length<indexConfigObj.w_length-10&&(c=1E3*indexConfigObj.uc_length);b+=";start:"+c+";url:";b="youku"===indexConfigObj.coursewareType||/^\w+:\/\/.+$/.test(window.L.cookie.get("coursewareMediaU"))?b+window.L.cookie.get("coursewareMediaU"):b+(window.L._rootUrl+"/courseware.php?a=getMediaData&u="+window.L.cookie.get("coursewareMediaU"));a.jsOfPlayerFn("reload",b);window.L.cookie.del("coursewareMediaU",!1,"");setInterval(function(){var b=
a.jsOfPlayerFn("getinfo","playback","position")/1E3;indexObj.progressMemory(b)},1E3)},500)})});else if("img"===indexConfigObj.coursewareType){var b=$("[progressMemoryPoint]"),c=window.L.cookie.get("coursewareProgressMemoryUserName["+indexConfigObj.coursewareId+"]"),d=window.L.cookie.get("user[username]"),a=window.L.cookie.get("coursewareProgressMemory["+indexConfigObj.coursewareId+"]")||indexConfigObj.uc_length;b.length&&c===d&&b.eq(indexConfigObj.w_length?Math.floor(a*b.length/indexConfigObj.w_length)-
1:0).click()}else"pdf"===indexConfigObj.coursewareType&&(window.onDocumentLoaded=function(){window.onCurrentPageChanged=function(a){indexObj.progressMemory(60*a)}},a=window.L.cookie.get("coursewareProgressMemory["+indexConfigObj.coursewareId+"]")||indexConfigObj.uc_length,c=window.L.cookie.get("coursewareProgressMemoryUserName["+indexConfigObj.coursewareId+"]"),d=window.L.cookie.get("user[username]"),c!==d&&(a=0),$("#playerBlock").html('<object width="100%" height="100%" data="'+window.L._rootUrl+
'/common/officeToSwf/FlexPaperViewer.swf" type="application/x-shockwave-flash" '+($.browser.msie&&'classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"')+'><param name="movie" value="'+window.L._rootUrl+'/common/officeToSwf/FlexPaperViewer.swf"><param name="allowfullscreen" value="true"><param name="allowscriptaccess" value="always"><param name="quality" value="high"><param name="allowFullScreenInteractive" value="true"><param name="wmode" value="Opaque"><param name="flashvars" value="SwfFile='+window.L._rootUrl+
"/courseware.php?a=getMediaData%26u="+window.L.cookie.get("coursewareMediaU")+"&amp;Scale=1&amp;StartAtPage="+a/60+'&amp;ViewModeToolsVisible=true&amp;ZoomToolsVisible=true&amp;NavToolsVisible=true&amp;CursorToolsVisible=true&amp;SearchToolsVisible=true&amp;localeChain=zh_CN"></object>'));$(window).bind("beforeunload",function(a){indexObj.saveProgress(!1);if("block"===$("#noteTextarea").parent().css("display"))return a.originalEvent.returnValue=window.L.getText("\u60a8\u7684\u7b14\u8bb0\u5904\u4e8e\u7f16\u8f91\u72b6\u6001,\u5173\u95ed\u540e\u4efb\u4f55\u4fee\u6539\u7684\u5185\u5bb9\u5c06\u4e22\u5931")});
window.setTimeout(function(){indexObj.saveProgress(!0,!0);window.setTimeout(arguments.callee,12E4)},12E4)})();
