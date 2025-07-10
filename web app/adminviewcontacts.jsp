<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<%@include file="adminheader.jsp" %>
 <%@include file="connect.jsp" %>
 <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Contacts</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 <section class="m-5">
 	<div class="container">
 		<table class="table table-bordered">
 			<thead style="background-color:orange;color:white">
 				<tr>
 					<th>SNo</th>
 					<th>Name</th>
 					<th>Email</th>
 					<th>Subject</th>
 					<th>Message</th>
 					<th>Date Time</th>
 				</tr>
 			</thead>
 			<tbody>
 			<%try{
 				PreparedStatement ps=con.prepareStatement("select * from contacts order by condate desc");
 				 rs=ps.executeQuery();
 				 int count=0;
 				while(rs.next()){
 					count++;
 					%>
 					<tr>
 						<td><%=count %></td>
 						<td><%=rs.getString(2) %></td>
 						<td><%=rs.getString(3) %></td>
 						<td><%=rs.getString(4) %></td>
 						<td><%=rs.getString(5) %></td>
 						<td><%=rs.getString(6) %></td>
 					</tr>
 					<%
 				}if(count==0){
 					%>
 					<tr><td colspan="15" style="color:orange;text-align:center">No Data Found!!</td>
 					</tr>
 					<%
 				}
 			}catch(Exception e){
 				e.printStackTrace();
 			} %>
 			</tbody>
 		</table>
 	</div>
 </section>
 <%@include file="footer.jsp" %>
</body>
</html>