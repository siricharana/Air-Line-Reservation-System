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
			<h1>Add Flight</h1>
	<%
		}
	%>

	<form action="VoidmainServlet" method="post">

		<input type="hidden" name="type" value="com.voidmain.pojo.Flight">
		<input type="hidden" name="operation" value="add"> 
		<input type="hidden" name="redirect" value="addflight.jsp">

		<div class="form_settings">
			<p>
				<span>Name:</span><input class="contact" type="text" name="name"
					value="" required="required"/>
			</p>
			<p>
				<span>Source:</span><input class="contact" type="text" name="source"
					value="" required="required"/>
			</p>
			<p>
				<span>Destination:</span><input class="contact" type="text" name="destination"
					value="" required="required"/>
			</p>
			<p>
				<span>Timings:</span><input class="contact" type="text" name="timings"
					value="" required="required"/>
			</p>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Add Flight" />
			</p>
		</div>
	</form>
</div>
<%@include file="footer.jsp"%>