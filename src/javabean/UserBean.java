package javabean;

import java.sql.*;
import java.util.*;
import dbbean.*;

public class UserBean 
{
    private String username;
	private String password;
	private String identity;
	private String name;
	
	public String getUsername()
	{return username;}
	public void setUsername(String username)
	{this.username=username;}
	
	public String getPassword()
	{return password;}
	public void setPassword(String password)
	{this.password=password;}
	
	public String getIdentity()
	{return identity;}
	public void setIdentity(String identity)
	{this.identity=identity;}
	
	public String getName()
	{return name;}
	public void setName(String name)
	{this.name=name;}
	
	private String subid;
	private String question;
	private String subtype;
	private String subanswer;
	private String sublevel;
	private String paperid;
	private String point;
	private String papermodel;
	
	public String getSubId()
	{return subid;}
	public void setSubId(String subid)
	{this.subid=subid;}
	
	public String getQuestion()
	{return question;}
	public void setQuestion(String question)
	{this.question=question;}
	
	public String getSubType()
	{return subtype;}
	public void setSubType(String subtype)
	{this.subtype=subtype;}
	
	public String getSubAnswer()
	{return subanswer;}
	public void setSubAnswer(String subanswer)
	{this.subanswer=subanswer;}
	
	public String getSubLevel()
	{return sublevel;}
	public void setSubLevel(String sublevel)
	{this.sublevel=sublevel;}
	
	public String getPaperId()
	{return paperid;}
	public void setPaperId(String paperid)
	{this.paperid=paperid;}
	
	public String getPoint()
	{return point;}
	public void setPoint(String point)
	{this.point=point;}
	
	public String getPaperModel()
	{return papermodel;}
	public void setPaperModel(String papermodel)
	{this.papermodel=papermodel;}
	
	private int queslevel;
	public int getQuesLevel()
	{return queslevel;}
	public void setQuesLevel(int queslevel)
	{this.queslevel=queslevel;}
	
	private String nextinfo;
	public String getNextInfo()
	{return nextinfo;}
	public void setNextInfo(String nextinfo)
	{this.nextinfo=nextinfo;}
	
	private int point2;
	public int getPoint2()
	{return point2;}
	public void setPoint2(int point2)
	{this.point2=point2;}
	
	private int rightnum3;
	public int getright3()
	{return rightnum3;}
	public void setrightnum3(int rightnum3)
	{this.rightnum3=rightnum3;}
	
	private String idgroup;
	public String getIdGroup()
	{return idgroup;}
	public void setIdGroup(String idgroup)
	{this.idgroup=idgroup;}
	
	//��¼����
		public boolean match(String uname,String id,String pass)
		{
			username=uname;
			identity=id;
			password=pass;
			boolean find=false;
			
			Connection con=null;
			ResultSet rs=null;
			
			DBBean db=new DBBean();
			String sql=null;
			
			if(identity.equals("2"))
				sql="select password from userinfo where username='"+username+"' and able='2'";
			else if(identity.equals("1"))
				sql="select password from userinfo where username='"+username+"' and able='1'";
			
			
			
			try{
				Statement stmt;
				con=db.getConnection();
				rs=db.executeQuery(sql);
				
				if(rs.next())
				{
					
					String p=rs.getString("password");
					
					
					if(p.equals(password))
						find=true;
					else
						find=false;
			
				}
				else
					find=false;

			}catch(Exception e){}
			
			finally
			{
				db.close();
			}
		
			return find;
		}
//��ȡ������Ϣ
		public String getname(String uname)
		{
			username=uname;
			Connection con=null;
			ResultSet rs=null;
			String name=null;
			
			DBBean db=new DBBean();
			String sql;

			sql="select name from userinfo where username='"+username+"'";
			
			try{
				con=db.getConnection();
				rs=db.executeQuery(sql);
				
				
				if(rs.next())
				{
				  name=rs.getString("name");
				}
			}catch(Exception e){}
			
			finally
			{
				db.close();
			}
			return name;
		}
		
		//����paperid����
		public int paperid()
		{
			Random r=new Random();
			int paperid=r.nextInt(3)+1;
			//int paperid=1;
			return paperid;
			
		}
		
		//ģʽһ������Ŀ����
		public ArrayList<SubjectVO> exambuild1(String mode,String paperid)
		{
			ArrayList<SubjectVO> queslist=new ArrayList<SubjectVO>();
			String exammode=mode;
			Connection con=null;
			ResultSet rs=null;
			
			DBBean db=new DBBean();
			String sql=null;
			
			String s1=null;
			String s2=null;
			
			//Random r=new Random();
			//int paperid=r.nextInt(1)+1;
			String paper_id=paperid;
			//sql="select * from subject where paperid="+paperid;
			//sql="select * from subject where paperid="+paper_id+"and papermodel="+exammode;
			sql="select * from subject where paperid="+paper_id;
			
			System.out.print(sql);
			try{
				con=db.getConnection();
				rs=db.executeQuery(sql);
				
				
				while(rs.next())
				{
					//UserBean user=new UserBean();
					SubjectVO ques=new SubjectVO();
					
					/*System.out.println("******");   
					System.out.println(rs.getString("subjectid"));    
					System.out.println(rs.getString("subjectquestion")); */
					
					s1=rs.getString("subjectquestion");
					s2=rs.getString("subjecttype");
					
					ques.setQuestion(s1);
					ques.setSubType(s2);

					 queslist.add(ques);
				}
				

			}catch(Exception e){}
			
			finally
			{
				db.close();
			}
			
			return queslist;
		}
		
		//ģʽ��������Ŀ����
		public ArrayList<SubjectVO> exambuild2(String mode,String paperid) 
		{
			// TODO Auto-generated method stub
			ArrayList<SubjectVO> queslist=new ArrayList<SubjectVO>();
			String exammode=mode;
			Connection con=null;
			ResultSet rs=null;
			
			DBBean db=new DBBean();
			String sql=null;
			
			String s1=null;
			String s2=null;
			
			String paper_id=paperid;
			sql="select * from subject where (paperid="+paper_id+" and subjecttype='1') or (paperid="+paperid+" and subjecttype='2') or (paperid="+paperid+" and subjecttype='3')";
			
			System.out.print(sql);
			try{
				con=db.getConnection();
				rs=db.executeQuery(sql);
				
				
				while(rs.next())
				{
					//UserBean user=new UserBean();
					SubjectVO ques=new SubjectVO();
					
					/*System.out.println("******");   
					System.out.println(rs.getString("subjectid"));    
					System.out.println(rs.getString("subjectquestion")); */
					
					s1=rs.getString("subjectquestion");
					s2=rs.getString("subjecttype");
					
					ques.setQuestion(s1);
					ques.setSubType(s2);

					queslist.add(ques);
				}
				

			}catch(Exception e){}
			
			finally
			{
				db.close();
			}
			
			return queslist;
		}
		
		//ģʽ��������Ŀ����
		public ArrayList<SubjectVO> exambuild3(String mode) 
		{
			ArrayList<SubjectVO> queslist=new ArrayList<SubjectVO>();
			String exammode=mode;
			Connection con=null;
			ResultSet rs=null;
			
			DBBean db=new DBBean();
			String sql=null;
			
			String s1=null;
			String s2=null;
			
			sql="select * from subject where subjecttype='1' and subjectlevel='1'";
			
			System.out.print(sql);
			try{
				con=db.getConnection();
				rs=db.executeQuery(sql);
				int i=1;
				while(rs.next())
				{
					SubjectVO ques=new SubjectVO();
					s1=rs.getString("subjectquestion");
					s2=rs.getString("subjectid");
					ques.setQuestion(s1);
					ques.setSubId(s2);
					queslist.add(ques);
					
				}
			}catch(Exception e){}
			
			finally
			{
				db.close();
			}
			
			return queslist;
		}
		
		//ģʽһϵͳ�Զ����ַ���
		public String getAuto1(String user_name,String paper_id,String selectanswer,String fillanswer,String judgeanswer,String simanswer,String disanswer)
		{
	        String username=user_name;
			String paperid=paper_id;
			String choiceanswer=selectanswer;   //ȡ����
	        String blankanswer = fillanswer;
	        String opinionanswer=judgeanswer;
	        String simpleanswer=simanswer;
	        String discussanswer=disanswer;
	        System.out.print("\n*********\n");
			System.out.print(choiceanswer);	
			System.out.print("\n*********\n");
			System.out.print(blankanswer);	
			System.out.print("\n*********\n");
			System.out.print(opinionanswer);	
			System.out.print("\n*********\n");
			System.out.print(simpleanswer);	
			System.out.print("\n*********\n");
			System.out.print(discussanswer);
			System.out.print("\n*********\n");
			
			String[] choice,blank,opinion,simple,discuss;       //��ŷָ��ַ����������
			choice=choiceanswer.split(",");                     //�Դ𰸰����Ž��зָ�
			blank=blankanswer.split(",");
			opinion=opinionanswer.split(",");
			simple=simpleanswer.split(",");
			discuss=discussanswer.split(",");
			String autograde = null;
			
			String s1,s2,s3,s4,s5;         //�ַ��������е�һ��Ԫ��
			int i1=0,i2=0,i3=0,i4=0,i5=0;  //Ԫ�ؼ�����
			int num1=0,num2=0,num3=0,num4=0,num5=0;      //ÿ���Ե�����
			int score1=0,score2=0,score3=0,score4=0,score5=0;  //ÿ��õ��ķ�ֵ
			
			Connection con=null;
			ResultSet rs1=null,rs2=null,rs3=null,rs4=null,rs5=null,rs42,rs52;    //ÿ�����ŵĽ����
			DBBean db=new DBBean();
			String sql1=null,sql2=null,sql3=null,sql4=null,sql5=null;
			sql1="select subjectanswer,point from subject where paperid="+paperid+" and subjecttype="+1;
			sql2="select subjectanswer,point from subject where paperid="+paperid+" and subjecttype="+2;
			sql3="select subjectanswer,point from subject where paperid="+paperid+" and subjecttype="+3;
			//sql4="select subjectanswer,point from subject where paperid="+paperid+"and subjecttype="+4;
			//sql5="select subjectanswer,point from subject where paperid="+paperid+"and subjecttype="+5;
			sql4="select subjectid from subject where paperid="+paperid+" and subjecttype="+4;
			sql5="select subjectid from subject where paperid="+paperid+" and subjecttype="+5;
			
			try
			{
			 con=db.getConnection();
			 rs1=db.executeQuery(sql1);
			 rs2=db.executeQuery(sql2);
			 rs3=db.executeQuery(sql3);
			 rs4=db.executeQuery(sql4);
			 rs5=db.executeQuery(sql5);
			 
			 while(rs1.next())
			 {
			  s1=choice[i1];
			  System.out.print(s1);
			  System.out.print(rs1.getString("subjectanswer"));
			  String ttt=rs1.getString("subjectanswer");
			  if(s1.equals(rs1.getString("subjectanswer")))
			  {
			   num1++;
			   score1=score1+rs1.getInt("point");
			  }
			  i1++;
			 }
			 while(rs2.next())
			 {
			  s2=blank[i2];
			  
			  String[] fill_answer1=rs2.getString("subjectanswer").split("��");
			  String[] fill_answer2=fill_answer1[1].split("��");
			  System.out.print(fill_answer2[0]);
			  //fill_answer=fill_answer[1].split("��");
			  //String fill_answer=rs2.getString("subjectanswer");
			  
			  if(s2.equals(fill_answer2[0]))
			  {
			   num2++;
			   score2=score2+rs2.getInt("point");
			  }
			  i2++;
			 }
			 
			 while(rs3.next())
			 {
			  s3=opinion[i3];
			  if(s3.equals(rs3.getString("subjectanswer")))
			  {
			   num3++;
			   score3=score3+rs3.getInt("point");
			  }
			  i3++;
			 }
			 
			 while(rs4.next())
			 {
			  s4=simple[i4];
			  int simpleid=rs4.getInt("subjectid");
			  String sql41="insert into simple(simpleid,simpleanswer,username,paperid) values('"+simpleid+"','"+s4+"','"+username+"','"+paperid+"')";
			  db.executeUpdate(sql41);
			 }
			 
			 while(rs5.next())
			 {
			  s5=discuss[i5];
			  int discussid=rs5.getInt("subjectid");
			  String sql51="insert into discuss(discussid,discussanswer,username,paperid) values('"+discussid+"','"+s5+"','"+username+"','"+paperid+"')";
			  db.executeUpdate(sql51);
			 }
			 
			 //String grade="��ѡ������"+num1+"��,�õ�"+score1+"��.\n���������"+num2+"��,�õ�"+score2+"��.\n�ж�������"+num3+"��,�õ�"+score3+"��.\nϵͳ�Զ����֣�"+(score1+score2+score3)+"��";
			 //return grade;
			//System.out.print(choice[1]);
			 String sql42="select teacherpoint from simple where username="+username;
				String sql52="select teacherpoint from discuss where username="+username;
				rs42=db.executeQuery(sql42);
				rs52=db.executeQuery(sql52);
				
				/*if(rs42.getString("teacherpoint").equals(null)||rs52.getString("teacherpoint").equals(null))
				{
				 autograde="\n��ѡ������"+num1+"��,�õ�"+score1+"��.\n���������"+num2+"��,�õ�"+score2+"��.\n�ж�������"+num3+"��,�õ�"+score3+"��.\nϵͳ�Զ����֣�"+(score1+score2+score3)+"��\n��ȴ���ʦ����";
				System.out.print(autograde); }
				else if(rs42.getString("teacherpoint")!=null&&rs52.getString("teacherpoint")!=null)
				{
					String simplecore=rs42.getString("teacherpoint");
					String discusscore=rs52.getString("teacherpoint");
					autograde="\n��ѡ������"+num1+"��,�õ�"+score1+"��.\n���������"+num2+"��,�õ�"+score2+"��.\n�ж�������"+num3+"��,�õ�"+score3+"��.\nϵͳ�Զ����֣�"+(score1+score2+score3)+"��\n�����÷֣�"+simplecore+"��\n������÷֣�"+discusscore;
					
				}*/
			}catch(Exception e){}
			
			autograde="\n��ѡ������"+num1+"��,�õ�"+score1+"��.\n���������"+num2+"��,�õ�"+score2+"��.\n�ж�������"+num3+"��,�õ�"+score3+"��.\nϵͳ�Զ����֣�"+(score1+score2+score3)+"��\n��ȴ���ʦ����";
			return autograde;
		}
		
		//ģʽ���������ַ���
		public String checkpaper2(String paper_id,String selectanswer,String fillanswer,String judgeanswer)
		{
			String paperid=paper_id;
			String choiceanswer=selectanswer;
	        String blankanswer=fillanswer;
	        String opinionanswer=judgeanswer;
	        
	        System.out.print("\n*********\n");
			System.out.print(choiceanswer);	
			System.out.print("\n*********\n");
			System.out.print(blankanswer);	
			System.out.print("\n*********\n");
			System.out.print(opinionanswer);	
			System.out.print("\n*********\n");

			String[] choice,blank,opinion;       //��ŷָ��ַ����������
			choice=choiceanswer.split(",");                     //�Դ𰸰����Ž��зָ�
			blank=blankanswer.split(",");
			opinion=opinionanswer.split(",");
			
			String s1,s2,s3;         //�ַ��������е�һ��Ԫ��
			int i1=0,i2=0,i3=0;  //Ԫ�ؼ�����
			int num1=0,num2=0,num3=0;      //ÿ���Ե�����
			int score1=0,score2=0,score3=0;  //ÿ��õ��ķ�ֵ
			
			Connection con=null;
			ResultSet rs1=null,rs2=null,rs3=null;    //ÿ�����ŵĽ����
			DBBean db=new DBBean();
			String sql1=null,sql2=null,sql3=null;
			sql1="select subjectanswer,point from subject where paperid="+paperid+" and subjecttype="+1;
			sql2="select subjectanswer,point from subject where paperid="+paperid+" and subjecttype="+2;
			sql3="select subjectanswer,point from subject where paperid="+paperid+" and subjecttype="+3;
			
			try{
				con=db.getConnection();
				 rs1=db.executeQuery(sql1);
				 rs2=db.executeQuery(sql2);
				 rs3=db.executeQuery(sql3);
				 
				 while(rs1.next())
				 {
				  s1=choice[i1];
				  System.out.print(s1);
				  System.out.print(rs1.getString("subjectanswer"));
				  String ttt=rs1.getString("subjectanswer");
				  if(s1.equals(rs1.getString("subjectanswer")))
				  {
				   num1++;
				   score1=score1+rs1.getInt("point");
				  }
				  i1++;
				 }
				 while(rs2.next())
				 {
				  s2=blank[i2];
				  
				  String[] fill_answer1=rs2.getString("subjectanswer").split("��");
				  String[] fill_answer2=fill_answer1[1].split("��");
				  System.out.print(fill_answer2[0]);
				  //fill_answer=fill_answer[1].split("��");
				  //String fill_answer=rs2.getString("subjectanswer");
				  
				  if(s2.equals(fill_answer2[0]))
				  {
				   num2++;
				   score2=score2+rs2.getInt("point");
				  }
				  i2++;
				 }
				 
				 while(rs3.next())
				 {
				  s3=opinion[i3];
				  if(s3.equals(rs3.getString("subjectanswer")))
				  {
				   num3++;
				   score3=score3+rs3.getInt("point");
				  }
				  i3++;
				 }
				 
			}catch(Exception e){}
			String grade="\n��ѡ������"+num1+"��,�õ�"+score1+"��.\n���������"+num2+"��,�õ�"+score2+"��.\n�ж�������"+num3+"��,�õ�"+score3+"��.\nϵͳ�Զ����֣�"+(score1+score2+score3)+"��\n";
			System.out.print(grade); 
			return grade;
		}
		
		//ģʽһ:�Ѹôο�����Ϣд�����ݿ��exam��
		public void exam1(String user_name,String paper_id,int auto_point)
		{
		 String username=user_name;
		 String paperid=paper_id;
		 int autopoint=auto_point;
		 
		 Connection con=null;
		 ResultSet rs=null;
		 DBBean db=new DBBean();
		 String sql=null;
		 
		 sql="select subjectanswer,point from subject where paperid="+paperid+" and subjecttype="+1;
		 try{
			 
			 
		 }catch(Exception e){}
		}
		
		//ģʽ3�������ַ���
		public void checkpaper3(int subid,int count,int choice,int blank,int judge,String answer,int rightnum,int point1,String id_group)
		{
		 ArrayList<SubjectVO> queslist=new ArrayList<SubjectVO>();
		 Random r=new Random();
		 String[] quesid;
		 
		 if(count==1)
		 idgroup=""+subid;
		 else
		 idgroup=id_group+","+subid;//��¼�Ѿ���ʾ��Ŀ��id,�Ժ����Ŀ�������ظ�
		 
		 System.out.print("*"+idgroup+"*");
		 quesid=idgroup.split(",");
		 //System.out.print("*"+quesid[0]+"*");
		 
		 int i1=0,i2=0,i3=0,nextid=0;  //Ԫ�ؼ�����
		 int num1=0,num2=0,num3=0;      //ÿ���Ե�����
		 int score1=0,score2=0,score3=0;  //ÿ��õ��ķ�ֵ
		 float accuracy=0;
		 boolean b=false;
		 Connection con=null;
			ResultSet rs1=null,rs2=null,rs3=null;    //ÿ�����ŵĽ����
			DBBean db=new DBBean();
			String sql1=null,sql2=null,sql3=null;
			String rsanswer=null;
			String nextques=null;
			String id=null;
			//String nextinfo=null;
			
			int rspoint=0;
			int subtype=0,sublevel=0;
			sql1="select * from subject where subjectid="+subid;
			
			
			try{
				con=db.getConnection();
				rs1=db.executeQuery(sql1);
				
		 if(count>0&count<choice)
		 {
		  subtype=1;
		  if(rs1.next())
		  {
		   rsanswer=rs1.getString("subjectanswer");
		   rspoint=rs1.getInt("point");
		   System.out.print(rsanswer);
		  }
		  
		  if(answer.equals(rsanswer))
		  {
		   rightnum3=rightnum+1;
		   point2=point1+rspoint;
		  }
		  else
		  {
		   rightnum3=rightnum;
		   point2=point1;
		  }
		  
          accuracy=(float)rightnum3/(float)count;
          System.out.print(accuracy);
          
          accuracy=(float)((int)(accuracy*100))/(float)100;//ȡС�������λ
          
          if(accuracy>=0.0&&accuracy<=0.34)
          {
           sublevel=1;
           sql2="select * from subject where subjecttype="+subtype+" and subjectlevel="+sublevel;
           rs2=db.executeQuery(sql2);
           
           while(rs2.next())
           {  
        	SubjectVO ques=new SubjectVO();
        	
        	ques.setSubId(rs2.getString("subjectid"));
			ques.setQuestion(rs2.getString("subjectquestion"));
			ques.setSubType(rs2.getString("subjecttype"));

			queslist.add(ques);
           }
           
           SubjectVO fs=new SubjectVO();
           
           do        //�����һ���id�Ƿ����ظ�
           {
        	nextid=r.nextInt(queslist.size());
        	fs=queslist.get(nextid);
            id=fs.getSubId();
        	for(int m=0;m<quesid.length;m++)
        	{
        	 if(id.equals(quesid[m]))
        		 b=true;
        	 else
        		 b=false;
        	}
           }while(b);
           
           nextques=fs.getQuestion();
           nextinfo=id+"|"+nextques+"|"+accuracy+"|"+sublevel+"|"+rightnum+"|"+point2;
           System.out.println(nextinfo);
           
          }
          else if(accuracy>0.34&&accuracy<=0.67)
          {
           sublevel=2;
           sql2="select * from subject where subjecttype="+subtype+" and subjectlevel="+sublevel;
           rs2=db.executeQuery(sql2);
           
           while(rs2.next())
           {  
        	SubjectVO ques=new SubjectVO();
        	
        	ques.setSubId(rs2.getString("subjectid"));
			ques.setQuestion(rs2.getString("subjectquestion"));
			ques.setSubType(rs2.getString("subjecttype"));

			queslist.add(ques);
           }
           
           SubjectVO fs=new SubjectVO();
           
           do        //�����һ���id�Ƿ����ظ�
           {
        	nextid=r.nextInt(queslist.size());
        	fs=queslist.get(nextid);
            id=fs.getSubId();
        	for(int m=0;m<quesid.length;m++)
        	{
        	 if(id.equals(quesid[m]))
        		 b=true;
        	 else
        		 b=false;
        	}
           }while(b);
           
           nextques=fs.getQuestion();
           nextinfo=id+"|"+nextques+"|"+accuracy+"|"+sublevel+"|"+rightnum+"|"+point2;
           System.out.println(nextinfo);
          }
          else if(accuracy>0.67&&accuracy<=1.0)
          {
           sublevel=3; 
           sql2="select * from subject where subjecttype="+subtype+" and subjectlevel="+sublevel;
           rs2=db.executeQuery(sql2);
           
           while(rs2.next())
           {  
        	SubjectVO ques=new SubjectVO();
        	
        	ques.setSubId(rs2.getString("subjectid"));
			ques.setQuestion(rs2.getString("subjectquestion"));
			ques.setSubType(rs2.getString("subjecttype"));

			queslist.add(ques);
           }
           
           SubjectVO fs=new SubjectVO();
           //int ss=r.nextInt(queslist.size());
           do        //�����һ���id�Ƿ����ظ�
           {
        	nextid=r.nextInt(queslist.size());
        	fs=queslist.get(nextid);
            id=fs.getSubId();
        	for(int m=0;m<quesid.length;m++)
        	{
        	 if(id.equals(quesid[m]))
        		 b=true;
        	 else
        		 b=false;
        	}
           }while(b);
           
           
           nextques=fs.getQuestion();
           System.out.println(id);
           nextinfo=id+"|"+nextques+"|"+accuracy+"|"+sublevel+"|"+rightnum+"|"+point2;
           //System.out.println(nextinfo);
           
          }
		 }
		 else if(count>=choice&count<(choice+blank))   //����ⲿ��
		 {
		  subtype=2; 
		  if(rs1.next())
		  {
		   rsanswer=rs1.getString("subjectanswer");
		   rspoint=rs1.getInt("point");
		   System.out.print(rsanswer);
		  }
		  
		  if(answer.equals(rsanswer))
		  {
		   rightnum3=rightnum+1;
		   point2=point1+rspoint;
		  }
		  else
		  {
		   rightnum3=rightnum;
		   point2=point1;
		  }
		  
          accuracy=(float)rightnum3/(float)count;
          accuracy=(float)((int)(accuracy*100))/(float)100;//ȡС�������λ
          
		  if(accuracy>=0.0&&accuracy<=0.34)
          {
           sublevel=1;
           sql2="select * from subject where subjecttype="+subtype+" and subjectlevel="+sublevel;
           rs2=db.executeQuery(sql2);
           
           while(rs2.next())
           {  
        	SubjectVO ques=new SubjectVO();
        	
        	ques.setSubId(rs2.getString("subjectid"));
			ques.setQuestion(rs2.getString("subjectquestion"));
			ques.setSubType(rs2.getString("subjecttype"));

			queslist.add(ques);
           }
           
           SubjectVO fs=new SubjectVO();
           do        //�����һ���id�Ƿ����ظ�
           {
        	nextid=r.nextInt(queslist.size());
        	fs=queslist.get(nextid);
            id=fs.getSubId();
        	for(int m=0;m<quesid.length;m++)
        	{
        	 if(id.equals(quesid[m]))
        		 b=true;
        	 else
        		 b=false;
        	}
           }while(b);
           
           
           nextques=fs.getQuestion();
           nextinfo=id+"|"+nextques+"|"+accuracy+"|"+sublevel+"|"+rightnum+"|"+point2;
           System.out.println(nextinfo);
           
          }
          else if(accuracy>0.34&&accuracy<=0.67)
          {
           sublevel=2;
           sql2="select * from subject where subjecttype="+subtype+" and subjectlevel="+sublevel;
           rs2=db.executeQuery(sql2);
           
           while(rs2.next())
           {  
        	SubjectVO ques=new SubjectVO();
        	
        	ques.setSubId(rs2.getString("subjectid"));
			ques.setQuestion(rs2.getString("subjectquestion"));
			ques.setSubType(rs2.getString("subjecttype"));

			queslist.add(ques);
           }
           
           SubjectVO fs=new SubjectVO();
           do        //�����һ���id�Ƿ����ظ�
           {
        	nextid=r.nextInt(queslist.size());
        	fs=queslist.get(nextid);
            id=fs.getSubId();
        	for(int m=0;m<quesid.length;m++)
        	{
        	 if(id.equals(quesid[m]))
        		 b=true;
        	 else
        		 b=false;
        	}
           }while(b);
           
           nextques=fs.getQuestion();
           nextinfo=id+"|"+nextques+"|"+accuracy+"|"+sublevel+"|"+rightnum+"|"+point2;
           System.out.println(nextinfo);
          }
          else if(accuracy>0.67&&accuracy<=1.0)
          {
           sublevel=3; 
           sql2="select * from subject where subjecttype="+subtype+" and subjectlevel="+sublevel;
           rs2=db.executeQuery(sql2);
           
           while(rs2.next())
           {  
        	SubjectVO ques=new SubjectVO();
        	
        	ques.setSubId(rs2.getString("subjectid"));
			ques.setQuestion(rs2.getString("subjectquestion"));
			ques.setSubType(rs2.getString("subjecttype"));

			queslist.add(ques);
           }
           
           SubjectVO fs=new SubjectVO();
           //int ss=r.nextInt(queslist.size());
           do        //�����һ���id�Ƿ����ظ�
           {
        	nextid=r.nextInt(queslist.size());
        	fs=queslist.get(nextid);
            id=fs.getSubId();
        	for(int m=0;m<quesid.length;m++)
        	{
        	 if(id.equals(quesid[m]))
        		 b=true;
        	 else
        		 b=false;
        	}
           }while(b);
           
           nextques=fs.getQuestion();
           System.out.println(id);
           nextinfo=id+"|"+nextques+"|"+accuracy+"|"+sublevel+"|"+rightnum+"|"+point2;}
		  
		 }
		 else if(count>=(choice+blank)&count<=(choice+blank+judge))
		 {
			 subtype=3; 
			  if(rs1.next())
			  {
			   rsanswer=rs1.getString("subjectanswer");
			   rspoint=rs1.getInt("point");
			   System.out.print(rsanswer);
			  }
			  
			  if(answer.equals(rsanswer))
			  {
			   rightnum3=rightnum+1;
			   point2=point1+rspoint;
			  }
			  else
			  {
			   rightnum3=rightnum;
			   point2=point1;
			  }
			  
	          accuracy=(float)rightnum3/(float)count;
	          accuracy=(float)((int)(accuracy*100))/(float)100;//ȡС�������λ 
	          
	          if(accuracy>=0.0&&accuracy<=0.34)
	          {
	           sublevel=1;
	           sql2="select * from subject where subjecttype="+subtype+" and subjectlevel="+sublevel;
	           rs2=db.executeQuery(sql2);
	           
	           while(rs2.next())
	           {  
	        	SubjectVO ques=new SubjectVO();
	        	
	        	ques.setSubId(rs2.getString("subjectid"));
				ques.setQuestion(rs2.getString("subjectquestion"));
				ques.setSubType(rs2.getString("subjecttype"));

				queslist.add(ques);
	           }
	           
	           SubjectVO fs=new SubjectVO();
	           do        //�����һ���id�Ƿ����ظ�
	           {
	        	nextid=r.nextInt(queslist.size());
	        	fs=queslist.get(nextid);
	            id=fs.getSubId();
	        	for(int m=0;m<quesid.length;m++)
	        	{
	        	 if(id.equals(quesid[m]))
	        		 b=true;
	        	 else
	        		 b=false;
	        	}
	           }while(b);
	           
	           
	           nextques=fs.getQuestion();
	           nextinfo=id+"|"+nextques+"|"+accuracy+"|"+sublevel+"|"+rightnum+"|"+point2;
	           System.out.println(nextinfo);
	           
	          }
	          else if(accuracy>0.34&&accuracy<=0.67)
	          {
	           sublevel=2;
	           sql2="select * from subject where subjecttype="+subtype+" and subjectlevel="+sublevel;
	           rs2=db.executeQuery(sql2);
	           
	           while(rs2.next())
	           {  
	        	SubjectVO ques=new SubjectVO();
	        	
	        	ques.setSubId(rs2.getString("subjectid"));
				ques.setQuestion(rs2.getString("subjectquestion"));
				ques.setSubType(rs2.getString("subjecttype"));

				queslist.add(ques);
	           }
	           
	           SubjectVO fs=new SubjectVO();
	           do        //�����һ���id�Ƿ����ظ�
	           {
	        	nextid=r.nextInt(queslist.size());
	        	fs=queslist.get(nextid);
	            id=fs.getSubId();
	        	for(int m=0;m<quesid.length;m++)
	        	{
	        	 if(id.equals(quesid[m]))
	        		 b=true;
	        	 else
	        		 b=false;
	        	}
	           }while(b);
	           
	           nextques=fs.getQuestion();
	           nextinfo=id+"|"+nextques+"|"+accuracy+"|"+sublevel+"|"+rightnum+"|"+point2;
	           System.out.println(nextinfo);
	          }
	          else if(accuracy>0.67&&accuracy<=1.0)
	          {
	           sublevel=3; 
	           sql2="select * from subject where subjecttype="+subtype+" and subjectlevel="+sublevel;
	           rs2=db.executeQuery(sql2);
	           
	           while(rs2.next())
	           {  
	        	SubjectVO ques=new SubjectVO();
	        	
	        	ques.setSubId(rs2.getString("subjectid"));
				ques.setQuestion(rs2.getString("subjectquestion"));
				ques.setSubType(rs2.getString("subjecttype"));

				queslist.add(ques);
	           }
	           
	           SubjectVO fs=new SubjectVO();
	           //int ss=r.nextInt(queslist.size());
	           do        //�����һ���id�Ƿ����ظ�
	           {
	        	nextid=r.nextInt(queslist.size());
	        	fs=queslist.get(nextid);
	            id=fs.getSubId();
	        	for(int m=0;m<quesid.length;m++)
	        	{
	        	 if(id.equals(quesid[m]))
	        		 b=true;
	        	 else
	        		 b=false;
	        	}
	           }while(b);
	           
	           nextques=fs.getQuestion();
	           System.out.println(id);
	           nextinfo=id+"|"+nextques+"|"+accuracy+"|"+sublevel+"|"+rightnum+"|"+point2;}
	          
			 
		 }
			}catch(Exception e){}
			
			
		}
}
