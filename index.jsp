<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>


<html>
	<body>
		<form id="idx" method="POST">
			<%
				String result= (String) request.getAttribute("result");
				if(result != null){
					if(result=="Successful"){
			%>
				<script>
					alert("Query Executed Successfully!!!");
					document.getElementById('idx').action = "index.jsp";
					document.getElementById('idx').submit();
				</script>		
			<%
				} else if(result=="Unsuccessful"){
			%>
				<script>
					alert("Error Occured During Query Executed!!!");
					document.getElementById('idx').action = "index.jsp";
					document.getElementById('idx').submit();
				</script>	
			<%
					}
				}	
				request.setAttribute("result",null);
			%>
			<input type="text" name="id" id="id" hidden />
			<div>
				<!--<label for="name">Name:</label><br>-->
				<div>
					<input type="text" id="name" name="name" placeholder="Name">
					<input type="text" id="email" name="email" placeholder="Email">
					<input type="text" id="nic" name="nic" placeholder="NIC">
					<input type="text" id="phone" name="phone" placeholder="Phone">
				</div>
				<br /><br />
				<div>
					<button type="reset">Clear</button>
					<button type="button" onclick="search()">Search</button>
					<button type="button" onclick="add()">New</button>
				</div>
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
		
		function search()
		{
			var name = document.getElementById('name').value;
			var email = document.getElementById('email').value;
			var nic = document.getElementById('nic').value;
			var phone = document.getElementById('phone').value;
			
			if(name || email || nic || phone){
				document.getElementById('idx').action = "searchlist.jsp";
				document.getElementById('idx').submit();
			}else{
				alert("Invalid Search");			
			}
		}
		
		function add(){
			document.getElementById('idx').action = "new.jsp";
			document.getElementById('idx').submit();
		}
	</script>
</html>

