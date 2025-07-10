<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<script >alert("Logged Out Successfully!!")</script>
<%session.invalidate();
response.sendRedirect("customer.jsp");
%>
</body>
</html>