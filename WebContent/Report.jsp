<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="hotel.dbconnection.DbConnection"%>
<%@page import="java.util.Date"%>

</html><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script> src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"</script>
</head>
<body>	
			<div id="list">
				<h1 style="color:black; margin-left:25%;">Banquet Hall Booking Details Report</h1>
				<p style="margin-left:10%;">Date and Time:<%=new Date().toString() %></p>	
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
					
						<th>Guest Name</th>
						<th>Mobile</th>
						<th>Additional Services</th>
						<th>Decoration</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="user" items="${listBanq}">

						<tr>
					<td><c:out value="${user.guest}" /></td>
							<td><c:out value="${user.mobile}" /></td>
							<td><c:out value="${user.additional}" /></td>
							<td><c:out value="${user.decoration}" /></td>
							<td><c:out value="${user.date}" /></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>
			</table>
			</div>
<button onclick="print()">Download Report</button>
<script> 
function print(){
			var element = document.getElementById("list");
			var opt = {
			  margin:       1,
			  filename:     'myfile.pdf',
			  image:        { type: 'jpeg', quality: 0.98 },
			  html2canvas:  { scale: 2 },
			  jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
			};
			 
			// New Promise-based usage:
			html2pdf().from(element).set(opt).save();
}
</script>
</body>
</html>