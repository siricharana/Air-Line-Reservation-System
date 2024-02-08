<%@page import="com.voidmain.pojo.Fare"%>
<%@page import="com.voidmain.pojo.Fare"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp"%>
<div id="content">
	<!-- insert the page content here -->

	<%
		String status = request.getParameter("status");
		String flightid = request.getParameter("flightid");

		if (status != null) {
	%>
	<h1><%=status%></h1>
	<%
		} else {
	%>
	<h1>View Fares</h1>
	<%
		}
	%>
	
	<%
		if(flightid!=null)
		{
	%>

			<table style="width: 100%; border-spacing: 0;">
				<tr>
					<th>Seat Class</th>
					<th>Price</th>
					<th>No of Tickets</th>
					<th>Delete</th>
				</tr>
		
				<%
					for (Fare fare : HibernateDAO.getFares()) {
						
						if(fare.getFlightid().equals(flightid))
						{
				%>
							<tr>
								<td><%=fare.getSeatclass()%></td>
								<td><%=fare.getPrice()%></td>
								<td><%=fare.getNoOfTickets()%></td>
								<td><a href="viewfares.jsp?id=<%=fare.getId()%>">delete</a></td>
							</tr>
				<%
						}
					}
				%>
			</table>
	<%
		}
	%>

	<%
		String id = request.getParameter("id");

		if (id != null) {
			if (HibernateTemplate.deleteObject(Fare.class,Integer.parseInt(id))== 1) {
				response.sendRedirect("viewfares.jsp?status=success&flightid="+id);
			} else {
				response.sendRedirect("viewfares.jsp?status=success&flightid="+id);
			}
		}
	%>

</div>