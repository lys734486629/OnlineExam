<%@ page language="java" import="java.util.*,javabean.Checklist" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
  <body>

    <table align=left>
      <th>
                         <tr>
                             <th width="130" style="color:black"><div align="center">简答题用户名</div></th>
                           </tr>
      </th>
<% ArrayList<Checklist> userlist1=(ArrayList<Checklist>)session.getAttribute("userlist1");
   ArrayList<String> name=new ArrayList<String>();
    Checklist fs=new Checklist();
    int i=0;
                              for(i=0;i<userlist1.size();i++)
                                {         fs=userlist1.get(i);
                                          name.add(fs.getUsername());
							    out.print("<tr>");
							    out.print("<td><a href='studentform.jsp?type=4&username="+name.get(i)+"'>"+name.get(i)+"</a></td>");
							   	out.print("</tr>");
                                 }
%>
   </table align=right>
   
    <table>
      <th>
                         <tr>
                             <th width="130" style="color:black"><div align="center">分析题用户名</div></th>
                           </tr>
      </th>
<% ArrayList<Checklist> userlist2=(ArrayList<Checklist>)session.getAttribute("userlist2");
   ArrayList<String> name2=new ArrayList<String>();
    Checklist fs1=new Checklist();
    int j=0;
                              for(j=0;j<userlist2.size();j++)
                                {         fs1=userlist2.get(j);
                                          name2.add(fs1.getUsername());
							    out.print("<tr>");
							    out.print("<td><a href='studentform.jsp?type=5&username="+name2.get(j)+"'>"+name2.get(j)+"</a></td>");
							   	out.print("</tr>");
                                 }
%>
   </table>
  </body>
</html>
