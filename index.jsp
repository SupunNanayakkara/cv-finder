<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>

<html>
	<body>
		<form id="idx" action="index.jsp" method="POST">
			<input type="text" name="id" id="id" hidden />
			<div>
				<!--<label for="name">Name:</label><br>-->
				<div><input type="text" id="name" name="name" placeholder="name"></div>
				<div><input type="text" id="email" name="email" placeholder="email"></div>
				<div><input type="text" id="nic" name="nic" placeholder="nic"></div>
				<div><input type="text" id="phone" name="phone" placeholder="phone"></div>
				<input type="submit" value="Submit">
			</div>
			<div>
				<%@include file="list.jsp" %>
			</div>
		</form>

	</body>
	
	<script>
		function view(id)
		{
			document.getElementById('id').value = id;
			document.getElementById('idx').action = "view.jsp";
			document.getElementById('idx').submit();
		}
	</script>
</html>

