<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Customer</title>

<script language="javascript">
	function doEdit(iUsername) {
		//send the admin back to edit jsp page
		var f = document.form;
		f.method = "post";
		f.action = "AdminEditCustomerExecution.jsp?iUsername="+iUsername;
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
<h1>Edit Customer</h1>
<hr style="width:100%; text-align:left; margin-left:0">
	<%
		//Get the ssn from the request
	Enumeration en = request.getParameterNames();
	String paramName = (String) en.nextElement();
	String paramValue = request.getParameter(paramName);

	try {
		//connect to the database
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();

		String str = "SELECT * FROM Customer WHERE username= '" + paramValue + "'";
		ResultSet result = stmt.executeQuery(str);

		result.next();
	%>
	<form method="post" name="form">
		<table>
			<tr>
				<td>Username</td>
				<td><input type="text" name="username"
					value=<%=result.getString("username")%>></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="password"
					value=<%=result.getString("password")%>></td>
			</tr>
			<tr>
				<td>State</td>
				<td><input type="text" name="state"
					value=<%=result.getString("state")%>></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="fname"
					value=<%=result.getString("FirstName")%>></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lname"
					value=<%=result.getString("LastName")%>></td>
			</tr>
			<tr>
				<td>City</td>
				<td><input type="text" name="city"
					value=<%=result.getString("city")%>></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input type="text" name="phone"
					value=<%=result.getString("phone")%>></td>
			</tr>
			<tr>
				<td>Zipcode</td>
				<td><input type="text" name="zipcode"
					value=<%=result.getString("zipcode")%>></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email"
					value=<%=result.getString("email")%>></td>
			</tr>
		</table>

		<button type="button" onclick="doEdit(&quot;<%=result.getString("username")%>&quot);">Make Changes</button>

		<%
			} catch (Exception e) {
			out.print("Database not accessed");
		}
		%>

	</form>
</body>
</html>