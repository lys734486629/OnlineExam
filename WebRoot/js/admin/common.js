var img_quick_upload_dir="/pictures/..quickUpload",media_quick_upload_dir="/media/..quickUpload",attachment_quick_upload_dir="/attachment/..quickUpload",img_browse_upload_dir="/pictures",media_browse_upload_dir="/media",attachment_browse_upload_dir="/attachment";function validPositive(a){var b=!1;/^[0-9]+(\.[0-9]+){0,1}$/.test(a)&&(b=!0);return b}function validEmail(a){var b=!1;/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(a)&&(b=!0);return b}
function validPositiveInt(a){var b=!1;/^\d+$/.test(a)&&(b=!0);return b}function validIp(a){var b=!1;/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])(\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])){3}$/.test(a)&&(b=!0);return b}
function loadFunctionBar(a){$("."+(a?a:"table1")+" tbody tr").hover(function(){var a=$("td:last > .action_toolbar",this);a.length&&a.css("right",-5).appendTo($('<div style="position:relative;"></div>').appendTo(a.parent()));$(".action_toolbar",this).show().animate({marginLeft:"8px"},{queue:!1,duration:200});$(this).addClass("highlight2")},function(){$(".action_toolbar",this).hide().animate({marginLeft:"10px"},{queue:!1,duration:200});$(this).removeClass("highlight2")})}
function checkAllCheckBox(a,b){switch(typeof b){case "boolean":b?$("input[name='"+a+"']").attr("checked","checked"):$("input[name='"+a+"']").removeAttr("checked");break;case "string":document.getElementById(b).checked?$("input[name='"+a+"']").attr("checked","checked"):$("input[name='"+a+"']").removeAttr("checked");break;case "object":b.checked?$("input[name='"+a+"']").attr("checked","checked"):$("input[name='"+a+"']").removeAttr("checked")}}
function checkToggleCheckBox(a){"checked"==$("#"+a).attr("checked")?$("#"+a).removeAttr("checked"):$("#"+a).attr("checked","checked")}function formatTnToHis(a,b){var c="00",d="00",e="00";switch(b){case "m":c=Math.floor(a/60);d=Math.floor(a%60);e=Math.round(60*(a%1));break;case "h":c=Math.floor(a),d=Math.round(60*(a%1))}return(10>c&&"00"!==c?"0"+c:c)+":"+(10>d&&"00"!==d?"0"+d:d)+":"+(10>e&&"00"!==e?"0"+e:e)}
function oDialogDivInfo(a,b,c,d){var d=d?d:!1,e=window.L.openCom("tip");!1===c&&(e.lock=c);e(a,b,d);!0===c&&(e.lock=c)}var ALERT_DIV_MARK="";function alertCloseAlertDiv(){oDialogDiv.dialogClose(ALERT_DIV_MARK);ALERT_DIV_MARK=""}var RESET_AREA_PARAMS={};
function initResetArea(a){var b={selection:"",id:(new Date).getTime(),is_keep:!1},a=$.extend({},b,a);a.is_keep?null==RESET_AREA_PARAMS[a.id]&&(RESET_AREA_PARAMS[a.id]={selection:a.selection,inner_html:$(a.selection).html()}):RESET_AREA_PARAMS[a.id]={selection:a.selection,inner_html:$(a.selection).html()};return a.id}function resetArea(a){a=RESET_AREA_PARAMS[a];$(a.selection).html(a.inner_html)}DISABLE_BTN_LIST={};
function disableBtn(a){DISABLE_BTN_LIST[a]={onclick:$("#"+a).attr("onclick")};$("#"+a).removeAttr("href")}function enableBtn(a){$("#"+a).attr("href","javascript:void(0)")};
