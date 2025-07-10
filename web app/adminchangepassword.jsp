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
                            <h2>Change Password</h2>
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
                        <form class="form-contact contact_form" action="adminchangepassworddata.jsp" method="post" >
                            <div class="row">
                               
                                <%String email=(String)session.getAttribute("email"); %>
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <input class="form-control valid" readonly value="<%=email %>" name="email"  type="email" onfocus="this.placeholder = 'Enter Email Address'" onblur="this.placeholder = 'Enter Email Address'" placeholder="Enter Email Address">
                                    </div> 
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <input class="form-control" required  name="oldpwd" type="password" onfocus="this.placeholder = 'Enter Old Password'" onblur="this.placeholder = 'Enter Old Password'" placeholder="Enter Old Password">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <input class="form-control"  required name="newpwd" type="password" onfocus="this.placeholder = 'Enter New Password'" onblur="this.placeholder = 'Enter New Password'" placeholder="Enter New Password">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" class="button button-contactForm boxed-btn">SUBMIT</button>
                            </div>
                        </form>
                    </div>
                   <!--  <div class="col-lg-3 offset-lg-1">
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-home"></i></span>
                            <div class="media-body">
                                <h3>Buttonwood, California.</h3>
                                <p>Rosemead, CA 91770</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                            <div class="media-body">
                                <h3>+1 253 565 2365</h3>
                                <p>Mon to Fri 9am to 6pm</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-email"></i></span>
                            <div class="media-body">
                                <h3>support@colorlib.com</h3>
                                <p>Send us your query anytime!</p>
                            </div>
                        </div>
                    </div> -->
                </div>
            </div>
        </section>
    <!-- ================ contact section end ================= -->
    <%@include file="footer.jsp" %>
    </body>
    
    </html>