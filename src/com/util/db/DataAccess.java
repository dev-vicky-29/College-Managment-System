package com.util.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataAccess {

	public Connection cn;
	public ResultSet rs;
	
	public DataAccess()	{
		
	}
	public void connectToServer() throws Exception{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/collegedb","root","VICK2909");
		
	}
	public void closeConnection() throws Exception{
		
		cn.close();		
	}
	//execute insert,update and delete command
	//insert into stud values(?,?,?)
	public int executeSql(String sql,Object ... params) throws Exception{
		connectToServer();
		PreparedStatement ps=cn.prepareStatement(sql);
		int i=1;
		for(Object prm : params){
			ps.setObject(i, prm);
			i++;
		}
		int result=ps.executeUpdate();
		closeConnection();
		return result;
		
	}
	//execute insert,update and delete command
	//insert into stud (Name,Address) values(?,?)
	public int executeSqlId(String sql,Object ... params) throws Exception{
		connectToServer();
		PreparedStatement ps=cn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		int i=1;
		for(Object prm : params){
			ps.setObject(i, prm);
			i++;
		}
		int result=ps.executeUpdate();
		ResultSet rs=ps.getGeneratedKeys();
		rs.next();
		result=rs.getInt(1);
		closeConnection();
		return result;
		
	}
	public boolean isExists(String sql,String ... params) throws Exception{
		boolean flag=false;
		connectToServer();
		PreparedStatement ps=cn.prepareStatement(sql);
		int i=1;
		for(String prm : params){
			ps.setString(i, prm);
			i++;
		}
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			flag=true; 
		}
		
		closeConnection();
		return flag;
		
	}
	//select * from stud where rollno=? , 100
	public ResultSet getRows(String sql,Object ... params) throws Exception{
		
		connectToServer();
		PreparedStatement ps=cn.prepareStatement(sql);
		int i=1;
		for(Object prm : params){
			ps.setObject(i, prm);
			i++;
		}
		rs=ps.executeQuery();
		//closeConnection();
		return rs;
		
	}
	public ResultSet getRows2(String sql,Object ... params) throws Exception{
	
		ResultSet rss;
		connectToServer();
		PreparedStatement ps=cn.prepareStatement(sql);
		int i=1;
		for(Object prm : params){
			ps.setObject(i, prm);
			i++;
		}
		rss=ps.executeQuery();
		//closeConnection();
		return rss;
		
	}
	
}
