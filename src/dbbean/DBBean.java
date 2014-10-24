package dbbean;

import java.sql.*;

public class DBBean 
{
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	
	public DBBean(){}
	
	//得到连接
	public Connection getConnection() throws Exception
	{
		//连接数据库的URL
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=OnlineExam";
		String user = "xiedongtian";
		String pwd = "201130760326";
		
		
			try
			{	
				System.out.println("1");
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
				System.out.println("2");
				con = DriverManager.getConnection(url, user, pwd);
				System.out.println("3");
			}catch (Exception e){
				e.printStackTrace();
			}
			return con;
		}
		
	
	//执行有结果集返回的sql语句
	public ResultSet executeQuery(String sql)throws Exception
	{
	   if(con==null)
		   throw new Exception("没有连接对象可用");
	   //创建语句对象
	   stmt=con.createStatement();
	   rs=stmt.executeQuery(sql);
	   
	   return rs;
	   
	}
	
	//执行更新语句
	public int executeUpdate(String sql) throws Exception
	{
		if(con==null)
			throw new Exception("没有对象连接可用");
		stmt=con.createStatement();
		return stmt.executeUpdate(sql);
	}
	
	public void close()
	{
		try{if(rs!=null) rs.close();}catch(Exception e){}
		try{stmt.close();}catch(Exception e){}
		try{con.close();}catch(Exception e){}
		
	}
}
