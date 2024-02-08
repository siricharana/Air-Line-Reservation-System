<!DOCTYPE HTML>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.pojo.User"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="com.voidmain.pojo.Login"%>
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
					
					<li><a href="index.jsp">Home</a></li>
					<li><a href="login.jsp">Login</a></li>
					<li><a href="registration.jsp">Registration</a></li>
					<li><a href="activateaccount.jsp">Activate Account</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="content">
				<!-- insert the page content here -->
				<%
					String status=request.getParameter("status");
									
					if(status!=null)
					{
				%>
						<h1><%=status%></h1>
				<%		
					}
					else
					{
				%>
						<h1>Enter OTP to Activate Your Account</h1>
				<%		
					}
				%>
				
				<form action="activateaccount.jsp">
					<div class="form_settings">
						<p>
							<span>User Name :</span><input class="contact" type="text"
								name="username" value="" />
						</p>
						<p>
							<span>Otp:</span><input class="contact" type="text"
								name="otp" required="required"/>
						</p>
						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="Verify" />
						</p>
					</div>
				</form>
				
				<%
					String otp=request.getParameter("otp");
					String username=request.getParameter("username");
				
					if(otp!=null && username!=null)
					{
						Login login=HibernateDAO.getLoginById(username);
						
						if(login.getOtp().equals(otp))
						{
							login.setStatus("yes");
							
							if (HibernateTemplate.updateObject(login) == 1) {
								response.sendRedirect("login.jsp?status=account is activated");
							} else {
								response.sendRedirect("activateaccount.jsp?account activation failed");
							}
						}
						else {
							response.sendRedirect("activateaccount.jsp?in valid otp");
						}
					}
				%>
				
			</div>
		</div>
	</div>
</body>
</html>
