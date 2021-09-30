<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	
	crossorigin="anonymous">
</head>
<body>
<%@include file="header.jsp" %>
		
		<div class="container" style="margin-left: 10%; padding-top:5%">
		<div class="card">
		
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="updatebanq" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="insertbanq" method="post">
				</c:if>

				<caption>
					<h2 style="color:black;">
						<c:if test="${user != null}">
            			Edit Banquet Hall
            		</c:if>
						<c:if test="${user == null}">
            			Add Banquet Hall
            		</c:if>
					</h2>
				</caption>
				

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>
				<div class="container text-left">
				<fieldset class="form-group"> 
					<label style="color:black;">Guest Name</label> <input type="text" 
						value="<c:out value='${user.guest}' />" class="form-control"
						name="guest" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label style="color:black;">Mobile</label> <input type="text"
						value="<c:out value='${user.mobile}' />" class="form-control"
						name="mobile">
				</fieldset>

				<fieldset class="form-group">
					<label style="color:black;">Additional Services</label> <input type="text"
						value="<c:out value='${user.additional}' />" class="form-control"
						name="additional">
				</fieldset>
				<fieldset class="form-group">
					<label style="color:black;">Decorations</label> <input type="text"
						value="<c:out value='${user.decoration}' />" class="form-control"
						name="decoration" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label style="color:black;">Date</label> <input type="text"
						value="<c:out value='${user.date}' />" class="form-control"
						name="Date">
				</fieldset>

				

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
		</div>
	</div>
</body>
</html>