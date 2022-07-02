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
%>
<!DOCTYPE html>
<html>
	<body>

		<h1>Retrieve data from database in jsp</h1>
		<table border="1">
		<tr>
		<td></td>
		<td>Name</td>
		<td>Email</td>
		<td>NIC</td>
		<td>Phone</td>

		</tr>
		<%
			try
			{
				connection = DriverManager.getConnection(connectionUrl+database, userid, password);
				st=connection.createStatement();
				String sql ="select * from user";
				rs = st.executeQuery(sql);
				while(rs.next()){
		%>
		<tr>
			<!--<td><a href="view.jsp?id=<%=rs.getInt("id")%>">View</a></td>-->
			<td><button onclick="view(<%=rs.getInt("id")%>)">View</button></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("email") %></td>
			<td><%=rs.getString("nic") %></td>
			<td><%=rs.getString("phone") %></td>
		</tr>
		<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		</table>
	</body>
</html>