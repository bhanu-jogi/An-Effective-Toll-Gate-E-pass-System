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
	String tpname=request.getParameter("tpname");
	String hwname=request.getParameter("hwname");
	String tpaddress=request.getParameter("tpaddress");
	Double hvcost=Double.parseDouble(request.getParameter("hvcost"));
	Double mvcost=Double.parseDouble(request.getParameter("mvcost"));
	Double lvcost=Double.parseDouble(request.getParameter("lvcost"));
	PreparedStatement pss=con.prepareStatement("select * from tollplaza where tpname=? and hwname=? and tpaddress=?");
	pss.setString(1,tpname);
	pss.setString(2,hwname);
	pss.setString(3,tpaddress);
	rs=pss.executeQuery();
	if(rs.next()){
		%>
		<script>alert("You Have Already Added This Toll Plaza!!Please Update It Here..")</script>
		<jsp:include page="adminviewtollplaza.jsp"></jsp:include>
		<%
	}else{
	PreparedStatement ps=con.prepareStatement("insert into tollplaza(tpname,hwname,tpaddress,hvcost,mvcost,lvcost)values(?,?,?,?,?,?)");
	ps.setString(1,tpname);
	ps.setString(2,hwname);
	ps.setString(3,tpaddress);
	ps.setDouble(4,hvcost);
	ps.setDouble(5,mvcost);
	ps.setDouble(6,lvcost);
	
	int rows=ps.executeUpdate();
	if(rows>0){
		%>
		<script>alert("Toll Plaza Added Successfully!!")</script>
		<jsp:include page="adminviewtollplaza.jsp"></jsp:include>
		<%
	}else{
		%>
		<script>alert("Failed To Add!!Please Try AGain..")</script>
		<jsp:include page="adminaddtollplaza.jsp"></jsp:include>
		<%
	}
	
	
	}
	
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>