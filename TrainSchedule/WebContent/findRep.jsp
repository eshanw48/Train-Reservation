<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Find Rep Account</title>
</head>
<body>



	<%
	try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String entity = request.getParameter("ssn");
		String entity1= request.getParameter("firstname");
		String entity2= request.getParameter("lastname");
		String str ="SELECT * FROM Employee WHERE ssn="+"'"+entity+"'";
		ResultSet result = stmt.executeQuery(str); //table with all e
	
		
		if(!result.next()){
			out.print("No record of employee found");
		}
		else{
			session.setAttribute("firstname", request.getParameter("firstname"));
			session.setAttribute("lastname", request.getParameter("lastname"));
			session.setAttribute("ssn",request.getParameter("ssn"));
			session.setAttribute("bookingFee","10");
			response.sendRedirect("customerRep.jsp");
		}
		
	}

	catch (Exception e){}
%>

<br>
	<form method="post" action="index.jsp">
		<input type="submit" value="Logout">
	</form>
<br>

</body>
</html>
