<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Revenue Search</title>
<script language="javascript">
	function toRevTranLine() {
		var f = document.form;
		var f = document.form;
		f.method = "post";
		var transitLine = document.getElementById("revenueTransitLine").value;
		f.action = "RevByTransit.jsp?transitLine=" + transitLine;
		f.submit();
	}

	function toRevDesCity() {
		var f = document.form;
		var f = document.form;
		f.method = "post";
		var destCity = document.getElementById("revenueDestinationCity").value;
		f.action = "RevByCity.jsp?destCity=" + destCity;
		f.submit();
	}

	function toRevCusName() {
		var f = document.form;
		var f = document.form;
		f.method = "post";
		var fname = document.getElementById("revenueFirstName").value;
		var lname = document.getElementById("revenueLastName").value;
		f.action = "RevByName.jsp?fname=" + fname + "&lname=" + lname;
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
	<h1>Revenue Search</h1>
	<hr style="width:100%; text-align:left; margin-left:0">
	<form method="post" name="form">

		<table>
			<tr><td><u>By Transit Line</u></td></tr>
			<tr>
				<td><select id="revenueTransitLine">
					<option value="none" disabled>Transit Line</option>
					<option value="Main-Bergen">Main-Bergen</option>
					<option value="Montclair-Boonton">Montclair-Boonton</option>
					<option value="NE Corridor">NE Corridor</option>
					<option value="North Jersey Coast">North Jersey Coast</option>
					<option value="Raritan Valley">Raritan Valley</option>
				</select></td>	
			</tr>
			<tr><td><button onclick="toRevTranLine();">Search By Transit Line</button></td></tr>
			
			<tr><td><br></td></tr>
	
			<tr><td><u>By Destination City</u></td></tr>
				<tr>
					<td> <select id="revenueDestinationCity">
						<option value="none" disabled>Destination City</option>
					<% 
					ApplicationDB db = new ApplicationDB();
					Connection con = db.getConnection();
					Statement stmt = con.createStatement();
					
					String str="SELECT DISTINCT City FROM Stops";
					ResultSet stopSet= stmt.executeQuery(str);
					
					while(stopSet.next()){
					
					%>
						<option value="<%=stopSet.getString("City")%>"><%=stopSet.getString("City")%></option>
					<% 
					}
					%>
				</select></td>
			</tr>
			<tr><td><button onclick="toRevDesCity();">Search By Destination City</button></td></tr>
			
			<tr><td><br></td></tr>
			
			<tr><td><u>By Customer Name</u></td></tr>
			<tr>
				<td><input type="text" id="revenueFirstName"
					placeholder="First Name"></td>
				<td><input type="text" id="revenueLastName"
					placeholder="Last Name"></td>
			</tr>
			<tr><td><button onclick="toRevCusName();">Search By Customer Name</button></td></tr>
		</table>
	</form>
	<br>
	<form method="post" action="../AdminHome.jsp">
		<input type="submit" value="Cancel"/>
	</form>
	
</body>
</html>