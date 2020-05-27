<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post Answer</title>
</head>
<body>

	<%
	//Get parameters from the HTML form at the index.jsp
			String answer = request.getParameter("answer");
			String username = (String)session.getAttribute("username");
			String QuestionId = request.getParameter("QuestionId");
	
	
	
	
	
%>


<form method = "post" action = "sendAnswer.jsp">

<input type="hidden" name="QuestionId" value="<%=QuestionId%>">

Answer Question<input type="text" name="answer">

<input type="submit" value="Answer">

</form>


</body>
</html>