<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>

<%
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String database = "test";
	String userid = "root";
	String password = "";
	try 
	{
		Class.forName(driver);
	} 
	catch(ClassNotFoundException e) 
	{
		e.printStackTrace();
	}
	Connection connection = null;
	Statement st = null;
	ResultSet rs = null;
	String sql;
%>