package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javabean.Inputnum;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Inputservlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String a1=request.getParameter("choicepoint");
		String a2=request.getParameter("choicenum");
		String b1=request.getParameter("blankpoint");
		String b2=request.getParameter("blanknum");
		String c1=request.getParameter("opinionpoint");
		String c2=request.getParameter("opinionnum");
		String d1=request.getParameter("simplepoint");
		String d2=request.getParameter("simplenum");
		String e1=request.getParameter("discusspoint");
		String e2=request.getParameter("discussnum");
		String papername=request.getParameter("papername");
		String papermodel=request.getParameter("model");
		System.out.println("a1"+a1);
		System.out.println("b1"+b1);
		 System.out.println("d1"+d1);
		System.out.println(papername+papermodel);
		
		int j=1;
		   
		
		if(papername!=null&&!papername.equals(""))
		{
			Inputnum in=new Inputnum();
			if(a1!=null&&!a1.equals(""))
			{in.inputpaper(a1, a2, 1,papername,papermodel);}
		
		if(b1!=null&&!b1.equals(""))
			{in.inputpaper(b1, b2, 2,papername,papermodel);}
		
		if(c1!=null&&!c1.equals(""))
			{in.inputpaper(c1, c2, 3,papername,papermodel);}
		
		if(d1!=null&&!d1.equals(""))
			{in.inputpaper(d1, d2, 4,papername,papermodel);}
		
		if(e1!=null&&!e1.equals(""))
			{in.inputpaper(e1, e2, 5,papername,papermodel);}
		
		 j=in.selectfirstid();
		}
		else{
			Inputnum in1=new Inputnum();
		if(a1!=null&&!a1.equals(""))
			{in1.inputsingle(a1, a2, 1);}
		
		if(b1!=null&&!b1.equals(""))
			{in1.inputsingle(b1, b2, 2);}
		
		if(c1!=null&&!c1.equals(""))
			{in1.inputsingle(c1, c2, 3);}
		
		if(d1!=null&&!d1.equals(""))
			{in1.inputsingle(d1, d2, 4);}
		
		if(e1!=null&&!e1.equals(""))
			{in1.inputsingle(e1, e2, 5);}
		j=in1.selectfirstid();
		}
		if(a1==""&a2==""){a1="0";a2="0";}
		   if(b1==""&b2==""){b1="0";b2="0";}
		   if(c1==""&c2==""){c1="0";c2="0";}
		   if(d1==""&d2==""){d1="0";d2="0";}
		   if(e1==""&e2==""){e1="0";e2="0";}
		   System.out.println("a1"+a1);
			System.out.println("b1"+b1);
			 System.out.println("d1"+d1);
			 System.out.println("inputservlet firstid="+j);
			 
		HttpSession session=request.getSession(true);
		session.setAttribute("choicenum", a2);
		session.setAttribute("blanknum", b2);
		session.setAttribute("opinionnum", c2);
		session.setAttribute("simplenum", d2);
		session.setAttribute("discussnum", e2);
		session.setAttribute("firstid", j);
		out.println("<script language=javascript>alert('ø™ º ‰Ã‚!');</script>");
		
	   out.println("<script language=javascript>window.location.href='../input.jsp?';</script>");
		out.flush();
		out.close();
		//String url="input.jsp?action=choicenum=a2&blanknum=b2&opinionnum=c2&simplenum=d2&discussnum=e2";
		//response.sendRedirect(url);
	/*	try{
			
			request.setAttribute("choicenum", a2);
			request.setAttribute("blanknum", b2);
			request.setAttribute("opinionnum", c2);
			request.setAttribute("simplenum", d2);
			request.setAttribute("discussnum", e2);
	    RequestDispatcher rd=request.getRequestDispatcher("../input.jsp");
	    rd.forward(request, response);
	    return;
		}catch(Exception e){}*/
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

	
}
