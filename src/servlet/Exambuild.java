package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javabean.UserBean;
import javabean.SubjectVO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Exambuild extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Exambuild() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();	
		String testmode=request.getParameter("exammode");
		String paperid_1=request.getParameter("paperid_1");
		String paperid_2=request.getParameter("paperid_2");
		
		HttpSession session=request.getSession(true);
		session.setAttribute("exammode", testmode);
		
		
		UserBean user=new UserBean();
		SubjectVO ques=new SubjectVO();
		try{
			if(testmode.equals("1"))   //模式一
			{
			//int paperid=paperid_1;    //随机生成paperid
			ArrayList<SubjectVO> queslist=user.exambuild1(testmode,paperid_1);    //生成试题
			session.setAttribute("paperid", paperid_1);
            session.setAttribute("queslist",queslist);
            getServletContext().setAttribute("queslist", queslist);
            
            out.println("<script language=javascript>window.location.href='../exambuild.jsp';</script>");
            System.out.print("\npapermodel="+testmode+",paperid="+paperid_1+"\n");
			}
			
			if(testmode.equals("2"))    //模式二
			{
			 ArrayList<SubjectVO> queslist=user.exambuild2(testmode,paperid_2);    //生成试题
			 session.setAttribute("paperid", paperid_2);
	         session.setAttribute("queslist",queslist);
	         
	         out.println("<script language=javascript>window.location.href='../exambuild2.jsp';</script>");
	         System.out.print("\npapermodel="+testmode+",paperid="+paperid_2+"\n");
			}
			if(testmode.equals("3"))    //模式三
			{
			 ArrayList<SubjectVO> queslist=user.exambuild3(testmode);    //生成试题
			 //session.setAttribute("paperid", paperid_2);
	         session.setAttribute("queslist",queslist);
	         
	         out.println("<script language=javascript>window.location.href='../exambuild3.jsp';</script>");
	         System.out.print("\npapermodel="+testmode+"\n");
			}
		  }catch(Exception e){}
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
