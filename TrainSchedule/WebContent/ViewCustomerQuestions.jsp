<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>View Customer Questions</title>
</head>
<body>


<form method="post" action="postAnswer.jsp">
		
	
<br />



<table border = "2">
<tr>

<td>Username</td>
<td>Question</td>
<td>Answer</td>

</tr>

<%

try{
	
	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	
	//Create a SQL statement
	Statement stmt = con.createStatement();	
	
	String str = "SELECT * FROM Messages WHERE AnswerDescription IS NULL";
	
	ResultSet result = stmt.executeQuery(str);
	
	while(result.next()){
		
		
		
		%>
		
			<tr>
			<td><%=result.getString("username") %></td>
			<td><%=result.getString("QuestionDescription") %></td>
			<td><a href="postAnswer.jsp?QuestionId=<%=result.getString("QuestionId")%>">Answer</a></td>
			</tr>
			
			<%
			
			
			
	}
			%>
			
			</table>
			<%
			
						
			
			result.close();
			stmt.close();
			con.close();
			
	
}
catch (Exception ex) {
	out.print("Error retrieving questions");
}

%>


</form>


</body>
</html>