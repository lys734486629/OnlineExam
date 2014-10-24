<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'input.jsp' starting page</title>
<script type="text/javascript">
 var xmlHttp=false;

 var a="<%=session.getAttribute("choicenum")%>";
 var b="<%=session.getAttribute("blanknum")%>";
 var c="<%=session.getAttribute("opinionnum")%>";
 var d="<%=session.getAttribute("simplenum")%>";
 var e="<%=session.getAttribute("discussnum")%>";
 var firstid="<%=session.getAttribute("firstid")%>";

 //var question;
//var table=document.getElementById("area");
//var xmlHttp=false;
//var  question;
var count=1;
  var ques="",answer="",question="";
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
  {        var choice=parseInt(a),blank=parseInt(b),opinion=parseInt(c),simple=parseInt(d),discuss=parseInt(e) ;
          
           var button1=document.getElementById("last");
          button1.disabled=false;
           var button2=document.getElementById("next");
           var button3=document.getElementById("done");
           button3.disabled=true;
           var table=document.getElementById("table1");
           var area=document.getElementById("area");   //ques
           var area1=document.getElementById("area1");  //a
           var area2=document.getElementById("area2");
           var area3=document.getElementById("area3");
           var area4=document.getElementById("area4");//d
           var levelvalue;
	       var level=document.getElementsByName("level"); 
	        var levellength=level.length;
	  // alert(levellength);
					
           
          
    // var ques=area.value;
     //var ques1=area1.value;
     //var a=ques+"|"+ques1;
     // alert("level"+levelvalue);
       if(document.uniqueID) {   
    //IE浏览器分支   
    var radioa=document.createElement("<input type='radio' name='radio' value='1' id='ra' >");//单选
    var radiob=document.createElement("<input type='radio' name='radio' value='2' id='rb'>");
    var radioc=document.createElement("<input type='radio' name='radio' value='3' id='rc'>");
    var radiod=document.createElement("<input type='radio' name='radio' value='4' id='rd'>");
    var radio1=document.createElement("<input type='radio' name='radio1' value='1' id='op1' >");//判断
    var radio0=document.createElement("<input type='radio' name='radio1' value='0' id='op0'>");
      
} else {   
    //非IE浏览器分支   
   var radioa=document.createElement("input");
       radioa.type="radio";
       radioa.name="radio";
       radioa.value="1";
       radioa.id="ra";
     
    var radiob=document.createElement("input");
       radiob.type="radio";
       radiob.name="radio";
       radiob.value="2";
       radiob.id="rb";
    var radioc=document.createElement("input");
       radioc.type="radio";
       radioc.name="radio";
       radioc.value="3";
       radioc.id="rc";
    var radiod=document.createElement("input");
       radiod.type="radio";
       radiod.name="radio";
       radiod.value="4";
       radiod.id="rd";
    var radio1=document.createElement("input");
       radio1.type="radio";
       radio1.name="radio1";
       radio1.value="1";
       radio1.id="op1";
    var radio0=document.createElement("input");
       radio0.type="radio";
       radio0.name="radio1";
       radio0.value="0";
       radio0.id="op0";
}  
 if(str=="first"){           //onload
           //area.value="a";area1.value="b";
           levelvalue="1";
           level[0].checked=true;
           //question=area.value+"|"+area1.value;
           answer="1";
           first();
           button1.disabled=true;
           }
  if(str=="done"){
  location.href="function.jsp";
  }
   function first()
   {
      if(choice!=null&choice!=0){
      table.rows[0].cells[0].innerHTML=count+"单选题";
      area1.style.display="block";   //显示
      area2.style.display="block";
       area3.style.display="block";
       area4.style.display="block";
       
       table.rows[1].cells[0].innerHTML="A";
       table.rows[1].cells[0].appendChild(radioa);
       radioa.checked=true;
       
       table.rows[2].cells[0].innerHTML="B";
       table.rows[2].cells[0].appendChild(radiob);
       
       
       table.rows[3].cells[0].innerHTML="C";
       table.rows[3].cells[0].appendChild(radioc);
       
       
       table.rows[4].cells[0].innerHTML="D";
       table.rows[4].cells[0].appendChild(radiod);
        
     
       }
       else if(blank!=null&blank!=0){
       table.rows[0].cells[0].innerHTML=count+"填空题";
       table.rows[1].cells[0].innerHTML="答案：";
       table.rows[2].cells[0].innerHTML="";
       table.rows[3].cells[0].innerHTML="";
       table.rows[4].cells[0].innerHTML="";
       area2.style.display="none"; //隐藏
       area3.style.display="none";
       area4.style.display="none";
       //area2.disabled=true; 
       //tr1.replaceChild(text,tr1.childNodes[0]);
       area1.rows="3";
       }
       else if(opinion!=null&opinion!=0){
       table.rows[0].cells[0].innerHTML=count+"判断题";
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
       else if(simple!=null&simple!=0){
         table.rows[0].cells[0].innerHTML=count+"简答题";
       table.rows[1].cells[0].innerHTML="答案：";
       table.rows[2].cells[0].innerHTML="";
       table.rows[3].cells[0].innerHTML="";
       table.rows[4].cells[0].innerHTML="";
       area2.style.display="none";
       area3.style.display="none";
       area4.style.display="none";
       //area2.disabled=true; 
       //tr1.replaceChild(text,tr1.childNodes[0]);
       area1.rows="5";
       }
       else if(discuss!=null&discuss!=0){
         table.rows[0].cells[0].innerHTML=count+"分析题";
       table.rows[1].cells[0].innerHTML="答案：";
       table.rows[2].cells[0].innerHTML="";
       table.rows[3].cells[0].innerHTML="";
       table.rows[4].cells[0].innerHTML="";
       area2.style.display="none";
       area3.style.display="none";
       area4.style.display="none";
       //area2.disabled=true; 
       //tr1.replaceChild(text,tr1.childNodes[0]);
       area1.rows="5";
      
       }
   }
      ques=area.value;var ques1=area1.value;var ques2=area2.value;var ques3=area3.value;var ques4=area4.value;
            
         var choose=document.getElementsByName("radio");//单选
         var opin=document.getElementsByName("radio1");//判断
       
       function selected(sel)
  {
     if(sel<=choice){
            alert("choose");
            //alert(chooselength);
           if(choose[0].checked==true)answer="1";
           else if(choose[1].checked==true)answer="2";
           else if(choose[2].checked==true)answer="3";
           else if(choose[3].checked==true)answer="4";
           alert(answer);
           question=ques+"|"+ques1+"|"+ques2+"|"+ques3+"|"+ques4;
            
          }
          else if(sel>choice&sel<=(choice+blank)){
          answer=area1.value;
          alert(answer);
          question=ques;
          }
          else if(sel>(choice+blank)&sel<=(choice+blank+opinion)){
          alert("opinion")
          if(opin[0].checked==true)answer="1";
          else if(opin[1].checked==true)answer="0";
          question=ques;
          }
          else if(sel>(choice+blank+opinion)&sel<=(choice+blank+opinion+simple)){
          answer=area1.value;
          question=ques;
          }
          else if(sel>(choice+blank+opinion+simple)&sel<=(choice+blank+opinion+simple+discuss)){
          answer=area1.value;
          question=ques;
          }
  }  
    
       /*   if(count<=choice){
            
           
            
          }
          else if(count>choice&count<=(choice+blank)){}
          else if(count>(choice+blank)&coun<=(choice+blank+opinion)){}
          else if(count>(choice+blank+opinion)&count<=(choice+blank+opinion+simple)){}
          else if(count>(choice+blank+opinion+simple)&count<=(choice+blank+opinion+simple+discuss)){}
       */
       if(0<levellength)
					{
					  for(var j = 0;j < levellength;j++)
                     {
                      if(level[j].checked)
                      {
                        levelvalue = level[j].value;
                        //alert(levelvalue);
                      }
                      
                     }
                    }
                 
    if(str=="next"|str=="last"){
    
     selected(count);
     createXMLHttpRequest();
     xmlHttp.onreadystatechange=callback;
     //alert("level"+levelvalue);
     //var url="servlet/Inputtest?choice="+a+"&blank="+b+"&opinion="+c+"&simple="+d+"&discuss="+e+"&which="+which;
     //var url="servlet/Inputtest?sq="+sq+"&sa="+sa+"&sl="+sl+"&st="+st+"&i="+i;"HelloAjaxDo.jsp"
     //var url="/Logon/servlet/HiAjax?question="+question+"&answer="+answer;
     var url="/Onlineexam/servlet/Inputtest";
     url=encodeURI(url);
     url=encodeURI(url);
     //var url="HelloAjaxDo.jsp?a="+a;
     xmlHttp.open("post",url,true);
     xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
     xmlHttp.send("question="+question+"&answer="+answer+"&level="+levelvalue+"&count="+count+"&firstid="+firstid+"&updown="+str);
   }
  
  function callback()
  {
      if(xmlHttp.readyState==4)
      {
         if(xmlHttp.status==200)
         {
                 
          
            var requestion=xmlHttp.responseText;
            alert(requestion);
            //var a=requestion.split("|");

       if(str=="next"){count++;}
       if(str=="last"){count--;button2.disabled=false;}
       if(count==1){ button1.disabled=true;button2.disabled=false;}
       if(count==(choice+blank+opinion+simple+discuss)){button2.disabled=true;button3.disabled=false;}
      // alert("count"+count);
       if(count>0&count<=choice){
      
       table.rows[0].cells[0].innerHTML=count+"单选题";
      area1.style.display="block";
      area2.style.display="block";
       area3.style.display="block";
       area4.style.display="block";
       if(requestion=="kong"|requestion=="")
       {
       area.value="";
       area1.value="";
       area2.value="";
       area3.value="";
       area4.value="";
       }
       else{
       var reques=requestion.split("|");
       area.value=reques[0];
       area1.value=reques[1];
       area2.value=reques[2];
       area3.value=reques[3];
       area4.value=reques[4];
       }
       table.rows[1].cells[0].innerHTML="A";
       table.rows[1].cells[0].appendChild(radioa);
      // radioa.checked=true;
       
       table.rows[2].cells[0].innerHTML="B";
       table.rows[2].cells[0].appendChild(radiob);
       
       
       table.rows[3].cells[0].innerHTML="C";
       table.rows[3].cells[0].appendChild(radioc);
       
       
       table.rows[4].cells[0].innerHTML="D";
       table.rows[4].cells[0].appendChild(radiod);
       
    
       }
       
       else if(count>choice&count<=(choice+blank)){
       table.rows[0].cells[0].innerHTML=count+"填空题";
       //var ra=document.getElementById("ra");
       
       
       table.rows[1].cells[0].innerHTML="答案：";
       table.rows[2].cells[0].innerHTML="";
       table.rows[3].cells[0].innerHTML="";
       table.rows[4].cells[0].innerHTML="";
       area2.style.display="none";
       area3.style.display="none";
       area4.style.display="none";
       //area2.disabled=true; 
       //tr1.replaceChild(text,tr1.childNodes[0]);
       if(requestion=="kong")
       {area.value="";
       area1.value="";}
       else{area.value=requestion;area1.value="";}
       area1.rows="3";
       //alert("jiba");
       }
       
       else if(count>(choice+blank)&count<=(choice+blank+opinion)){
        if(requestion=="kong")
       {area.value="";
       }
       else{area.value=requestion;}
       table.rows[0].cells[0].innerHTML=count+"判断题";
       area1.rows="1";
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
       else if(count>(choice+blank+opinion)&count<=(choice+blank+opinion+simple)){
       table.rows[0].cells[0].innerHTML=count+"简答题";
        if(requestion=="kong")
       {area.value="";
       area1.value="";}
       else{area.value=requestion;area1.value="";}
       
       table.rows[1].cells[0].innerHTML="答案：";
       table.rows[2].cells[0].innerHTML="";
       table.rows[3].cells[0].innerHTML="";
       table.rows[4].cells[0].innerHTML="";
       area2.style.display="none";
       area3.style.display="none";
       area4.style.display="none";
       //area2.disabled=true; 
       //tr1.replaceChild(text,tr1.childNodes[0]);
     
       area1.rows="5";
       //alert("jiba");
       }
       else if(count>(choice+blank+opinion+simple)&count<=(choice+blank+opinion+simple+discuss)){
       table.rows[0].cells[0].innerHTML=count+"分析题";
       
        if(requestion=="kong")
       {area.value="";
       area1.value="";}
       else{area.value=requestion;area1.value="";}
       table.rows[1].cells[0].innerHTML="答案：";
       table.rows[2].cells[0].innerHTML="";
       table.rows[3].cells[0].innerHTML="";
       table.rows[4].cells[0].innerHTML="";
       area2.style.display="none";
       area3.style.display="none";
       area4.style.display="none";
       //area2.disabled=true; 
       //tr1.replaceChild(text,tr1.childNodes[0]);
       
       area1.rows="5";
       //alert("jiba");
   
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
         <td><textarea id="area1" rows="1" cols="40"></textarea></td>
       </tr>
       <tr >
         <td>&nbsp</td>
         <td><textarea id="area2" rows="1" cols="40"></textarea></td>
       </tr>
       
       <tr >
         <td>&nbsp</td>
         <td><textarea id="area3" rows="1" cols="40"></textarea></td>
       </tr>
       <tr >
         <td>&nbsp</td>
         <td><textarea id="area4" rows="1" cols="40"></textarea></td>
       </tr>
       <tr>
         <td>题目难度：</td>
         <td><input type="radio" name="level" value="1">简单
             <input type="radio" name="level" value="2">中等
             <input type="radio" name="level" value="3">难
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
 