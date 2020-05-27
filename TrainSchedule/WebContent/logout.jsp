<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>

<%
if (request.getParameter("home") != null) {
	session.removeAttribute("departureStation");
	session.removeAttribute("arrivalStation");
	session.removeAttribute("date");
	session.removeAttribute("arg");
	session.removeAttribute("home");
	response.sendRedirect("home.jsp");
} else {
	session.invalidate();
	response.sendRedirect("index.jsp");
}
%>

</body>
</html>