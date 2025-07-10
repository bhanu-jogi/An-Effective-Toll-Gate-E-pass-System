<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>

<body>
   
    <%@include file="adminheader.jsp" %>
    <!-- Hero Area Start-->
    <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Add Notification</h2>
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
                    
                    <div class="col-lg-8">
                        <form class="form-contact contact_form" action="adminaddnotificationdata.jsp" method="post" >
                            <div class="row">
                               
                                
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <input class="form-control valid"  required name="title"  type="text" onfocus="this.placeholder = 'Enter Title'" onblur="this.placeholder = 'Enter Title'" placeholder="Enter Title">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <textarea class="form-control" required  name="desc"  onfocus="this.placeholder = 'Enter Description'" onblur="this.placeholder = 'Enter Description'" placeholder="Enter Description"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" class="genric-btn danger e-large">ADD</button>
                              
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