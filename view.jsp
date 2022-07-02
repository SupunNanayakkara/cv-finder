<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>

<%@include file="DBconn.jsp" %>

<html>
	<body>
		<h2>VIEW APPLICANT</h2>

		<form id="view" action="queries.jsp" method="POST">
		
			<input type="text" id="pid" name="pid" hidden><br>
			
			<%
				try
				{
					String id = request.getParameter("id");
					connection = DriverManager.getConnection(connectionUrl+database, userid, password);
					st=connection.createStatement();
					sql ="SELECT * FROM user WHERE id = '"+id+"'";
					rs = st.executeQuery(sql);
					if(rs.next()){
			%>
			<input type="text" name="id" id="id" value=<%=rs.getInt("id") %> hidden />

			<label for="name">Name:</label><br>
			<input type="text" id="appname" name="appname" value="<%=rs.getString("name")%>" /><br>
			
			<label for="email">Email:</label><br>
			<input type="text" id="appemail" name="appemail" value="<%=rs.getString("email") %>" /><br>
			
			<label for="nic">NIC:</label><br>
			<input type="text" id="appnic" name="appnic" value="<%=rs.getString("nic") %>" /><br>
			
			<label for="phone">Phone:</label><br>
			<input type="text" id="appphone" name="appphone" value="<%=rs.getString("phone") %>" /><br><br>
			
			<%
				}
				connection.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
			<button type="button" onclick="editRec()">Edit</button><br><br>
			<button type="button" onclick="deleteRec()">Delete</button>
			
		</form> 
	</body>
	
	<script>
		function editRec()
		{
			document.getElementById('pid').value = "edit";
			document.getElementById('view').action = "queries.jsp";
			document.getElementById('view').submit();
		}
		
		function deleteRec()
		{
			document.getElementById('pid').value = "delete";
			document.getElementById('view').action = "queries.jsp";
			document.getElementById('view').submit();
		}
	</script>
	
</html>