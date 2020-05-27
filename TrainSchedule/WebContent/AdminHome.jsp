<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
<script language="javascript">
	function toResByTransit() {
		var f = document.form;
		f.method = "post";

		var transitLine = document.getElementById("reserveTransitLine").value;
		var trainNumber = document.getElementById("reserveTrainNumber").value;

		f.action = "AdminReservationSearch/ResByTransit.jsp?transitLine="
				+ transitLine + "&trainNumber=" + trainNumber;
		f.submit();
	}

	function toResByCust() {
		var f = document.form;
		f.method = "post";

		var fname = document.getElementById("reserveFirstName").value;
		var lname = document.getElementById("reserveLastName").value;

		f.action = "AdminReservationSearch/ResByCust.jsp?fname=" + fname
				+ "&lname=" + lname;
		f.submit();
	}

	function changeTrains() {
		var transitLine = document.getElementById("reserveTransitLine");
		var train1 = document.getElementById("train1");
		var train2 = document.getElementById("train2");
		var train_id1 = "1000";
		var train_id2 = "1001";
		if (transitLine.value === "Montclair-Boonton") {
			train_id1 = "1002";
			train_id2 = "1003";
		}
		if (transitLine.value === "NE Corridor") {
			train_id1 = "1004";
			train_id2 = "1005";
		}
		if (transitLine.value === "North Jersey Coast") {
			train_id1 = "1006";
			train_id2 = "1007";
		}
		if (transitLine.value === "Raritan Valley") {
			train_id1 = "1008";
			train_id2 = "1009";
		}
		train1.value = train_id1;
		train2.value = train_id2;
		train1.textContent = train_id1;
		train2.textContent = train_id2;
	}

	function updateTrains() {
		var f = document.form;
		var year = document.getElementById("YearTop").value;
		var month = document.getElementById("MonthTop").value;
		f.method = "post";
		f.action = "AdminHome.jsp?month=" + month + "&year=" + year;
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
	<form method="post" action="index.jsp">
		<input type="submit" value="Logout">
	</form>
	<h1>Admin Home</h1>
	<hr style="width: 100%; text-align: left; margin-left: 0">
	<%
		String topName = "";
	String firstLine = "";
	String secondLine = "";
	String thirdLine = "";
	String fourthLine = "";
	String fifthLine = "";
	String month = request.getParameter("month");
	String year = request.getParameter("year");

	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();

		//calculate the best customer
		String str = "SELECT Username, max(tfare) FROM(SELECT Username, (SUM(bookingFee)) tfare FROM Reservation GROUP BY Username) gcust;";
		ResultSet set = stmt.executeQuery(str);
		set.next();
		String topUserName = set.getString("Username");

		String str2 = "SELECT * FROM Customer WHERE username='" + topUserName + "'";
		ResultSet set2 = stmt.executeQuery(str2);
		set2.next();

		String topFirstname = set2.getString("FirstName");
		String topLastname = set2.getString("LastName");
		topName = topFirstname + " " + topLastname + " (username:" + topUserName + ")";

		//calculate the five most active transit lines by a given month
		String str3 = "";
		if ((month == null || year == null) || (month.equals("none") || year.equals("none"))) {
			str3 = "SELECT r.transitLine_name, tab.tot FROM Reservation r "
			+ "LEFT OUTER JOIN (SELECT transitLine_name, (count(*)) tot " + "FROM Reservation s "
			+ "WHERE YEAR(CURDATE())=YEAR(s.date) AND MONTH(CURDATE())=MONTH(s.date) GROUP BY s.transitLine_name) tab "
			+ "ON (r.transitLine_name=tab.transitLine_name) "
			+ "GROUP BY r.transitLine_name ORDER BY tab.tot DESC;";
		} else {
			str3 = "SELECT r.transitLine_name, tab.tot FROM Reservation r "
			+ "LEFT OUTER JOIN (SELECT transitLine_name, (count(*)) tot " + "FROM Reservation s "
			+ "WHERE YEAR(s.date)=" + year + " AND + MONTH(s.date)=" + month + " GROUP BY s.transitLine_name) tab "
			+ "ON (r.transitLine_name=tab.transitLine_name) "
			+ "GROUP BY r.transitLine_name ORDER BY tab.tot DESC;";
		}

		ResultSet set3 = stmt.executeQuery(str3);

		set3.next();
		firstLine = set3.getString("transitLine_name");
		if (set3.getString("tab.tot") == null)
			firstLine += " (0)";
		else
			firstLine += " (" + set3.getString("tab.tot") + ")";

		set3.next();
		secondLine = set3.getString("transitLine_name");
		if (set3.getString("tab.tot") == null)
			secondLine += " (0)";
		else
			secondLine += " (" + set3.getString("tab.tot") + ")";

		set3.next();
		thirdLine = set3.getString("transitLine_name");
		if (set3.getString("tab.tot") == null)
			thirdLine += " (0)";
		else
			thirdLine += " (" + set3.getString("tab.tot") + ")";

		set3.next();
		fourthLine = set3.getString("transitLine_name");
		if (set3.getString("tab.tot") == null)
			fourthLine += " (0)";
		else
			fourthLine += " (" + set3.getString("tab.tot") + ")";

		set3.next();
		fifthLine = set3.getString("transitLine_name");
		if (set3.getString("tab.tot") == null)
			fifthLine += " (0)";
		else
			fifthLine += " (" + set3.getString("tab.tot") + ")";

	}

	catch (Exception e) {
		out.println(e);
	}
	%>

	<b>Search Employees/Customers</b>
	<br>
	<form method="post" action="AdminSearchResults.jsp">
		<table>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="fname"></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lname"></td>
			</tr>
		</table>
		<input type="submit" value="Search">
	</form>


	<br>
	<b>Add Customers and Employees</b>
	<br>


	<form method="post" action="AdminAdd/AdminAddCustomer.jsp">
		<input type="submit" value="Add Customer">
	</form>

	<form method="post" action="AdminAdd/AdminAddEmployee.jsp">
		<input type="submit" value="Add Employee">
	</form>


	<br>
	<b>See Revenue Reports</b>
	<form method="post" action="AdminRevenue/AdminRevenueSearch.jsp">
		<input type="submit" value="Get Revenue">
	</form>



	<br>
	<form method="post" name="form">
		<b>Search Reservations:</b>
		<table>
			<tr>
				<td><table>
						<tr>
							<td><u>By Transit Line</u></td>
						</tr>
						<tr>
							<td>Transit Line: <select id="reserveTransitLine"
								onchange="changeTrains();">
									<option value="Main-Bergen">Main-Bergen</option>
									<option value="Montclair-Boonton">Montclair-Boonton</option>
									<option value="NE Corridor">NE Corridor</option>
									<option value="North Jersey Coast">North Jersey Coast</option>
									<option value="Raritan Valley">Raritan Valley</option>
							</select></td>
							<td>Train #: <select id="reserveTrainNumber">
									<option value="1000" id="train1">1000</option>
									<option value="1001" id="train2">1001</option>
							</select></td>

						</tr>
						<tr>
							<td><button name="resByTransitButton"
									onclick="toResByTransit();">Search By Transit Line</button></td>
						</tr>
						<tr></tr>
					</table></td>
			<tr>
				<td>
					<table>
						<tr>
							<td><u>By Customer Name</u></td>
						</tr>
						<tr>
							<td><input type="text" id="reserveFirstName"
								placeholder="First Name"></td>
							<td><input type="text" id="reserveLastName"
								placeholder="Last Name"></td>
						</tr>
						<tr>
							<td><button name="resByCustomerButton"
									onclick="toResByCust();">Search By Customer Name</button></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>

	<br>
	<form method="post" action="AdminRevenue/RevByMonth.jsp">
		<table>
			<tr>
				<td><b>Generate Sales Report</b></td>
			</tr>
			<tr>
				<td>Enter Month: <select name="month">
						<option value="01">Jan</option>
						<option value="02">Feb</option>
						<option value="03">Mar</option>
						<option value="04">Apr</option>
						<option value="05">May</option>
						<option value="06">Jun</option>
						<option value="07">Jul</option>
						<option value="08">Aug</option>
						<option value="09">Sep</option>
						<option value="10">Oct</option>
						<option value="11">Nov</option>
						<option value="12">Dec</option>
				</select></td>
				
				<td>Enter Year: <select name="year">
						<option value="2020">2020</option>
						<option value="2019">2019</option>
						<option value="2018">2018</option>
						<option value="2017">2017</option>
						<option value="2016">2016</option>
						<option value="2015">2015</option>
						<option value="2014">2014</option>
						<option value="2013">2013</option>
						<option value="2012">2012</option>
						<option value="2011">2011</option>
						<option value="2010">2010</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="submit" value="Generate"></td>
			</tr>
		</table>
	</form>

	<br>
	<table>
		<tr>
			<td><b>Top Customer:</b></td>
			<td><label id="topCustomer"><%=topName%></label></td>
		</tr>
	</table>

	<br>
	<table>
		<tr>
			<td><b>Top Transit Lines</b></td>
			<td><select id="MonthTop">
					<option value="none" disabled="disabled" selected>Month</option>
					<%
						for (int i = 1; i <= 12; i++) {
						if (month == null && year == null) {
					%>
					<option value="<%=i%>"><%=i%></option>
					<%
						} else {
						if (i == Integer.parseInt(month)) {
					%>
					<option value="<%=i%>" selected><%=i%></option>
					<%
						} else {
					%>
					<option value="<%=i%>"><%=i%></option>
					<%
						}
					}
					}
					%>
			</select></td>

			<td><select id="YearTop">
					<option value="none" disabled="disabled" selected>Year</option>
					<%
						for (int i = 2020; i >= 2012; i--) {
						if (month == null && year == null) {
					%>
					<option value="<%=i%>"><%=i%></option>
					<%
						} else {
						if (i == Integer.parseInt(year)) {
					%>
					<option value="<%=i%>" selected><%=i%></option>
					<%
						} else {
					%>
					<option value="<%=i%>"><%=i%></option>
					<%
						}
					}
					}
					%>
			</select></td>

			<td>
				<button name="updateTrains" onclick="updateTrains()">
					Update Transit Lanes</button>
			</td>
		<tr>
			<td><label id="firstLine">1. <%=firstLine%></label></td>
		</tr>
		<tr>
			<td><label id="secondLine">2. <%=secondLine%></label></td>
		</tr>
		<tr>
			<td><label id="thirdLine">3. <%=thirdLine%></label></td>
		</tr>
		<tr>
			<td><label id="fourthLine">4. <%=fourthLine%></label></td>
		</tr>
		<tr>
			<td><label id="fifthLine">5. <%=fifthLine%></label></td>
		</tr>
		
		<% if (month==null && year==null){
				%>
					<tr><td>(current month)</td></tr>
				<% 
			}else{
				%>
				<tr><td>(<%=month%>/<%=year%>)</td></tr>
			<% 
			}
			%>
		
	</table>




</body>
</html>