<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>

<%@include file="DBconn.jsp" %>

<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String nic = request.getParameter("nic");
	String phone = request.getParameter("phone");
	sql ="SELECT * FROM user";
	if(name!="" || email != "" || nic != "" || phone != ""){
		sql = sql + " WHERE";
		if(name != ""){
			sql = sql + " name LIKE '%" + name + "%'";
			System.out.println(sql);
		}
		if(email != ""){
			if(name != ""){
				sql = sql + " OR email LIKE '%" + email + "%'";
				System.out.println(sql);
			} else{
				sql = sql + " email LIKE '%" + email + "%'";
				System.out.println(sql);
			}
		}
		if(nic != ""){
			if(name == "" && email == ""){
				sql = sql + " nic LIKE '%" + nic + "%'";
				System.out.println(sql);
			} else{
				sql = sql + " OR nic LIKE '%" + nic + "%'";
				System.out.println(sql);
			}
		}
		if(phone != ""){
			if(name == "" && email == "" && nic == ""){
				sql = sql + " phone LIKE '%" + phone + "%'";
				System.out.println(sql);
			} else{
				sql = sql + " OR phone LIKE '%" + phone + "%'";
				System.out.println(sql);
			}
		}
	}
	
%>

<html>
	<body>
		<form id="slist" action="" method="POST">
			<input type="text" name="id" id="id" hidden />
			<div>
				<div>
					<input type="text" id="name" name="name" placeholder="Name">
					<input type="text" id="email" name="email" placeholder="Email">
					<input type="text" id="nic" name="nic" placeholder="NIC">
					<input type="text" id="phone" name="phone" placeholder="Phone">
				</div>
				<br /><br />
				<div>
					<button type="button" onclick="back();">Back</button>
					<button type="button" onclick="search();">Search</button>
					<button type="reset">Clear</button>
				</div>
			</div>
			<div>
				<h1 id="fid">Filtered Applicant List</h1>
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
				rs = st.executeQuery(sql);
				if(!rs.next()){
		%>
					<tr>
						<td>no data</td>
						<td>no data</td>
						<td>no data</td>
						<td>no data</td>
						<td>no data</td>
					</tr>				
		<%
				} else{
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
					}while(rs.next());
				}
				connection.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
		%>
				</table>
			</div>
		</form>

	</body>
	
	<script>
		function back()
		{
			document.getElementById('slist').action = "index.jsp";
			document.getElementById('slist').submit();
		}
		
		function search()
		{
			var name = document.getElementById('name').value;
			var email = document.getElementById('email').value;
			var nic = document.getElementById('nic').value;
			var phone = document.getElementById('phone').value;
			
			if(name || email || nic || phone){
				document.getElementById('slist').action = "searchlist.jsp";
				document.getElementById('slist').submit();
			} else{
				alert("Invalid Search");			
			}
		}
		function view(id)
		{
			document.getElementById('id').value = id;
			document.getElementById('slist').action = "view.jsp";
			document.getElementById('slist').submit();
		}
	</script>
</html>