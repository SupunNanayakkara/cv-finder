<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>

<%@include file="DBconn.jsp" %>

<!DOCTYPE html>
<html>
	<body>

		<h1>All the Applicants</h1>
		<table border="1">
			<tr>
				<td>Name</td>
				<td>Email</td>
				<td>NIC</td>
				<td>Phone</td>
				<td></td>
			</tr>
		<%
			try
			{
				connection = DriverManager.getConnection(connectionUrl+database, userid, password);
				st=connection.createStatement();
				sql ="SELECT * FROM user ORDER BY id DESC";
				rs = st.executeQuery(sql);
				if(rs.next()){
					do{
		%>
			<tr>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("email") %></td>
				<td><%=rs.getString("nic") %></td>
				<td><%=rs.getString("phone") %></td>
				<td><button type="button" onclick="view(<%=rs.getInt("id")%>)">View</button></td>
			</tr>
		<%
					} while(rs.next());
				} else{
		%>

			<tr>
				<td>no data</td>
				<td>no data</td>
				<td>no data</td>
				<td>no data</td>
				<td>no data</td>
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