package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javabean.Checklist;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Studentlist extends HttpServlet {


		public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			
			PrintWriter out = response.getWriter();	
			request.setCharacterEncoding("UTF-8");
			String paperid=request.getParameter("paperid");
			System.out.println(paperid);
			HttpSession session=request.getSession(true);
			/*String username=(String)session.getAttribute("username");
		    username=new String(username.getBytes("UTF-8"));
	         */
			
			session.setAttribute("paperid", paperid);
		Checklist user=new Checklist();
		
		
		
		
		try{
			
			
			int i=4,j=5;
			ArrayList<Checklist> userlist1=user.searchUsername(paperid,i);
            session.setAttribute("userlist1",userlist1);
            ArrayList<Checklist> userlist2=user.searchUsername(paperid,j);
            session.setAttribute("userlist2",userlist2);
			//out.println("<script language=javascript>alert('≤È—Ø≥…π¶!');</script>");
				 out.println("<script language=javascript>window.location.href='../Choosewho.jsp';</script>");
			
			
		}catch(Exception e){}
		out.flush();
		out.close();
	
		}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		doGet(request,response);
	
	}

	
}
