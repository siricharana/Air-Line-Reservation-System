<!DOCTYPE HTML>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<html>

<head>
<title>Group:3</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css"
	title="style" />
</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1>
						<center><font color="black">Airline Reservation System</font></center>
					</h1>
				</div>
			</div>
			<div id="menubar">
				<ul id="menu">

					 <%
						String role = (String) request.getSession().getAttribute("role");
						String username = (String) request.getSession().getAttribute( "username");

						if (role.equals("user")) {
					%>
							<li><a href="viewflights.jsp">View Flights</a></li>
							<li><a href="viewtickets.jsp">View Tickets</a></li>
					<%
						}
					%>
					
					<%
						if (role.equals("airlines")) {
					%>
							<li><a href="addflight.jsp">Add Flight</a></li>
							<li><a href="viewflights.jsp">View Flights</a></li>
							
							<li><a href="addfare.jsp">Add Fare</a></li>
							
							<li><a href="viewtickets.jsp">View Tickets</a></li>
					<%
						}
					%>
					
					<li><a href="logout.jsp">Logout</a></li>
					
				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">