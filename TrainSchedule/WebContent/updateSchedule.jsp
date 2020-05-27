<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Schedule</title>
</head>
<body>



<%				
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//Get parameters from the HTML form at the index.jsp
		
		//primary key
		String ScheduleID = request.getParameter("ScheduleID");
	
	
		String str = "SELECT * FROM testDB.Schedule WHERE scheduleID=" + "'"+  ScheduleID+ "'";
		
		ResultSet result = stmt.executeQuery(str);
		
		String originalTime=null;
		String d=null;
		
		while(result.next()){
			
			originalTime=result.getString("TravelTime"); 
			d=result.getString("Date"); 
		}
	
		result.close();
		stmt.close();
		
		Statement stmt2= con.createStatement();
		//inputs from editSchedule
		String transitLineName = request.getParameter("transitLineName");
		String tid = request.getParameter("tid");
		String origin = request.getParameter("origin");
		String dest = request.getParameter("dest");
		String seatsAvail = request.getParameter("seatsAvail");
		String Stops = request.getParameter("stationName");
		String Date = request.getParameter("Date");
		String Deptime = request.getParameter("Depime");
		String ArrivalTime = request.getParameter("ArrivalTime");
		String TravelTime = request.getParameter("TravelTime");
		String fare_econ = request.getParameter("fare_econ");
		String fare_busi = request.getParameter("fare_busi");
		String fare_first = request.getParameter("fare_first");
		
		
		//Make an insert statement for the Sells table:
		String insert = "UPDATE testDB.Schedule SET Date=?, tid=?, Origin=?, Destination=?, TravelTime=? WHERE ScheduleID="+ScheduleID;
				
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, Date);
		ps.setString(2, tid);
		ps.setString(3,origin);
		ps.setString(4,dest);
		ps.setString(5,TravelTime);

		//ps.setString(2, question);
		//Run the query against the DB
		ps.executeUpdate();
		//Run the query against the DB
		
		stmt2.close();
		
		Statement stmt3= con.createStatement();
		String insert1= "UPDATE testDB.Notifications SET description=? WHERE id=1";
		
		int difference= Integer.parseInt(TravelTime)-Integer.parseInt(originalTime);
		int ab= Math.abs(difference);
		
		String delayed=null;
		if(difference<0){
			delayed=" will arrive early by "+ String.valueOf(ab)+ " minutes on "+ d + ".";
		}else if(difference>0){
			delayed=" has been delayed by "+ String.valueOf(ab)+ " minutes on "+ d + ".";
		}else{
		delayed=" will proceed as scheduled on "+ d + ".";
		}
		
		String entity= "Train"+ " "+tid+delayed;
		
		PreparedStatement ps1 = con.prepareStatement(insert1);
		ps1.setString(1, entity);
		
		ps1.executeUpdate();
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		stmt3.close();
		con.close();
		out.print("Schedule has been updated");
		//out.println((String)answer);
		//out.println((String)QuestionId);
		

			
		
	} catch (Exception ex) {
		out.print("Can not be updated");
	
	}
%>




</body>
</html>