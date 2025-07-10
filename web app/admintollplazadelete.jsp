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
	PreparedStatement ps=con.prepareStatement("delete from tollplaza where tpid=?");
	ps.setInt(1,id);
	int rows=ps.executeUpdate();
	if(rows>0){
		%>
		<script type="text/javascript">alert("TollPlaza Deleted Successfully!!")</script>
		<jsp:include page="adminviewtollplaza.jsp"/>
		<% 
	}else{
		%>
		<script type="text/javascript">alert("Failed To Delete!!Please Try Again..")</script>
		<jsp:include page="adminviewtollplaza.jsp"/>
		<% 
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>