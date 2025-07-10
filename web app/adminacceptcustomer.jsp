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
	PreparedStatement ps=con.prepareStatement("update customer set cstatus='Accepted' where cuid=?");
	ps.setInt(1,id);
	int rows=ps.executeUpdate();
	if(rows>0){
		%>
		<script>alert("Accepted Successfully!!")</script>
		<jsp:include page="adminviewcustomers.jsp"/>
		<%
	}else{
		%>
		<script>alert("Failed To Accept!!Please Try Againn")</script>
		<jsp:include page="adminviewcustomers.jsp"/>
		<%
	}
	
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>