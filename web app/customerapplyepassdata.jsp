<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.Date"%>
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
String email=request.getParameter("cemail");
String fdate=request.getParameter("fdate");
String tdate=request.getParameter("tdate");
String vtype=request.getParameter("vtype");
String vtypedet[]=vtype.split(",");
	String vname=vtypedet[0];
	String vnumber=vtypedet[1];
	String vetype=vtypedet[2];
String epack=request.getParameter("epackage");
double epcost=Double.parseDouble(request.getParameter("epcost"));

Date frdate=Date.valueOf(fdate);
Date todate=Date.valueOf(tdate);
PreparedStatement pss=con.prepareStatement("select * from epass where tolplid=? and cpemail=? and tdate > CURDATE() and evnumber=? and evtype=? and evname=?");
pss.setInt(1,tpid);
pss.setString(2,email);
pss.setString(3,vnumber);
pss.setString(4,vetype);
pss.setString(5,vname);
rs=pss.executeQuery();
if(rs.next()){
	%>
	<script>alert("TollPlaza E-pass Has Been Not Expired!!Please Check Here..")</script>
	<jsp:include page="customerviewepass.jsp"/>
	<%

}else{
PreparedStatement ps=con.prepareStatement("insert into epass(tolplid,cpemail,fdate,tdate,evtype,evnumber,evname,epack,epcost)values(?,?,?,?,?,?,?,?,?)");
ps.setInt(1,tpid);
ps.setString(2,email);
ps.setDate(3,frdate);

ps.setDate(4,todate);
ps.setString(5,vetype);
ps.setString(6,vnumber);
ps.setString(7,vname);
ps.setString(8,epack);
ps.setDouble(9,epcost);

int rows=ps.executeUpdate();
if(rows>0){
	%>
	<script>alert("TollPlaza E-pass Requested Successfully!!")</script>
	<jsp:include page="customerviewepass.jsp"/>
	<%
}else{
	%>
	<script>alert("Failed To Request!!Please Try Again..")</script>
	<jsp:include page="customerviewtollplaza.jsp"/>
	<%
}
}
}catch(Exception e){
	e.printStackTrace();
}


%>
</body>
</html>