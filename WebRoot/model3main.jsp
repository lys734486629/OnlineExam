<%@ page language="java" import="java.util.*,javabean.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link type="text/css" rel="stylesheet" href="style/paper/main.css" /><link type="text/css" rel="stylesheet" href="style/paper/layout.css" /><link type="text/css" rel="stylesheet" href="style/login_style.css" /><script language="javascript" charset="UTF-8" src="js/jquery.js" ></script><script language="javascript" charset="UTF-8" src="include/Of/LanguagePacks/L.js"></script>
  
    <title>My JSP 'model3main.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%!String ques;%>
<%!String a,b,c,d; %>
<%!String quesid;%>
<%!int choicenum=5,blanknum=5,opinionnum=5; %>
<%
 ArrayList<SubjectVO> queslist=(ArrayList<SubjectVO>)session.getAttribute("queslist");
 
 System.out.print(queslist.size());
 SubjectVO fs=new SubjectVO();
 int i=0,j=0,m=0,n=0,k=0,l=0;
 Random r=new Random();
 i=r.nextInt(queslist.size());
 
 //System.out.print("\n"+i);
 
  fs=queslist.get(i);
  String sub;
  String[] subject;
  
  
  sub=fs.getQuestion();
  quesid=fs.getSubId();
  System.out.print(quesid);
  sub.replaceAll(" ","");
  subject=sub.split("\\|");    //根据分隔符分割字符串
  ques=subject[0].replaceAll(" ", "");   //去掉多余空格
  //System.out.print("\n"+ques);
					            a=subject[1].replaceAll(" ", "");
					            //System.out.print("\n"+a);
					            b=subject[2].replaceAll(" ", "");
					            c=subject[3].replaceAll(" ", "");
					            d=subject[4].replaceAll(" ", "");
					            
 %>
<script type="text/javascript">
var xmlHttp=false;

 var anum="<%=choicenum%>";
 var bnum="<%=blanknum%>";
 var cnum="<%=opinionnum%>";
 
 var firstid="<%=session.getAttribute("firstid")%>";

 //var question;
//var table=document.getElementById("area");
//var xmlHttp=false;
//var  question;
var count=1;
  var ques="",answer="",question="",subject_id="",rightnum="",point="";
  function createXMLHttpRequest()
 {
    if(window.ActiveXObject)
    {
      try{
        xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
      }
      catch(e){
        try{
           xmlHttp=new ActiveXObject("Miscrosolf.XMLHTTP");
        }
        catch(ee){
           xmlHttp=false;
        }
      }
    }
    else if(window.XMLHttpRequest)
    {
     try{
       xmlHttp=new XMLHttpRequest();
     }
     catch(e){
       xmlHttp=false;
     }
    }
 
 }
 
function go(str)
{
 var choice=parseInt(anum);
 var blank=parseInt(bnum);
 var opinion=parseInt(cnum);
 
 var button2=document.getElementById("next");
 var button3=document.getElementById("done");
 button3.disabled=true;
 
 var table=document.getElementById("table1");
 var area=document.getElementById("area");   //ques
 var area1=document.getElementById("area1");  //a
 var area2=document.getElementById("area2");
 var area3=document.getElementById("area3");
 var area4=document.getElementById("area4");//d
 var accuracy=document.getElementById("info");//info
 //var fill=document.getElementById("blank");
 
 if(document.uniqueID) {   
    //IE浏览器分支   
    var radioa=document.createElement("<input type='radio' name='select' value='1' id='ra' >");//单选
    var radiob=document.createElement("<input type='radio' name='select' value='2' id='rb'>");
    var radioc=document.createElement("<input type='radio' name='select' value='3' id='rc'>");
    var radiod=document.createElement("<input type='radio' name='select' value='4' id='rd'>");
    var radio1=document.createElement("<input type='radio' name='judge' value='1' id='op1' >");//判断
    var radio0=document.createElement("<input type='radio' name='judge' value='0' id='op0'>");
    var fill=document.createElement("<input type='text' name='fill' id='fill'>");
      
} else {   
    //非IE浏览器分支   
   var radioa=document.createElement("input");
       radioa.type="radio";
       radioa.name="select";
       radioa.value="1";
       radioa.id="ra";
     
    var radiob=document.createElement("input");
       radiob.type="radio";
       radiob.name="select";
       radiob.value="2";
       radiob.id="rb";
    var radioc=document.createElement("input");
       radioc.type="radio";
       radioc.name="select";
       radioc.value="3";
       radioc.id="rc";
    var radiod=document.createElement("input");
       radiod.type="radio";
       radiod.name="select";
       radiod.value="4";
       radiod.id="rd";
    var radio1=document.createElement("input");
       radio1.type="radio";
       radio1.name="judge";
       radio1.value="1";
       radio1.id="op1";
    var radio0=document.createElement("input");
       radio0.type="radio";
       radio0.name="judge";
       radio0.value="0";
       radio0.id="op0";
    var fill=document.createElement("input");
       fill.type="text";
       fill.name="fill";
       fill.id="fill";
}

 if(str=="first") //onload
 {          
  answer="1";
  first();
 } 
 if(str=="done")
 {
  //location.href="function.jsp";
  alert("模式三系统自动评分:      "+"<%=session.getAttribute("autopoint3")%>分！！！");
  location.href="stublank.jsp";
 } 
 function first()
 {
  if(choice!=null&choice!=0)
  {
   table.rows[0].cells[0].innerHTML="<h1 style=\"color:#6d85bf;font-size:15px;font-weight:bold;\">单选题:"+count+"、</h1>";
   table.rows[0].cells[1].innerHTML="<div class=\"qt_title\" style=\"font-size:15px;font-weight:bold;color:#333; margin-bottom:10px\">"+"<%=ques%>"+"</div>";
   
   div1.style.display="block";   //显示
   div2.style.display="block";
   div3.style.display="block";
   div4.style.display="block";
   
   //table.rows[1].cells[0].innerHTML="<div style=\"margin-top:0px;margin-left:90px;\">"+"<input type='radio' name='select' value='1' id='ra'>"+"</div>";
   table.rows[1].cells[0].innerHTML="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
   table.rows[1].cells[0].appendChild(radioa);
   table.rows[1].cells[1].innerHTML="<div style=\"font-size: 15px;color:#555;margin-bottom:5px;\">"+"<%=a%>"+"</div>";
   radioa.checked=true;
   
   table.rows[2].cells[0].innerHTML="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
   table.rows[2].cells[0].appendChild(radiob);
   table.rows[2].cells[1].innerHTML="<div style=\"font-size: 15px;color:#555;margin-bottom:5px;\">"+"<%=b%>"+"</div>";
       
       
   table.rows[3].cells[0].innerHTML="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
   table.rows[3].cells[0].appendChild(radioc);
   table.rows[3].cells[1].innerHTML="<div style=\"font-size: 15px;color:#555;margin-bottom:5px;\">"+"<%=c%>"+"</div>";
       
       
   table.rows[4].cells[0].innerHTML="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
   table.rows[4].cells[0].appendChild(radiod);
   table.rows[4].cells[1].innerHTML="<div style=\"font-size: 15px;color:#555;margin-bottom:5px;\">"+"<%=d%>"+"</div>";
  }
  else if(blank!=null&blank!=0)
  {
   table.rows[0].cells[0].innerHTML="<h1 style=\"color:#6d85bf;font-size:15px;font-weight:bold;\">填空题:"+count+"、</h1>";
   table.rows[0].cells[1].innerHTML="<div class=\"qt_title\" style=\"font-size:15px;font-weight:bold;color:#333; margin-bottom:10px\">"+""+"</div>";
       table.rows[1].cells[0].innerHTML="填空：";
       //table.rows[1].cells[1].appendChild(fill);
       table.rows[1].cells[1].innerHTML="<input type=\"text\" name=\"fill\" id=\"fill\">";
       table.rows[2].cells[0].innerHTML="";
       table.rows[3].cells[0].innerHTML="";
       table.rows[4].cells[0].innerHTML="";
       div1.style.display="block";
       div2.style.display="none"; //隐藏
       div3.style.display="none";
       div4.style.display="none";
       //area2.disabled=true; 
       //tr1.replaceChild(text,tr1.childNodes[0]);
       //table.rows[1].cells[1].innerHTML="<div id=\"div1\"><input type=\"text\" name=\"blank\ id=\"blank\""></div>";
       //div1.rows="3";
  }
  else if(opinion!=null&opinion!=0)
  {
   table.rows[0].cells[0].innerHTML="判断题:"+count+"、";
       area1.style.display="block";
      area2.style.display="block";
       area3.style.display="none";
       area4.style.display="none";
        table.rows[1].cells[0].innerHTML="A";
       table.rows[1].cells[0].appendChild(radio1);
       area1.value="对";
       //radio1.checked=true;
       
       
       table.rows[2].cells[0].innerHTML="B";
       table.rows[2].cells[0].appendChild(radio0);
       area2.value="错";
  }
 }
 var choose=document.getElementsByName("select");//单选
 var opin=document.getElementsByName("judge");//判断
 var blankanswer=document.getElementsByName("fill");;
  function selected(sel)
         {
          if(sel<=choice){
            //alert("choose");
            //alert(chooselength);
           if(choose[0].checked==true)answer="1";
           else if(choose[1].checked==true)answer="2";
           else if(choose[2].checked==true)answer="3";
           else if(choose[3].checked==true)answer="4";
           //alert(answer);
           
           //question=ques+"|"+ques1+"|"+ques2+"|"+ques3+"|"+ques4;
            
          }
          else if(sel>choice&sel<=(choice+blank)){
          answer=blankanswer.value;
          //alert(answer);
          //question=ques;
          }
          else if(sel>(choice+blank)&sel<=(choice+blank+opinion)){
          //alert("opinion")
          if(opin[0].checked==true)answer="1";
          else if(opin[1].checked==true)answer="0";
          //alert(answer);
          //question=ques;
         }
        }
        
        if(str=="next"|str=="last")
        {
    
     selected(count);
     /*alert("select");
     createXMLHttpRequest();
     alert("creat");
     //xmlHttp.onreadystatechange=callback;
     alert("callback");
     //alert("level"+levelvalue);
     //var url="servlet/Inputtest?choice="+a+"&blank="+b+"&opinion="+c+"&simple="+d+"&discuss="+e+"&which="+which;
     //var url="servlet/Inputtest?sq="+sq+"&sa="+sa+"&sl="+sl+"&st="+st+"&i="+i;"HelloAjaxDo.jsp"
     //var url="/Logon/servlet/HiAjax?question="+question+"&answer="+answer;
     var url="/examol/servlet/AcceptAnswerServlet?subjectid="+;
     /*var queryString=createQueryString();
     //url=encodeURI(url);
     alert(url);
     //url=encodeURI(url);
     //var url="HelloAjaxDo.jsp?a="+a;
     xmlHttp.open("post",url,true);
     xmlHttp.onreadystatechange=callback;
     xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
     xmlHttp.send(queryString); 
     
     
     alert(choice);
     alert(blank);
     alert(opinion);
     //xmlHttp.send("subjectid"+""+"&choicenum"+choice+"&blanknum"+blank+"&judgenum"+opinion+"&answer="+answer+"&count="+count+"&updown="+str);
     //xmlHttp.send("&subjectid"+88+"&choicenum"+choice+"&blanknum"+blank+"&judgenum"+opinion+"&answer="+answer+"&count="+count+"&updown="+str);
     alert("send");*/
     
     createXMLHttpRequest();  
     var url="./servlet/AcceptAnswerServlet";  
     var queryString=createQueryString();  
     xmlHttp.open("POST",url,true);  
     xmlHttp.onreadystatechange=callback;  
     xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
     xmlHttp.send(queryString);
     
     /*createXMLHttpRequest();  
     var queryString="./servlet/AcceptAnswerServlet";  
     queryString=queryString+createQueryString();  
     xmlHttp.onreadystatechange=callback;  
     xmlHttp.open("GET",queryString,true);  
     xmlHttp.send(null);*/
   }
   
   function createQueryString()  
    {  
     //var subject_id="";  
     var queryString="";
     var choice_num=choice;
     var blank_num=blank;
     var judge_num=opinion;
     
     if(count==1)
     queryString="subjectid="+<%=quesid%>+"&choicenum="+choice_num+"&blanknum="+blank_num+"&judgenum="+judge_num+"&answer="+answer+"&count="+count+"&updown="+str;  
     else
     queryString="subjectid="+subject_id+"&choicenum="+choice_num+"&blanknum="+blank_num+"&judgenum="+judge_num+"&answer="+answer+"&count="+count+"&updown="+str+"&rightnum="+rightnum+"&point="+point; 
     //var queryString="blanknum"+blank_num;
     return queryString;  
    }
   
   function callback()
   {
    if(xmlHttp.readyState==4)
    {
     if(xmlHttp.status==200)
     {
      var requestion=xmlHttp.responseText;
            //alert(requestion);
            
            requestion.replace(" ","");
            var reques=requestion.split("|");
            

       if(str=="next"){count++;}
       if(str=="last"){count--;button2.disabled=false;}
       if(count==1){ button1.disabled=true;button2.disabled=false;}
       if(count==(choice+blank+opinion)){button2.disabled=true;button3.disabled=false;}
      // alert("count"+count);
       subject_id=reques[0];
       rightnum="<%=session.getAttribute("rightnum3")%>";
       point="<%=session.getAttribute("autopoint3")%>";
       
      
       if(count>0&count<=choice){
       accuracy.innerHTML="当前正确率："+(reques[6]*100)+"%.当前题目难度等级："+reques[7]+"级。";
       table.rows[0].cells[0].innerHTML="<h1 style=\"color:#6d85bf;font-size:15px;font-weight:bold;\">单选题:"+count+"、</h1>";
       table.rows[0].cells[1].innerHTML="<div class=\"qt_title\" style=\"font-size:15px;font-weight:bold;color:#333; margin-bottom:10px\">"+reques[1]+"</div>";
       /*div1.style.display="block";
       div2.style.display="block";
       div3.style.display="block";
       div4.style.display="block";*/
       /*if(requestion=="kong"|requestion=="")
       {
       area.value="";
       area1.value="";
       area2.value="";
       area3.value="";
       area4.value="";
       }
       else{
       //var reques=requestion.split("\\|");
       area.value=reques[0];
       area1.value=reques[1];
       area2.value=reques[2];
       area3.value=reques[3];
       area4.value=reques[4];
       }*/
       table.rows[1].cells[0].innerHTML="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
       table.rows[1].cells[0].appendChild(radioa);
       table.rows[1].cells[1].innerHTML="<div style=\"font-size: 15px;color:#555;margin-bottom:5px;\">"+reques[2]+"</div>";
      // radioa.checked=true;
       
       table.rows[2].cells[0].innerHTML="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
       table.rows[2].cells[0].appendChild(radiob);
       table.rows[2].cells[1].innerHTML="<div style=\"font-size: 15px;color:#555;margin-bottom:5px;\">"+reques[3]+"</div>";
       
       table.rows[3].cells[0].innerHTML="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
       table.rows[3].cells[0].appendChild(radioc);
       table.rows[3].cells[1].innerHTML="<div style=\"font-size: 15px;color:#555;margin-bottom:5px;\">"+reques[4]+"</div>";
       
       table.rows[4].cells[0].innerHTML="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
       table.rows[4].cells[0].appendChild(radiod);
       table.rows[4].cells[1].innerHTML="<div style=\"font-size: 15px;color:#555;margin-bottom:5px;\">"+reques[5]+"</div>";
    
       }
       
       else if(count>choice&count<=(choice+blank)){
       accuracy.innerHTML="当前正确率："+(reques[2]*100)+"%.当前题目难度等级："+reques[3]+"级。";
       table.rows[0].cells[0].innerHTML="<h1 style=\"color:#6d85bf;font-size:15px;font-weight:bold;\">填空题:"+count+"、</h1>";
       //var ra=document.getElementById("ra");
       table.rows[0].cells[1].innerHTML="<div class=\"qt_title\" style=\"font-size:15px;font-weight:bold;color:#333; margin-bottom:10px\">"+reques[1]+"</div>";
       
       table.rows[1].cells[0].innerHTML="填空：";
       table.rows[1].cells[1].innerHTML="<input type=\"text\" name=\"fill\" id=\"fill\">";
       table.rows[2].cells[0].innerHTML="";
       table.rows[2].cells[1].innerHTML="";
       table.rows[3].cells[0].innerHTML="";
       table.rows[3].cells[1].innerHTML="";
       table.rows[4].cells[0].innerHTML="";
       table.rows[4].cells[1].innerHTML="";
       div1.style.display="block";
       div2.style.display="none";
       div3.style.display="none";
       div4.style.display="none";
       
       //area2.disabled=true; 
       //tr1.replaceChild(text,tr1.childNodes[0]);
       /*if(requestion=="kong")
       {area.value="";
       area1.value="";}
       else{area.value=requestion;area1.value="";}*/
       //table.rows[1].cells[1].innerHTML="<div id=\"div1\"><input type=\"text\" name=\"blank\ id=\"blank\""></div>";
       //div1.rows="3";
       //alert("jiba");
       }
       
       else if(count>(choice+blank)&count<=(choice+blank+opinion))
       {
        accuracy.innerHTML="当前正确率："+(reques[2]*100)+"%.当前题目难度等级："+reques[3]+"级。";
        /*if(requestion=="kong")
       {area.value="";
       }
       else{area.value=requestion;}*/
       table.rows[0].cells[0].innerHTML="<h1 style=\"color:#6d85bf;font-size:15px;font-weight:bold;\">判断题:"+count+"、</h1>";
       table.rows[0].cells[1].innerHTML="<div class=\"qt_title\" style=\"font-size:15px;font-weight:bold;color:#333;\">"+reques[1]+"</div>";
       table.rows[1].cells[1].innerHTML="";
       //table.rows[1].cells[0].innerHTML="";
       table.rows[1].cells[0].innerHTML="正确---------";
       table.rows[1].cells[0].appendChild(radio1);
       
       //radio1.checked=true;
       
       table.rows[2].cells[0].innerHTML="错误---------";
       table.rows[2].cells[0].appendChild(radio0);
       
       }
     }
    }
   }
} 
</script>
</head>
  
  <body onload="go('first')">
  <input type="hidden" value="<%=ques%>" name="ques">
  <input type="hidden" value="<%=a%>" name="aa">
  <input type="hidden" value="<%=b%>" name="bb">
  <input type="hidden" value="<%=c%>" name="cc">
  <input type="hidden" value="<%=d%>" name="dd">
  
  <center>
  <p>单选题共<%=choicenum%>道、填空题共<%=blanknum%>道、判断题共<%=opinionnum%>道。</p>
  <p id="info">当前正确率：0.当前题目难度等级：0.</p>
    <table id="table1" border=0 width="900">
       <tr>
         <td id="ss" width="90"></td>
         <td></td>
       </tr>
       <tr>
         <td></td>
         <td><div id="div1"></div></td>
       </tr>
       <tr>
         <td></td>
         <td><div id="div2"></div></td>
       </tr>
       
       <tr>
         <td></td>
         <td><div id="div3"></div></td>
       </tr>
       <tr>
         <td></td>
         <td><div id="div4"></div></td>
       </tr>
       <tr>
       </tr>
       <tr>
         <td></td>
         <td>
             
             <input type="button" id="next" value="下一题" onclick="go('next')">
             <input type="button" id="done" value="完成" onclick="go('done')">
         </td>
       </tr>
      
    </table>
    
    <!--<div class="paper_list" name="papr_qsn_type_list_div" id="papr_qsn_type_list_div_1">
    <h1 class="title_level_1"><b id="questype">一、单选题(每题2分，共20分)</b></h1>
    <div class="paper_info"></div>
    <div id="qsn_content_div_NB0" qsn_id="NB" qsn_sub_id="0" name="qsn_content_div" style="">
    <div class="qt_main">
    <div class="inner">
    <div class="col_left">
    <h1 class="num" id="ss"></h1>
    <h2 class="label_btn"><a class="icon_label_off" id="exam_mark_icon_NB0" title="进行标记" href="javascript:void(0)" onclick="examMarkQsn('NB0');" ></a></h2>
    <h3 class="score">2分<input type="hidden" id="exam_qsn_point_NB0" name="exam_qsn_point" value="2" /></h3>
    </div>
    <div class="col_right_01" style="width:85%">
    <div class="content">
    <div class="qt_title" id="ques">
    
    </div>
    <div class="qt_content">
    <label>
    <div style="float: left;margin-top:5px;">
    <input class="radiobox" name="select" id="option_NB010" qsn_item_id="1" qsn_item_sub_id="0" type="radio" value="1" />
    </div>
    <div>
    <div class="" style="float: none;margin-left: 20px;" >a</div>
    </div>
    </label>
    <label>
    <div style="float: left;margin-top:5px;">
    <input class="radiobox" name="select" id="option_NB020" qsn_item_id="2" qsn_item_sub_id="0" type="radio" value="2" />
    <div><div class="" style="float: none;margin-left: 20px;" >b</div>
    </div>
    </label>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>-->
    </center>
  </body>
</html>
