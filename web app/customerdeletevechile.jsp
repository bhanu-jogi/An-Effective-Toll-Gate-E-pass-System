<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<%@include file="connect.jsp" %>
<%
try{
	int id=Integer.parseInt(request.getParameter("id"));
	PreparedStatement ps=con.prepareStatement("delete from  vehicles  where vhid=?");
	ps.setInt(1,id);
	int rows=ps.executeUpdate();
	if(rows>0){
		%>
		<script>alert("Vehicle Deleted Successfully!!")</script>
		<jsp:include page="customerviewvehicles.jsp"/>
		<%
	}else{
		%>
		<script>alert("Failed To Delete!!Please Try Againn")</script>
		<jsp:include page="customerviewvehicles.jsp"/>
		<%
	}
	
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>