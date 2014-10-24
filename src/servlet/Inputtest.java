package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javabean.Inputpaper;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Inputtest extends HttpServlet {


	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//HttpSession session=request.getSession(true);
		/*String a=(String)session.getAttribute("choicenum");
		String b=(String)session.getAttribute("blanknum");
		String c=(String)session.getAttribute("opinionnum");
		String d=(String)session.getAttribute("simplenum");
		String e=(String)session.getAttribute("discussnum");
		// var url="servlet/Inputtest?sq="+sq+"&sa="+sa+"&sl="+sl+"&st="+st+"&i="+i;
		//String which=request.getParameter("which");
		System.out.println(a+b+c+d+e);
		String question=request.getParameter("sq");
		String answer=request.getParameter("sa");
		String paperlevel=request.getParameter("sl");
		//String type=request.getParameter("st");
		String count=request.getParameter("i");
		int i=Integer.parseInt(count);
		//int subjecttype=Integer.parseInt(type);
		//int choice=0,blank=0,opinion=0,simple=0,discuss=0;
		*/
		String question=request.getParameter("question");
		question = java.net.URLDecoder.decode(question, "UTF-8");
		//System.out.println(a);
		//String[] ques=a.split(Pattern.quote("|"));
		//String ques0=ques[0];
		//String ques1=ques[1];
		String paperlevel=request.getParameter("level");
		System.out.println("level="+paperlevel);
		String answer=request.getParameter("answer");
		answer= java.net.URLDecoder.decode(answer, "UTF-8");
		System.out.println("answer="+answer);
		String count=request.getParameter("count");
		//count=java.net.URLDecoder.decode(count, "UTF-8");
		System.out.println(count);
		//String ques2=ques[1];
		//String b=ques0;
		System.out.println("question = "+question);
		int i=Integer.parseInt(count);
		System.out.println("i = "+i);
		String firstid=request.getParameter("firstid");
		System.out.println("firstid="+firstid);
		int j=Integer.parseInt(firstid);
		System.out.println("j  "+j);
		String updown=request.getParameter("updown");
		Inputpaper inputpaper=new Inputpaper();
		
		try{
			int p=0;
			int k=j+i-1;
			System.out.println("k  "+k);
			inputpaper.savetest(question, answer,paperlevel, k);
			if(updown.equals("next"))
			 {p=k+1;}
			else if(updown.equals("last")){p=k-1;}
			System.out.println("p  "+p);
			String requestion=inputpaper.choose(p);
			System.out.println("re  "+requestion);
			if(requestion==null|requestion.equals("null"))
				{out.println("kong");}
			else{
				out.println(requestion);
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
