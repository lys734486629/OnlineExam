function paprInitPaprManage(){initResetArea({selection:"#papr_search_param_div",id:"papr_search_param_div"});window.L.openCom("wDate",{obj:$("#create_tm_start").get(0),params:{readOnly:!0}});window.L.openCom("wDate",{obj:$("#create_tm_end").get(0),params:{readOnly:!0}});window.L.openCom("oDialogDiv")}function paprResetSearchParams(){resetArea("papr_search_param_div");paprInitPaprManage()}
function paprSearchPaprList(){var a=paprGetSearchCondition(),c=$('table[_pagetabledataset="admin_paper_paperCtl::displayPaprList"]');window.L.extension.pageTable.classObj.params(c.get(0),a,!0)}
function paprGetSearchCondition(){return{papr_name:escape($.trim($("#papr_name").val())),papr_category:$("#papr_category").val(),papr_status:$("#papr_status").val(),papr_point:$("#papr_point").val(),papr_qsn_count:$("#papr_qsn_count").val(),create_tm_start:$("#create_tm_start").val(),create_tm_end:$("#create_tm_end").val(),tag_names:escape($.trim($("#tag_names").val()))}}
function paprModifyPaprStatus(a,c,b){var b=b?b:"",d=0,e={papr_status:{target_status:c,papr_ids:{}}},f="success",g="",h=!1;"selected"==a?($(":checkbox[name='papr_cb']:checked").each(function(a){d++;e.papr_status.papr_ids[a]=$(this).val();h=!0}),h||(f="failed",g=window.L.getText("\u8bf7\u81f3\u5c11\u9009\u62e9\u4e00\u5f20\u8bd5\u5377")),b=window.L.getText("\u8fd9")+d+window.L.getText("\u5f20\u8bd5\u5377")):(e.papr_status.papr_ids[0]=a,b="&nbsp;"+b+"&nbsp;");if("success"==f){a=window.L.getText("\u786e\u8ba4\u5220\u9664")+
b+"\uff1f";switch(c){case "020102":a=window.L.getText("\u786e\u8ba4\u7981\u7528")+b+"\uff1f";break;case "020101":a=window.L.getText("\u786e\u8ba4\u53ef\u7528")+b+"\uff1f"}oDialogDiv(window.L.getText("\u4fee\u6539\u8bd5\u5377\u72b6\u6001"),"text:<div>"+a+"</div>","400px","auto",[2,function(a){if(a){var a=window.L._adminUrl+"/paper/paperCtl.php?a=modifyPaprStatus",b="modify_info="+encodeURIComponent(L.JSON.stringify(e));$.ajax({type:"POST",async:false,url:a,data:b,dataType:"json",success:function(a){if(a.res==
"success"){a=window.L.getText("\u8bd5\u5377\u5220\u9664\u6210\u529f");switch(c){case "020102":a=window.L.getText("\u8bd5\u5377\u7981\u7528\u6210\u529f");break;case "020101":a=window.L.getText("\u8bd5\u5377\u53ef\u7528\u6210\u529f")}oDialogDivInfo(a);var b=$('table[_pagetabledataset="admin_paper_paperCtl::displayPaprList"]'),a=L.extension.pageTable.classObj,b=b.get(0);a.params(b,null,true)}else oDialogDivInfo(a.info)},error:function(){}})}}])}else oDialogDivInfo(g)}
function paprUpdatePapr(a){var c=$('table[_pagetabledataset="admin_paper_paperCtl::displayPaprList"]').attr("_pagetablecurpage"),b=$('table[_pagetabledataset="admin_paper_paperCtl::displayPaprList"]').attr("_pagetablepagesize"),d=$('table[_pagetabledataset="admin_paper_paperCtl::displayPaprList"]').attr("_pagetableparams");$("#search_condition").val(d);$("#cur_page").val(c);$("#page_size").val(b);$("#update_papr_id").val(a);$("form#update_papr_form").submit();return!1}
function paprExportPaper(a){"020303"==$("#papr_list_type_"+a).val()?oDialogDivInfo(window.L.getText("\u968f\u673a\u51fa\u5377\u8bd5\u5377\u65e0\u6cd5\u5bfc\u51fa")):oDialogDiv(window.L.getText("\u5bfc\u51fa\u8bd5\u5377"),'text:<div style="width:380px;" align="center"><input name="papr_exp_type" id="papr_exp_type_0" type="radio" value="0" checked="checked" /><label for="papr_exp_type_0">'+window.L.getText("\u4e0d\u5e26\u7b54\u6848\u5bfc\u51fa")+'</label><input name="papr_exp_type" id="papr_exp_type_1" type="radio" value="1" /><label for="papr_exp_type_1">'+
window.L.getText("\u5e26\u7b54\u6848\u5bfc\u51fa")+"</label></div>","400px","auto",[["\u786e\u5b9a","\u53d6\u6d88",""],function(c){!0!==c&&1!=c&&(c="checked"==$("#papr_exp_type_0").attr("checked")?0:1,window.open(window.L._adminUrl+"/paper/paperCtl.php?a=exportPaper&id="+a+"&is_include_answer="+c))}])};