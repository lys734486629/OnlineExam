var registrationUsersObj={getGroupListTreeClickFun:function(a){getTree({targetId:a.id,callbackFn:function(b,c){$(a).attr("key",b).html(c)},dataType:"group",isExpand:!1,showRoot:!1,isFront:!0})},submit:function(){var a={username:$("#username").val(),password:$("#password").val(),repassword:$("#repassword").val(),question1:$.trim($("#question1").val()),answer1:$("#answer1").val(),question2:$.trim($("#question2").val()),answer2:$("#answer2").val(),real_name:$.trim($("#real_name").val()),gender:$.trim($("input[name=gender]:checked").val()),
birthday:$.trim($("#birthday").val()),group_id:$.trim($("#group_id").attr("key")),email:$.trim($("#email").val()),idcard:$.trim($("#idcard").val()),tel:$.trim($("#tel").val()),mobiletel:$.trim($("#mobiletel").val()),validatecode:$.trim($("#validatecode").val())};if(""===a.username||""===a.password||""===a.repassword||""===a.question1||""===a.answer1||""===a.group_id||""===a.email||""===a.validatecode)return window.L.openCom("tip")(window.L.getText('\u4ee5"*"\u7ed3\u5c3e\u7684\u5747\u4e0d\u80fd\u4e3a\u7a7a')),
!1;if(/^[a-zA-z0-9\u4E00-\u9FA5]*$/.test(a.username)){if(10<a.username.length)return window.L.openCom("tip")(window.L.getText("\u7528\u6237\u540d\u957f\u5ea6\u8bf7\u4fdd\u6301\u5728\u5341\u4e2a\u5b57\u7b26\u4ee5\u5185")),!1;if(""!==a.question2&&""===a.answer2)return window.L.openCom("tip")(window.L.getText('"\u7b54\u6848\u4e8c"\u4e0d\u80fd\u4e3a\u7a7a')),!1;if(a.password!==a.repassword)return window.L.openCom("tip")(window.L.getText("\u4e24\u6b21\u5bc6\u7801\u4e0d\u540c")),!1;if(6>a.password.length)return window.L.openCom("tip")(window.L.getText("\u5bc6\u7801\u8bf7\u5927\u4e8e6\u4f4d")),
!1;if(/[a-z0-9_-]{1,}@[a-z0-9_-]{1,}\.[a-z0-9_-]{1,}/i.test(a.email))window.L.openCom("tip")(window.L.getText("\u6b63\u5728\u63d0\u4ea4\u8bf7\u7a0d\u540e")),$.post("?a=registrationUsers",a,function(a){if("5"===a)window.L.openCom("tip")(window.L.getText("\u6ce8\u518c\u4eba\u6570\u5df2\u8fbe\u5230\u6700\u5927\u503c"));else if("4"===a)window.L.openCom("tip")(window.L.getText("\u9a8c\u8bc1\u7801\u4e0d\u6b63\u786e"));else if("3"===a)window.L.openCom("tip")(window.L.getText("\u7528\u6237\u540d\u5df2\u88ab\u6ce8\u518c"));
else if("2"===a)window.L.openCom("tip")(window.L.getText("\u90ae\u7bb1\u5df2\u88ab\u6ce8\u518c"));else return window.L.openCom("tip")(window.L.getText("\u6ce8\u518c\u6210\u529f")),setTimeout(window.location.href=window.L._rootUrl+"/index.php",3E3),!1;$("#validatecode").val("");$("#captchaImg").click()});else return window.L.openCom("tip")(window.L.getText("\u90ae\u7bb1\u683c\u5f0f\u4e0d\u6b63\u786e")),!1}else return window.L.openCom("tip")(window.L.getText('"\u7528\u6237\u540d"\u4e0d\u80fd\u5305\u542b\u7279\u6b8a\u5b57\u7b26')),
!1}};
