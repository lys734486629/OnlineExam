package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javabean.Checklist;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Checkpoint extends HttpServlet {


	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession(true);
		String paperid=(String)session.getAttribute("paperid");
		String username=request.getParameter("username");
		username = java.net.URLDecoder.decode(username, "UTF-8");
		
		String type=request.getParameter("type");
		int questype=Integer.parseInt(type);
		String teacherpoint=request.getParameter("teacherpoint");
		int tp;
		if(teacherpoint.equals(""))tp=0;
		else tp=Integer.parseInt(teacherpoint);
		System.out.println("teacherpoint="+tp);
		String count=request.getParameter("count");
		
		System.out.println("count="+count);
		System.out.println("username="+username+"  id="+paperid+"  type="+questype);
		int i=Integer.parseInt(count);
		System.out.println("i = "+i);
		
		String updown=request.getParameter("updown");
		System.out.println("updown="+updown);
		Checklist check=new Checklist();
		
		String studentanswer,standard,question,total;
		int subjectid,subjectpoint,preid=0;
		try{
			
			
			
				ArrayList<Checklist> list1=check.searchAll(paperid, username,questype);
				int num=list1.size();
				session.setAttribute("number", num);
	            Checklist check1=new Checklist();
				check1=list1.get(i-1);
	            studentanswer=check1.getAnswer();
	            subjectid=check1.getQuesid();
	            System.out.println(studentanswer+"  "+subjectid);
	           Checklist check3=new Checklist();
	           if(updown.equals("next")&(i-2)>=0){
	        	   check3=list1.get(i-2);
	        	   preid=check3.getQuesid();
	        	   check.insertTp(tp, questype, username, preid);
	           }
	           if(updown.equals("last")&i<num){
	        	   check3=list1.get(i);
	        	   preid=check3.getQuesid();
	        	   check.insertTp(tp, questype, username, preid);
	           }
	          
	            ArrayList<Checklist> list2=check.searchQuesid(subjectid);
	            Checklist check2=new Checklist();
	            check2=list2.get(0);
	            standard=check2.getAnswer1();
	            question=check2.getQuestion();
	            subjectpoint=check2.getPoint();
	            System.out.println(standard+" "+question+"  "+subjectpoint);
	            
	            total=question+"|"+standard+"|"+studentanswer+"|"+subjectpoint;
	            System.out.println(total);
	            
	            if(updown.equals("done")){
	            	out.print("kong");
	            	check3=list1.get(num-1);
		        	   preid=check3.getQuesid();
		        	   check.insertTp(tp, questype, username, preid);
	            }
	            else{
	            out.print(total);
	            }
			
			
		}catch(Exception ex){}
		
		
		out.flush();
		out.close();
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}
