$(function(){$("#search").click(function(){$(this).attr("href","javascript:void(0)");var b=$('table[_pagetabledataset="admin_paper_manualMarkingCtl::manualMarkingPageProcess"]'),a=getSearchManualMarkingParam();window.L.extension.pageTable.classObj.params(b.get(0),a,!0)});$("#reset").click(function(){$(this).attr("href","javascript:void(0)");$("#exam_name").val("");$("#exam_category_name").html("\u8bf7\u9009\u62e9");$("#exam_category").val("");$("#create_tm_start").val("");$("#create_tm_end").val("")});
window.L.openCom("wDate",{obj:$("#create_tm_start").get(0),params:{readOnly:!0}});window.L.openCom("wDate",{obj:$("#create_tm_end").get(0),params:{readOnly:!0}});$("#selectManualMarkingSwitch").click(function(){var b="checked"==$(this).attr("checked")?!0:!1;$('input[id^="user_exam_"]').attr("checked",b)})});function examCategoryTreeShow(b,a,c){getTree({targetNameId:b,targetValueId:a,dataType:"exam_category",showRoot:c?c:!1})}
function getSearchManualMarkingParam(){var b={},a={create_tm_start:"",create_tm_end:""};b.exam_name=$("#exam_name").val();b.exam_category=$("#exam_category").val();a.create_tm_start=$("#create_tm_start").val();a.create_tm_end=$("#create_tm_end").val();b.dateParam=a;return b}
function markingByQuestion(b){var a="",a="";$(this).attr("href","javascript:void(0)");a=$(b).parents("tr").find('input[id^="user_exam_"]').val();a=window.L._adminUrl+"/paper/manualMarkingCtl.php?a=markingByQuestion&exam_id="+a;window.location.href=a}function markingByPerson(b){var a="",a="";$(this).attr("href","javascript:void(0)");a=$(b).parents("tr").find('input[id^="user_exam_"]').val();a=window.L._adminUrl+"/paper/manualMarkingCtl.php?a=markingByPerson&exam_id="+a;window.location.href=a};
