<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>choosenum</title>
  <script language="JavaScript">
  function checkForm(){
  
  var a1=document.getElementById("choicepoint").value;
  var a2=document.getElementById("choicenum").value;
  var b1=document.getElementById("blankpoint").value;
  var b2=document.getElementById("blanknum").value;
  var c1=document.getElementById("opinionpoint").value;
  var c2=document.getElementById("opinionnum").value;
  var d1=document.getElementById("simplepoint").value;
  var d2=document.getElementById("simplenum").value;
  var e1=document.getElementById("discusspoint").value;
  var e2=document.getElementById("discussnum").value;
  var papername=document.getElementById("papername").value;
  var form=document.form1;
  
  //判断单选按钮是否为空
  if(form.test[0].checked==false&form.test[1].checked==false)
{
alert("请选择输入方式");
return false;
}
if((a1!=""&a2=="")|(a1==""&a2!="")){alert("分值和数目必须配对");return false;}
if((b1!=""&b2=="")|(b1==""&b2!="")){alert("分值和数目必须配对");return false;}
if((c1!=""&c2=="")|(c1==""&c2!="")){alert("分值和数目必须配对");return false;}
if((d1!=""&d2=="")|(d1==""&d2!="")){alert("分值和数目必须配对");return false;}
if((e1!=""&e2=="")|(e1==""&e2!="")){alert("分值和数目必须配对");return false;}

  //如果为输入题库则至少要选一题
  if(form.test[0].checked==true){
    if(a1==""&a2==""&b1==""&b2==""&c1==""&c2==""&d1==""&d2==""&e1==""&e2==""){
    alert("请至少选择一个题目类型");return false;
    }
    }
   
   //如果为输入整套试卷则判断分数是否为100
   if(form.test[1].checked==true){
   if(papername==""){alert("请输入试卷题目");return false;}
   if(papername!=""&(form.model[0].checked==false & form.model[1].checked==false)){alert("请选择试题模式");return false;}
   if(a1==""&a2==""){a1=0;a2=0}
   if(b1==""&b2==""){b1=0;b2=0}
   if(c1==""&c2==""){c1=0;c2=0}
   if(d1==""&d2==""){d1=0;d2=0}
   if(e1==""&e2==""){e1=0;e2=0}
   var total=parseInt(a1)*parseInt(a2)+parseInt(b1)*parseInt(b2)+parseInt(c1)*parseInt(c2)+parseInt(d1)*parseInt(d2)+parseInt(e1)*parseInt(e2);
   if(total!=parseInt(100)){alert("请确定试卷的总分为100");return false;}
   }


  
  
  }
  
  </script>
    

  </head>
  
  <body> 
  <center>
  请选择题目类型、对应分值和题目数量 
  <form name="form1" action="./servlet/Inputservlet" method="POST" OnSubmit="return checkForm()">
  <table border=1>
    <tr>
    <td>题型</td>
    <td>分值</td>
    <td>数量</td>
    </tr>
    <tr>
    <td>选择题</td>
    <td><input type="text" id="choicepoint" name="choicepoint" maxlength=1></td>
    <td><input type="text" id="choicenum" name="choicenum" maxlength=2></td>
    </tr> 
    <tr>
    <td>填空题</td>
    <td><input type="text" id="blankpoint" name="blankpoint" maxlength=1></td>
    <td><input type="text" id="blanknum"  name="blanknum" maxlength=2></td>
    </tr>
    <tr>
    <td>判断题</td>
    <td><input type="text" id="opinionpoint"  name="opinionpoint" maxlength=1></td>
    <td><input type="text" id="opinionnum" name="opinionnum" maxlength=2></td>
    </tr>
    <tr>
    <td>简答题</td>
    <td><input type="text" id="simplepoint" name="simplepoint" maxlength=1></td>
    <td><input type="text" id="simplenum" name="simplenum" maxlength=1></td>
    </tr>
    <tr>
    <td>分析题</td>
    <td><input type="text" id="discusspoint"  name="discusspoint" maxlength=1></td>
    <td><input type="text" id="discussnum"  name="discussnum" maxlength=1></td>
    </tr>
    <tr>
    <td>&nbsp</td>
    <td><input type="radio" name="test"  value="single">输入题库</td>
    <td>&nbsp</td>
    </tr>
    <tr>
    <td>&nbsp</td>
    <td><input type="radio" name="test"  value="multiple">输入整套试题</td>
    <td>试卷id(数字)：<input type="text" id="papername" name="papername"><br>
                     试卷模式:<input type="radio" name="model" value="1">模式一
                <input type="radio" name="model" value="2">模式二
    </td>
    </tr>
  </table>
  <input type="submit" name="submit" value="完成" align="right"/>
  <input type="reset" name="reset" value="重置" >
  </form></center>
  </body>
</html>
