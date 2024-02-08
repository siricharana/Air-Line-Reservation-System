<%@page import="com.voidmain.pojo.Flight"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@include file="header.jsp"%>
<div id="content">
	<!-- insert the page content here -->
	<%
		String status = request.getParameter("status");

		if (status != null) 
		{
	%>
			<h1>
				<script type="text/javascript">
					window.alert("<%=status%>");
				</script>
			</h1>
	<%
		} 
		else 
		{
	%>
			<h1>Add Fare</h1>
	<%
		}
	%>

	<form action="VoidmainServlet" method="post">

		<input type="hidden" name="type" value="com.voidmain.pojo.Fare">
		<input type="hidden" name="operation" value="add"> 
		<input type="hidden" name="redirect" value="addfare.jsp">

		<div class="form_settings">
			<p>
				<span>Select Flight:</span>
				<select name="flightid" required="required">
					<option value="">--select--</option>
					<%
						for (Flight flight : HibernateDAO.getFlights()) 
						{
					%>
							<option value="<%=flight.getId()%>"><%=flight.getId()+"--"+flight.getName()%></option>
					<%
						}
					%>
				</select>
			</p>
			<p>
				<span>Seating Class:</span>
				<select name="seatclass" required="required">
					<option value="">--select--</option>
					<option value="economy">economy</option>
					<option value="premium economy">premium economy</option>
					<option value="business">business</option>
					<option value="first class">first class</option>
				</select>
			</p>
			<p>
				<span>Price:</span><input class="contact" type="text" name="price"
					value="" required="required"/>
			</p>
			<p>
				<span>No of Tickets:</span><input class="contact" type="text" name="noOfTickets"
					value="" required="required"/>
			</p>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Add Fare" />
			</p>
		</div>
	</form>
</div>
<%@include file="footer.jsp"%>