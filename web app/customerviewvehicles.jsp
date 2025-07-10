<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
<style>
   .card {
        border: none;
        border-radius: 10px;
        overflow: hidden;
        background: #fff;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
    }
    .card:hover {
        transform: scale(1.03);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    }
    .card-img-top {
        height: 200px;
        object-fit: cover;
        border-bottom: 3px solid #007bff;
    }
    .card-body {
        padding: 20px;
    }
    .card-title {
        font-size: 1.3rem;
        font-weight: 600;
        color: #007bff;
        margin-bottom: 15px;
    }
    .card-text {
        font-size: 0.95rem;
        line-height: 1.6;
        color: #555;
    }
    .card-text strong {
        color: #222;
        font-weight: 500;
    }
  
   
</style>
</head>
<body>
<%@include file="connect.jsp" %>
<%@include file="customerheader.jsp" %>

<div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>View Vehicles
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<section class="contact-section">
<div class="container">
    <div class="row">
        
        <% 
        String email=(String)session.getAttribute("email");
        PreparedStatement ps=con.prepareStatement("select * from vehicles where vcemail=?");
        ps.setString(1,email);
        rs=ps.executeQuery();
        int count=0;
            while (rs.next()) {
            	count++;
            	%>
                <div class="col-md-4">
                    <div class="card mb-4">
                        <img src="vechileimg.jsp?id=<%=rs.getInt(1) %>" class="card-img-top" alt="Vehicle Image" onerror="this.src='assets/img/placeholder.jpg'">
                        <div class="card-body">
                            <h5 class="card-title"><%= rs.getString("vname") %></h5>
                            <p class="card-text">
                                <strong>Vehicle Number:</strong> <%= rs.getString("vnumber") %><br>
                                <strong>Type:</strong> <%= rs.getString("vtype") %><br>
                                <strong>Registered:</strong> <%= rs.getString("rdate") %><br>
                                <%-- <strong>E-Pass:</strong> 
                                <%
                                    String status = rs.getString("epass_status");
                                    if (status == null || status.equals("inactive")) {
                                        out.print("<span class='badge bg-gradient-danger'>Not Available</span>");
                                    } else if (status.equals("active")) {
                                        out.print("<span class='badge bg-gradient-success'>Active (Expires: " + rs.getString("expiry_date") + ")</span>");
                                    } else if (status.equals("expired")) {
                                        out.print("<span class='badge bg-gradient-warning'>Expired</span>");
                                    }
                                %> --%>
                            </p>
                            <a class="genric-btn danger circle" href="customerdeletevechile.jsp?id=<%=rs.getInt(1)%>" onclick="return confirm('Do You Want To Delete?')">Delete</a>
                        </div>
                    </div>
                </div>
            <% } if(count==0){
            	%>
            	<div class="col-md-12">
            	<h2 style="color:red;text-align:center">No Vehicles Added Yet!!</h2>
            	</div>
            	<%
            }
        %>
    </div>
</div>
</section>

<%@include file="footer.jsp" %>
</body>
</html>