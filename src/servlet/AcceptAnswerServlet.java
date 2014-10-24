package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javabean.SubjectVO;
import javabean.UserBean;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AcceptAnswerServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AcceptAnswerServlet() {
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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
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
	@SuppressWarnings("null")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//request.setCharacterEncoding("gb2312");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("gb2312");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession(true);
		
		String exammode=session.getAttribute("exammode").toString();
		
		String username=session.getAttribute("username").toString();
		
		int autopoint=0,autopoint3=0,rightnum3=0;
		String autograde=null,nextinfo=null,idgroup=null;
		//int paperid=1;
		try{
			
        	/*String[] select = null;
        	String select1,a;
			
			ArrayList<SubjectVO> queslist=(ArrayList<SubjectVO>)session.getAttribute("queslist");
            
			for(int i=0;i<queslist.size();i++)
			{
			 a="select"+(i+1);
			 select[i]=request.getParameter(a);	
			}
        	a="select"+(1+1);
        	select1=request.getParameter(a);
        	select=select1.split("");
        	//select1=new String(select1.getBytes("UTF-8"));
        	out.println("123");*/
           ArrayList<SubjectVO> queslist=(ArrayList<SubjectVO>)session.getAttribute("queslist");
           String selectanswer = null,fillanswer=null,judgeanswer=null,simpleanswer=null,discussanswer=null,a;
           SubjectVO fs=new SubjectVO();
           int j=0,m=0,n=0,k=0,l=0;
           if(exammode.equals("1"))    //ģʽһ
           {
        	   String paperid=session.getAttribute("paperid").toString();
		   for(int i=0;i<queslist.size();i++)
		   {
			fs=queslist.get(i);
	        if(fs.getSubType().equals("1"))  //ģʽһѡ����
	        {
	         j=i+1;  //���
	         a="select"+j;
	         if(j==1)
			 selectanswer=request.getParameter(a);
		     else
			 selectanswer=selectanswer+","+request.getParameter(a);
	        }
	        if(fs.getSubType().equals("2"))  //ģʽһ�����
	        {
	         m=i+1-j;  //���
	         a="fill"+m;
	         if(m==1)
	         fillanswer=request.getParameter(a);
	         else
	         fillanswer=fillanswer+","+request.getParameter(a);
	        }
	        if(fs.getSubType().equals("3"))  //ģʽһ�ж���
	        {
	         n=i+1-j-m;  //���
	         a="judge"+n;
	         if(n==1)
	         judgeanswer=request.getParameter(a);
	         else
	         judgeanswer=judgeanswer+","+request.getParameter(a);
	        }
	        if(fs.getSubType().equals("4"))  //ģʽһ�����
	        {
	         k=i+1-j-m-n;  //���
	         a="simple"+k;
	         if(k==1)
	         simpleanswer=request.getParameter(a);
	         else
	         simpleanswer=simpleanswer+","+request.getParameter(a);
	        }
	        if(fs.getSubType().equals("5"))  //ģʽһ������
	        {
	         l=i+1-j-m-n-k;  //���
	         a="discuss"+l;
	         if(l==1)
	         discussanswer=request.getParameter(a);
	         else
	         discussanswer=discussanswer+","+request.getParameter(a);
	        }
		   }
			UserBean user=new UserBean();
			//autopoint=user.getAuto1(username,paperid, selectanswer,fillanswer,judgeanswer,simpleanswer,discussanswer);//ϵͳ���֡�¼����ͷ�����
			autograde=user.getAuto1(username,paperid, selectanswer,fillanswer,judgeanswer,simpleanswer,discussanswer);
			SubjectVO auto=new SubjectVO();
			auto.setAutoGrade(autograde);
			session.setAttribute("auto", autograde);
			//teacherpoint=user��getTeacherpoint1(username,paperid,simpleanswer,discussanswer);
			//if(teacherpoint==0)
			//user.exam1(username, paperid, autopoint,teacherpoint);
			out.println("<script language=javascript>alert('�ύ�ɹ�!');</script>");
			out.println("<script language=javascript>window.location.href='../stuindex.jsp';</script>");
			}
           if(exammode.equals("2"))     //ģʽ��
           {
        	   String paperid=session.getAttribute("paperid").toString();
        	   for(int i=0;i<queslist.size();i++)
    		   {
    			fs=queslist.get(i);
    	        if(fs.getSubType().equals("1"))  //ģʽ��ѡ����
    	        {
    	         j=i+1;  //���
    	         a="select"+j;
    	         if(j==1)
    			 selectanswer=request.getParameter(a);
    		     else
    			 selectanswer=selectanswer+","+request.getParameter(a);
    	        }
    	        if(fs.getSubType().equals("2"))  //ģʽ�������
    	        {
    	         m=i+1-j;  //���
    	         a="fill"+m;
    	         if(m==1)
    	         fillanswer=request.getParameter(a);
    	         else
    	         fillanswer=fillanswer+","+request.getParameter(a);
    	        }
    	        if(fs.getSubType().equals("3"))  //ģʽ���ж���
    	        {
    	         n=i+1-j-m;  //���
    	         a="judge"+n;
    	         if(n==1)
    	         judgeanswer=request.getParameter(a);
    	         else
    	         judgeanswer=judgeanswer+","+request.getParameter(a);
    	        }
    		   }
    			UserBean user=new UserBean();
    			autograde=user.checkpaper2(paperid, selectanswer,fillanswer,judgeanswer);   
    			session.setAttribute("auto", autograde);
    			out.println("<script language=javascript>alert('�ύ�ɹ�!');</script>");
    			out.println("<script language=javascript>window.location.href='../stuindex.jsp';</script>");
           }
           
           if(exammode.equals("3"))     //ģʽ3
           {
        	String subid=request.getParameter("subjectid");
        	String choicenum=request.getParameter("choicenum");
        	String blanknum=request.getParameter("blanknum");
        	String judgenum=request.getParameter("judgenum");
        	String answer=request.getParameter("answer");
        	String count=request.getParameter("count");
        	String updown=request.getParameter("updown");
        	
        	
        	int subjectid=Integer.parseInt(subid);
        	int i=Integer.parseInt(count);
        	int choice=Integer.parseInt(choicenum);
        	int blank=Integer.parseInt(blanknum);
        	int judge=Integer.parseInt(judgenum);
        	
        	
        	UserBean user=new UserBean();
        	if(i==1)
        	{
        		user.checkpaper3(subjectid,i,choice,blank,judge,answer,0,0,""); 
        		rightnum3=user.getright3();
        		autopoint3=user.getPoint2();
        		idgroup=user.getIdGroup();
        		
        		session.setAttribute("rightnum3", rightnum3);
        		session.setAttribute("autopoint3", autopoint3);
        		session.setAttribute("idgroup", idgroup);
        	}
        	else
        	{
        		//String rightnum=request.getParameter("rightnum");
            	//String point=request.getParameter("point");
            	//int right_num=Integer.parseInt(rightnum);
            	//int po_int=Integer.parseInt(point);
        	   String right_num=session.getAttribute("rightnum3").toString();
        	   String po_int=session.getAttribute("autopoint3").toString();
        	   String id_group=session.getAttribute("idgroup").toString();
        	   
        	   if(right_num.equals(null))
        	   {
        		   user.checkpaper3(subjectid,i,choice,blank,judge,answer,0,0,id_group); 
        		   rightnum3=user.getright3();
           		   autopoint3=user.getPoint2();
           		session.setAttribute("rightnum3", rightnum3);
        		session.setAttribute("autopoint3", autopoint3);
        	   }
        	   else
        	   {
        		   rightnum3=Integer.parseInt(right_num);
        		   autopoint3=Integer.parseInt(po_int);
        	   
        	user.checkpaper3(subjectid,i,choice,blank,judge,answer,rightnum3,autopoint3,id_group); 
        	        rightnum3=user.getright3();
    		        autopoint3=user.getPoint2();
    		        idgroup=user.getIdGroup();
    		        
    		        session.setAttribute("rightnum3", rightnum3);
 		            session.setAttribute("autopoint3", autopoint3);
 		           session.setAttribute("idgroup", idgroup);
        	   }
        	
        	}
        	nextinfo=user.getNextInfo();
        	//System.out.print(nextinfo);
        	
        	if(updown.equals("done"))
        	{
             out.print("kong");
            }
            else{
            out.print(nextinfo);
            }
        	
           }
		  }catch(Exception e){
			  
		  }
        
		
		out.flush();
		out.close();
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
