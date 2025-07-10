<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        .profile-card {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            background: #fff;
            transition: transform 0.3s ease;
        }
        .profile-card:hover {
            transform: translateY(-5px);
        }
        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .profile-img {
            width: 350px;
            height: 350px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #28a745;
        }
        .profile-details {
            font-size: 1.1rem;
            color: #333;
        }
        .profile-details .row {
            margin-bottom: 15px;
        }
        .profile-details strong {
            color: #28a745;
        }
        .update-btn {
            background: #28a745;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            font-weight: 500;
            border-radius: 25px;
            transition: background 0.3s ease;
        }
        .update-btn:hover {
            background: #218838;
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
                            <h2>My Profile</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%try{
    	String email=(String)session.getAttribute("email");
    	PreparedStatement ps=con.prepareStatement("select * from customer where cemail=?");
    	ps.setString(1,email);
    	rs=ps.executeQuery();
    	while(rs.next()){
    		%>
    		<div class="profile-card">
                <div class="profile-header">
                    <img src="admincustomerimg.jsp?id=<%=rs.getInt(1)%>" class="profile-img" alt="Customer Image">
                    <h2 class="mt-3" style="text-transform:uppercase"><%=rs.getString("name")%></h2>
                </div>
                <div class="profile-details">
                    <div class="row">
                        <div class="col-4"><strong><i style="color:gold" class="fa fa-envelope"></i>&nbsp;Email:</strong></div>
                        <div class="col-8"><%=rs.getString("cemail")%></div>
                    </div>
                    <div class="row">
                        <div class="col-4"><strong><i style="color:gold" class="fa fa-calendar"></i>&nbsp;Date Of Birth:</strong></div>
                        <div class="col-8"><%=rs.getString("dob")%></div>
                    </div>
                    <div class="row">
                        <div class="col-4"><strong><%if(rs.getString(6).equalsIgnoreCase("Male")){ %><i style="color:gold;"class="fa  fa-mars"></i><%
                          }else if(rs.getString(6).equalsIgnoreCase("Female")){ %><i style="color:gold;"class="fa  fa-venus"></i><%
                          }else{
                          %><i style="color:skyblue;"class="fa  fa-transgender"></i>
                          <%} 
                          %>&nbsp;Gender:</strong></div>
                        <div class="col-8"><%=rs.getString("gender")%></div>
                    </div>
                    
                    <div class="row">
                        <div class="col-4"><strong><i style="color:gold" class="fa fa-phone"></i>&nbsp;Mobile No:</strong></div>
                        <div class="col-8"><%=rs.getString("mobile")%></div>
                    </div>
                    <div class="row">
                        <div class="col-4"><strong><i style="color:gold" class="fas fa-map-marker-alt"></i>&nbsp;Address:</strong></div>
                        <div class="col-8"><%=rs.getString("address")%></div>
                    </div>
                </div>
                <div class="text-center">
                    <a href="customerupdateprofile.jsp?id=<%=rs.getInt(1)%>" class="btn btn-primary update-btn">
                        <i class="fas fa-edit"></i> Update Profile
                    </a>
                </div>
            </div>
    		<% 
    	}
    }catch(Exception e){
    	e.printStackTrace();
    } %>
<%@include file="footer.jsp" %>
</body>
</html>