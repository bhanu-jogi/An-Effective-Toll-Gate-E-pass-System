<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
<style>
        .customer-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
            background:black;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .customer-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        .customer-img {
            width: 220px;
            height: 220px;
            object-fit: cover;
            border-radius: 50%;
            border: 4px solid gold; 
            margin-bottom: 15px;
            margin-left:50px;
        }
        .customer-details p {
            margin: 5px 0;
            font-size: 1rem;
            color: teal;
        }
        .customer-details strong {
            color: gold;
        }
        .action-buttons .btn {
            margin: 5px;
            padding: 8px 20px;
            font-size: 1rem;
            border-radius: 20px;
        }
        .btn-accept {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-reject {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-accept:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .btn-reject:hover {
            background-color: #c82333;
            border-color: #c82333;
        }
    </style>
</head>

<body>
   <%@include file="connect.jsp" %>
    <%@include file="adminheader.jsp" %>
    
    <!-- Hero Area Start-->
    <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>View Customers</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero Area End -->
     
     <section class="contact-section">
    <div class="container">
      <!-- <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="section_tittle text-center">
            <h2>Best Sellers</h2>
          </div>
        </div>
      </div> -->
       <div class="row">
      <%try{
    	  PreparedStatement ps=con.prepareStatement("select * from customer");
    	  rs=ps.executeQuery();
    	  int count=0;
    	  while(rs.next()){
    		  count++;
    		  %>
    		 
         <div class="col-md-4 ftco-animate">
                    <div class="customer-card">
                     <span class="badge status-badge bg-<%= rs.getString("cstatus").equalsIgnoreCase("Accepted") ? "success" : "danger" %>">
                        <%= rs.getString("cstatus") %>
                    </span>
                        <img src="admincustomerimg.jsp?id=<%=rs.getInt(1) %>" class="customer-img" >
                        <div class="customer-details">
                            <p><strong><i class="fa fa-user"></i> &nbsp;Name:</strong> <%=rs.getString(2) %></p>
                            <p><strong><i class="fa fa-envelope"></i> &nbsp;Email:</strong> <%=rs.getString(3) %></p>
                            <p><strong><i class="fa fa-calendar"></i> &nbsp;Date of Birth:</strong> <%=rs.getDate(7)%></p>
                            <p><strong><i class="fa fa-phone"></i> &nbsp;Mobile:</strong> <%=rs.getString(5) %></p>
                             <p><strong><%if(rs.getString(6).equalsIgnoreCase("Male")){ %><i style="color:gold;"class="fa  fa-mars"></i><%
                          }else if(rs.getString(6).equalsIgnoreCase("Female")){ %><i style="color:gold;"class="fa  fa-venus"></i><%
                          }else{
                          %><i style="color:skyblue;"class="fa  fa-transgender"></i>
                          <%} 
                          %>&nbsp;Gender:</strong>
                          
                          <%=rs.getString(6) %></p>
                            <p><strong><i class="fas fa-map-marker-alt"></i> &nbsp;Address:</strong> <%=rs.getString(8)%></p>
                           
                           
                        </div>
                        <div class="action-buttons text-center m-3">
                            <% if (rs.getString(10).equalsIgnoreCase("Pending")) { %>
                                <a href="adminacceptcustomer.jsp?id=<%=rs.getInt(1) %>" class="genric-btn success circle">
                                    <i class="fas fa-check"></i> ACCEPT
                                </a>
                                <a href="adminrejectcustomer.jsp?id=<%=rs.getInt(1) %>" onclick="return confirm('Do You Want To Reject?')"class="genric-btn danger circle">
                                    <i class="fas fa-times"></i> REJECT
                                </a>
                                
                            <% } else if (rs.getString(10).equalsIgnoreCase("Accepted")) { %>
                                <button class="genric-btn success circle " disabled><i class="fas fa-check"></i> Accepted</button>
                                <a href="admindeletecustomer.jsp?id=<%=rs.getInt(1) %>" onclick="return confirm('Do You Want To Delete?')"class="genric-btn danger circle">
                                    <i class="fas fa-trash"></i> DELETE
                                </a>
                            <% } else if (rs.getString(10).equalsIgnoreCase("Rejected")) { %>
                                <button class="genric-btn danger circle"  disabled><i class="fas fa-times"></i> Rejected</button>
                                <a href="admindeletecustomer.jsp?id=<%=rs.getInt(1) %>" onclick="return confirm('Do You Want To Delete?')"class="genric-btn danger circle">
                                    <i class="fas fa-trash"></i> DELETE
                                </a>
                            <% } %>
                        </div>
                    </div>
                </div>
        
      
    		  <%
    	  }if(count==0){
    		  %>
    		  <h3 style="color:red;text-align:center">No Data Found !!</h3>
    		  <%
    	  }
      }catch(Exception e){
    	  e.printStackTrace();
      } %>
      </div>
    </div>
  </section>
        
        
       
   
    <%@include file="footer.jsp" %>
    </body>
    
    </html>