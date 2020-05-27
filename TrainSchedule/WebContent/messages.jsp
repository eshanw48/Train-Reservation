<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Messages</title>
</head>
<body>


<form method="post" action="postQuestions.jsp">
		<table>
			<tr>    
				<td>Ask a Question</td><td><input type="text" name="question"></td>
			</tr>
			
		</table>
		<input type="submit" value="Submit">
	</form>

<br />


<form method="post" action="searchQuestionsWithAnswers.jsp">
		<table>
			<tr>    
				<td>Search for questions with answers</td><td><input type="text" name="questionSearch"></td>
			</tr>
			
		</table>
		<input type="submit" value="Search">
	</form>


<br />

<button onclick="location.href='viewQuestionsWithAnswers.jsp';">View all questions and answers</button> 


<%
String username = (String)session.getAttribute("username");

%>



</body>
</html>