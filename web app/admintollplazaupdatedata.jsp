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
	
	int tpid=Integer.parseInt(request.getParameter("tpid"));
	Double hvcost=Double.parseDouble(request.getParameter("hvcost"));
	Double mvcost=Double.parseDouble(request.getParameter("mvcost"));
	Double lvcost=Double.parseDouble(request.getParameter("lvcost"));
	
	PreparedStatement ps=con.prepareStatement("update tollplaza set hvcost=?,mvcost=?,lvcost=? where tpid=?");
	
	ps.setDouble(1,hvcost);
	ps.setDouble(2,mvcost);
	ps.setDouble(3,lvcost);
	ps.setInt(4,tpid);
	
	int rows=ps.executeUpdate();
	if(rows>0){
		%>
		<script>alert("Toll Plaza Updated Successfully!!")</script>
		<jsp:include page="adminviewtollplaza.jsp"></jsp:include>
		<%
	}else{
		%>
		<script>alert("Failed To Update!!Please Try AGain..")</script>
		<jsp:include page="admintollplazaupdate.jsp"><jsp:param value="<%=tpid %>" name="id"/></jsp:include>
		<%
	}
	
	
	
	
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>