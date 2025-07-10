<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>

<body>
   
    <%@include file="main_header.jsp" %>
    <!-- Hero Area Start-->
    <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Customer Register</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!-- Hero Area End -->
    <!-- ================ contact section start ================= -->
    <section class="contact-section">
            <div class="container">
               <div class="row">
                    <% java.time.LocalDate currentDate = java.time.LocalDate.now(); %>
                    <div class="col-lg-8">
                        <form class="form-contact contact_form" action="customerregisterdata.jsp" method="post" enctype="multipart/form-data">
                            <div class="row">
                            
                                <div class="col-md-8">
                                    <div class="form-group">
                                    <label>Full Name</label>
                                        <input class="form-control valid"  required name="name"  type="text" onfocus="this.placeholder = 'Enter Full Name'" onblur="this.placeholder = 'Enter Full Name'" placeholder="Enter Full Name">
                                    </div>
                                </div>
                                
                                <div class="col-md-8">
                                    <div class="form-group">
                                    <label>Email</label>
                                        <input class="form-control valid"  required name="email"  type="email" onfocus="this.placeholder = 'Enter Email Address'" onblur="this.placeholder = 'Enter Email Address'" placeholder="Enter Email Address">
                                    </div>
                                </div>
                                
                                <div class="col-md-8">
                                    <div class="form-group">
                                     <label>Password</label>
                                        <input class="form-control"  required name="pwd" type="password" onfocus="this.placeholder = 'Enter Password'" onblur="this.placeholder = 'Enter Password'" placeholder="Enter Password">
                                    </div>
                                </div>
                                
                                 <div class="col-md-8">
                                    <div class="form-group">
                                     <label>Mobile No</label>
                                        <input class="form-control valid" required name="mobile" pattern="[6-9][0-9]{9}" type="tel" onfocus="this.placeholder = 'Enter Mobile No'" onblur="this.placeholder = 'Enter Mobile No'" placeholder="Enter Mobile No">
                                    </div>
                                </div>
                                 <div class="col-md-8">
                                    <div class="form-group">
                                     <label>Date Of Birth</label>
                                        <input class="form-control valid"  required name="dob"   max="<%= currentDate.toString() %>"type="date" />
                                    </div>
                                </div>
                                 <div class="col-md-8">
                                    <div class="form-group">
                                     <label>Gender</label>
                                        <select class="form-select mb-2" id="sel" onchange="getBtn()" required name="gender" >
                                        <option value="select">Select The Gender</option>
                                        	<option value="Male">Male</option>
                                        	<option value="Female">Female</option>
                                        	<option value="others">Others</option>
                                        </select>
                                    </div>
                                </div>
                                 <div class="col-md-8">
                                    <div class="form-group">
                                     <label>Full Address</label>
                                        <textarea class="form-control valid"  required name="address"  onfocus="this.placeholder = 'Enter Full Address'" onblur="this.placeholder = 'Enter Full Address'" placeholder="Enter Full Address"></textarea>
                                    </div>
                                </div> <div class="col-md-8">
                                    <div class="form-group">
                                     <label>Profile Image</label>
                                        <input class="form-control valid" required  name="image"  type="file" accept=".png.jpeg,.jpg"required>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" id="btn" class="genric-btn primary e-large">SUBMIT</button>
                                <a class="genric-btn primary e-large" href="customer.jsp">LOGIN</a>
                            </div>
                        </form>
                    </div>
                  
                </div>
            </div>
        </section>
    <!-- ================ contact section end ================= -->
    <%@include file="footer.jsp" %>
    </body>
    
    </html>