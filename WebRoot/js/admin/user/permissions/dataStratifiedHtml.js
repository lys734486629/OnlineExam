function \u00e6(b,f,g,h,d){var c="dataStratifiedPermissions"+(new Date).getTime(),a=$(b||'<input class="input3 auto_width" />').prop("readonly",!0);d?$(function(){$("#"+d).html(a)}):(document.write("<span id="+c+' style="display:none;"></span>'),$("#"+c).after(a).remove());""===a.prop("id")?a.prop("id",c):c=a.prop("id");a.attr("key",f||"");a.attr("valKey","INPUT"===a.prop("tagName")?"val":"text");a[a.attr("valKey")](window.L.strTranscoding.htmlToText(g)||a.attr("defaultValue"));a.click(function(){var b=
a.attr("key").split(",");getTree({targetId:c,treeMark:c,callbackFn:function(b){var c=[],d=[],e;for(e in b){c[e]=b[e].id;d[e]=b[e].name}a.attr("key",c.join(","));a[a.attr("valKey")](d.join(" , ")||a.attr("defaultValue"))},dataType:"group",isCheckBox:true,isExpand:false,showRoot:false,expandLevel:2,checkedId:b,chkboxType:{Y:"",N:""},enableCheckedId:h})});b=function(){window.L.cookie.set({dataStratifiedKey:a.attr("key")})};$(document).ajaxSend(b);$("form").submit(b)};