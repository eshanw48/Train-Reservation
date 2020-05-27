<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Employee</title>

<script language="javascript">
	function doEdit(ssn) {
		//send the admin back to edit jsp page
		var f = document.form;
		f.method = "post";
		f.action = "AdminEditEmployeeExecution.jsp?issn="+ssn;
		f.submit();
	}
</script>
<style type="text/css">
h1 {
	text-align: center;
}
</style>
</head>
<body>
<h1>Edit Employee</h1>
<hr style="width:100%; text-align:left; margin-left:0">
	<%
	//Get the ssn from the request
	Enumeration en = request.getParameterNames();
	String paramName = (String)en.nextElement();
	String paramValue = request.getParameter(paramName);
	
	try {	
		//connect to the database
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		//access the tuple from the ssn
		String str = "SELECT * FROM Employee WHERE ssn=" + paramValue;
		ResultSet result = stmt.executeQuery(str);
		//make result point to the correct tuple
		result.next();
		
		
	%>
	<form method="post" name="form">
		<table>
			<tr>
				<td>First Name</td><td><input type="text" name="fname"
					value="<%=result.getString("FirstName")%>"></td>
			</tr>
			<tr>
				<td>Last Name</td><td><input type="text" name="lname"
					value="<%=result.getString("LastName")%>"></td>
			</tr>
			<tr>
				<td>SSN</td><td><input type="text" name="ssn"
					value="<%=result.getString("ssn")%>"></td>
			</tr>
		</table>
		
		<button type="button" onclick="doEdit(&quot;<%=result.getString("ssn")%>&quot);">Make Changes</button>
		
		<% 
			}
			catch(Exception e){
				out.print("Database not accessed");
			}
			%>
		
	</form>


</body>
</html>