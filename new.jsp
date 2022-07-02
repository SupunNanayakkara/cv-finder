<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>


<html>
	<body>
		<h2>NEW APPLICANT</h2>

		<form action="queries.jsp" method="POST">
		
			<input type="text" id="pid" name="pid" value="new" hidden><br>
			<input type="text" name="id" id="id" value="0" hidden />
		
			<label for="name">Name:</label><br>
			<input type="text" id="appname" name="appname" ><br>
			
			<label for="email">Email:</label><br>
			<input type="text" id="appemail" name="appemail"><br>
			
			<label for="nic">NIC:</label><br>
			<input type="text" id="appnic" name="appnic"><br>
			
			<label for="phone">Phone:</label><br>
			<input type="text" id="appphone" name="appphone"><br><br>

			<input type="submit" value="CREATE">
			
		</form> 
	</body>
</html>