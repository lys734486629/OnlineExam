<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'input.jsp' starting page</title>
<script type="text/javascript">
 var xmlHttp=false;

 var paperid="<%=session.getAttribute("paperid")%>";
 var username="<%=request.getParameter("username")%>";
 var ty="<%=request.getParameter("type")%>";
 

var count=1;
var num=0; 
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
  {        var type=parseInt(ty) ;
           var answer="",question="";
           var teacherpoint=0;
           var button1=document.getElementById("last");
         
           var button2=document.getElementById("next");
           var button3=document.getElementById("done");
          
           var table=document.getElementById("table1");
           var area=document.getElementById("area");
           var area1=document.getElementById("area1");
           var area2=document.getElementById("area2")
           var p=document.getElementById("point");
           var t=document.getElementById("teacherpoint");
           
           var teacherpoint=t.value;
 if(str=="first"){
           button1.disabled=true;
           }
  else{ button1.disabled=false;}
  

       
    if(str=="next"|str=="last"|str=="done"){
       if(t.value=="")
       alert("评分栏不能为空");
       
    }
    
   
        if(str=="next"){count++;}
       if(str=="last"){count--;}
     
    
     createXMLHttpRequest();
     xmlHttp.onreadystatechange=callback;
   
     var url="/Onlineexam/servlet/Checkpoint";
     url=encodeURI(url);
     url=encodeURI(url);
     
     xmlHttp.open("post",url,true);
     xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
     xmlHttp.send("username="+username+"&type="+type+"&count="+count+"&teacherpoint="+teacherpoint+"&updown="+str);
    
   
   
 
  function callback()
  {
      if(xmlHttp.readyState==4)
      {
         if(xmlHttp.status==200)
         {
           var requestion=xmlHttp.responseText;
            alert(requestion);
            
            num="<%=session.getAttribute("number")%>";
             if(count==1){button1.disabled=true;button2.disabled=false;}
   if(count==num){button2.disabled=true;button3.disabled=false;}
   else{button3.disabled=true;}      
          
            
   
    // alert(num);
     //  alert("count"+count);
     
      if(requestion=="kong"){
      location.href="function.jsp";
      } 
      else{
            var a=requestion.split("|");
      if(type==4){
   
       table.rows[0].cells[0].innerHTML=count+"简答题";
        area.value=a[0];
        area1.value=a[1];
        area2.value=a[2];
        p.value=a[3];
       t.value="";
       table.rows[1].cells[0].innerHTML="参考答案：";
       table.rows[2].cells[0].innerHTML="学生答案：";
       }
       else if(type==5){
       table.rows[0].cells[0].innerHTML=count+"分析题";
       area.value=a[0];
       area1.value=a[1];
       area2.value=a[2];  
       p.value=a[3];
       t.value="";
       table.rows[1].cells[0].innerHTML="参考答案：";
       table.rows[2].cells[0].innerHTML="学生答案：";
   
       }
      
      }
         }
      }
  
  }
	 
 }
 
 
 
  </script>
  <body onload="go('first')">
   <table id="table1" border=1 >
       <tr >
         <td id="ss"></td>
         <td><textarea id="area" rows="3" cols="40"></textarea></td>
       </tr>
       <tr >
         <td>&nbsp</td>
         <td><textarea id="area1" rows="3" cols="40"></textarea></td>
       </tr>
       <tr >
         <td>&nbsp</td>
         <td><textarea id="area2" rows="3" cols="40"></textarea></td>
       </tr>
       <tr >
         <td>&nbsp</td>
         <td>分值：<input type="text" id="point" maxlength=2 size=2>
             评分：<input type="text" id="teacherpoint" maxlength=2 size=2>
         </td>
       </tr>
       <tr>
         <td></td>
         <td>
             <input type="button" id="last"  value="上一题" onclick='go("last")'>
             <input type="button" id="next" value="下一题" onclick="go('next')">
             <input type="button" id="done" value="完成" onclick="go('done')">
         </td>
       </tr>
       
    </table>
    
  </body>
</html>
 