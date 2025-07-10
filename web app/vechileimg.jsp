<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<%@include file="connect.jsp" %>

<% 

int id=Integer.parseInt(request.getParameter("id"));
try{
	PreparedStatement ps=con.prepareStatement("select image from vehicles where vhid=?");

	ps.setInt(1,id);	 
	rs = ps.executeQuery();
	
	byte[ ] imgData=null;
	if (rs.next()) {
		Blob image = rs.getBlob(1);
		imgData = image.getBytes(1,(int)image.length()); 
		}
	else {
		out.println("image not found for given id");
		return;
		}
	
	response.setContentType("image/jpg");
	OutputStream o = response.getOutputStream();
	o.write(imgData);
	o.flush();
	o.close();
	rs.close();
	ps.close();
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>