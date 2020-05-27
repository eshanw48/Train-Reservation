<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Search Results</title>

<script language="javascript">
	function deleteAccountEmployee(ssn){
		var f=document.form;
		f.method="post";
		f.action="AdminDelete/AdminDeleteEmployee.jsp?ssn="+ssn;
		f.submit();
	}
	
	function deleteAccountCustomer(username){
		var f=document.form;
		f.method="post";
		f.action="AdminDelete/AdminDeleteCustomer.jsp?username="+username;
		f.submit();
	}
	
	function editAccountEmployee(ssn){
		var f=document.form;
		f.method="post";
		f.action="AdminEdit/AdminEditEmployee.jsp?ssn="+ssn;
		f.submit();
	}
	
	function editAccountCustomer(username){
		var f=document.form;
		f.method="post";
		f.action="AdminEdit/AdminEditCustomer.jsp?username="+username;
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

	<h1>Search Results</h1>
	<hr style="width:100%; text-align:left; margin-left:0">
	<br> Employees:
	<form method="post" name="form">
		<table border="1">
			<tr>
				<td><b>Last Name</b></td>
				<td><b>First Name</b></td>
				<td><b>SSN</b></td>
				<td></td>
			</tr>

			<%
				try {
				//get a connection to the database
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				Statement stmt = con.createStatement();
				Statement stmt2 = con.createStatement();

				//get the parameters from the Admin Search Request
				String entity = request.getParameter("fname");
				String entity2 = request.getParameter("lname");

				//the queries to obtain the customers 
				//and employees that match the search
				String CustomerStr = "SELECT * FROM Customer WHERE FirstName=" + "'" + entity + "'" + "AND LastName=" + "'"
				+ entity2 + "'";
				String EmployeeStr = "SELECT * FROM Employee WHERE FirstName=" + "'" + entity + "'" + "AND LastName=" + "'"
				+ entity2 + "'";

				//execute the queries
				ResultSet CustomerResult = stmt.executeQuery(CustomerStr);
				ResultSet EmployeeResult = stmt2.executeQuery(EmployeeStr);

				//make a table of employees
				while (EmployeeResult.next()) {
			%>

			<tr>
				<td><%=EmployeeResult.getString("LastName")%></td>
				<td><%=EmployeeResult.getString("FirstName")%></td>
				<td><%=EmployeeResult.getString("ssn")%></td>

				<td>
					<button type="button"
						onclick="deleteAccountEmployee(<%=EmployeeResult.getString("ssn")%>);">
						Delete</button>

					<button type="button"
						onclick="editAccountEmployee(<%=EmployeeResult.getString("ssn")%>);">
						Edit</button>

				</td>

			</tr>

			<%
				}
			%>
		</table>

		<br> Customers:

		<table border="1">
			<tr>
				<td><b>Last Name</b></td>
				<td><b>First Name</b></td>
				<td><b>State</b></td>
				<td><b>City</b></td>
				<td><b>Phone</b></td>
				<td><b>Zip Code</b></td>
				<td><b>Email</b></td>
				<td><b>Username</b></td>
				<td><b>Password</b></td>
				<td></td>
			</tr>
			<%
				//make a table of customers
			while (CustomerResult.next()) {
			%>
			<tr>
				<td><%=CustomerResult.getString("FirstName")%></td>
				<td><%=CustomerResult.getString("LastName")%></td>
				<td><%=CustomerResult.getString("state")%></td>
				<td><%=CustomerResult.getString("city")%></td>
				<td><%=CustomerResult.getString("phone")%></td>
				<td><%=CustomerResult.getString("zipcode")%></td>
				<td><%=CustomerResult.getString("email")%></td>
				<td><%=CustomerResult.getString("username")%></td>
				<td><%=CustomerResult.getString("password")%></td>

				<td>
					<button type="button"
						onclick="deleteAccountCustomer(&quot;<%=CustomerResult.getString("username")%>&quot;);">
						Delete</button>

					<button type="button"
						onclick="editAccountCustomer(&quot;<%=CustomerResult.getString("username")%>&quot;);">
						Edit</button>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</form>
	<%
		}

	catch (Exception e) {
		out.println(e);
	}
	%>
<form method="post" action="AdminHome.jsp">
	<input type="submit" value="Cancel">
</form>

</body>
</html>