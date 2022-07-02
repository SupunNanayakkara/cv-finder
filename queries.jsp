<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>\

<%@include file="DBconn.jsp" %>

<%
	String pid = request.getParameter("pid");
	String id = request.getParameter("id");
	String name = request.getParameter("appname");
	String email = request.getParameter("appemail");
	String nic = request.getParameter("appnic");
	String phone = request.getParameter("appphone");
	PreparedStatement pst = null;
	String res;
	System.out.println("pid:"+pid);
	try{
		connection = DriverManager.getConnection(connectionUrl+database, userid, password);
		if(pid.equals("new")){
			pst = connection.prepareStatement("INSERT INTO user(name, email, nic, phone) VALUES(?,?,?,?)");
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, nic);
			pst.setString(4, phone);
			System.out.println(pst);
			pst.executeUpdate();
			pst.close();
			connection.close();
			res = "Successful";
			request.setAttribute("result",res);
		}else if(pid.equals("edit")){
			pst = connection.prepareStatement("UPDATE user SET name=?, email=?, nic=?, phone=? WHERE id=?");
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, nic);
			pst.setString(4, phone);
			pst.setString(5, id);
			
			pst.executeUpdate();
			pst.close();
			connection.close();
			res = "Successful";
			request.setAttribute("result",res);
		}else if(pid.equals("delete")){
			pst = connection.prepareStatement("DELETE FROM user WHERE id=?");
			pst.setString(1, id);
			
			pst.executeUpdate();
			pst.close();
			connection.close();
			res = "Successful";
			request.setAttribute("result",res);
		}
	}catch(SQLException e){
			e.printStackTrace();
			res = "Unsuccessful";
			request.setAttribute("result",res);
    }
	
    request.getRequestDispatcher("index.jsp").forward(request, response);
	  
%>