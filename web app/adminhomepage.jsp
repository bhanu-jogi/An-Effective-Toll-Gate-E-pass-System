<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="headlinks.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Section Styling */
        .section-pad-t30, .stats-section { 
            background: #f8f9fc; 
            padding: 60px 0; 
        }
        .section-tittle { 
            margin-bottom: 40px; 
            background: linear-gradient(90deg, #2c3e50, #3498db); 
            -webkit-background-clip: text; 
            color: transparent; 
        }
        .section-tittle span { 
            color: #fff; 
            background: #2c3e50; 
            padding: 5px 15px; 
            border-radius: 20px; 
            display: inline-block; 
        }

        /* Feature/Tools Card Styling */
        .feature-card { 
            border: none; 
            padding: 20px; 
            margin-bottom: 30px; 
            border-radius: 10px; 
            background: linear-gradient(135deg, #ffffff, #e8eef4); 
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); 
            transition: transform 0.3s ease, box-shadow 0.3s ease; 
            display: flex; 
            align-items: center; 
        }
        .feature-card:hover { 
            transform: translateY(-5px); 
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15); 
        }
        .feature-card i { 
            color: #3498db; 
            font-size: 3rem; 
            margin-right: 20px; 
        }
        .feature-card h5 { 
            color: #2c3e50; 
            font-weight: bold; 
            margin: 0 0 10px; 
        }
        .feature-card p { 
            color: #666; 
            font-size: 14px; 
            margin: 0 0 10px; 
        }
        .feature-card ul { 
            list-style: none; 
            padding: 0; 
            margin: 0; 
        }
        .feature-card ul li { 
            color: #555; 
            font-size: 14px; 
            margin-bottom: 5px; 
            position: relative; 
            padding-left: 20px; 
        }
        .feature-card ul li:before { 
            content: "\f058"; /* Font Awesome circle-check icon */
            font-family: "Font Awesome 5 Free"; 
            font-weight: 900; 
            color: #3498db; 
            position: absolute; 
            left: 0; 
        }

        /* Stats Card Styling */
        .stats-card { 
            border: none; 
            padding: 20px; 
            margin-bottom: 20px; 
            border-radius: 10px; 
            background: linear-gradient(135deg, #ffffff, #e8eef4); 
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); 
            text-align: center; 
        }
        .stats-card i { 
            color: #3498db; 
            font-size: 2.5rem; 
            margin-bottom: 15px; 
        }
        .stats-card h3 { 
            color: #2c3e50; 
            font-weight: bold; 
            margin: 0 0 10px; 
        }
        .stats-card p { 
            color: #666; 
            font-size: 16px; 
            margin: 0; 
        }

        /* Hero Area Styling */
        .hero-cap h2 { 
            background: linear-gradient(90deg, #2c3e50, #3498db); 
            -webkit-background-clip: text; 
            color: transparent; 
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); 
        }
    </style>
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
                            <h2>Welcome Admin!!</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero Area End -->

    <!-- Admin Tools Section Start -->
    <section class="our-services section-pad-t30">
        <div class="container">
            <!-- Section Tittle -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-tittle text-center">
                        <span>Admin Dashboard</span>
                        <h2>Admin Tools</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- Tool 1: Manage Toll Plazas -->
                <div class="col-xl-6 col-lg-6 col-md-6">
                    <div class="feature-card">
                        <i class="fas fa-road"></i>
                        <div>
                            <h5>Manage Toll Plazas</h5>
                            <p>Oversee and control all toll plazas in the system.</p>
                            <ul>
                                <li>Add new toll plazas</li>
                                <li>Update toll rates and status</li>
                                <li>Monitor toll activity</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Tool 2: User Management -->
                <div class="col-xl-6 col-lg-6 col-md-6">
                    <div class="feature-card">
                        <i class="fas fa-users-cog"></i>
                        <div>
                            <h5>User Management</h5>
                            <p>Handle customer accounts and their activities.</p>
                            <ul>
                                <li>View registered users</li>
                                <li>Approve or suspend accounts</li>
                                <li>Track user e-pass applications</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Admin Tools Section End -->

    <!-- System Features Section Start -->
    <section class="section-pad-t30">
        <div class="container">
            <!-- Section Tittle -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-tittle text-center">
                        <span>System Overview</span>
                        <h2>System Features</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- Feature 1: E-pass Management -->
                <div class="col-xl-6 col-lg-6 col-md-6">
                    <div class="feature-card">
                        <i class="fas fa-ticket-alt"></i>
                        <div>
                            <h5>E-pass Management</h5>
                            <p>Streamline e-pass issuance and tracking.</p>
                            <ul>
                                <li>Approve or reject e-pass requests</li>
                                <li>View e-pass history</li>
                                <li>Generate usage reports</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Feature 2: Real-time Monitoring -->
                <div class="col-xl-6 col-lg-6 col-md-6">
                    <div class="feature-card">
                        <i class="fas fa-desktop"></i>
                        <div>
                            <h5>Real-time Monitoring</h5>
                            <p>Keep track of system performance and activity.</p>
                            <ul>
                                <li>Monitor toll plaza traffic</li>
                                <li>Check system uptime</li>
                                <li>Receive alerts for issues</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- System Features Section End -->

    <!-- System Statistics Section Start -->
    <section class="stats-section">
        <div class="container">
            <!-- Section Tittle -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-tittle text-center">
                        <span>System Insights</span>
                        <h2>System Statistics</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- Static Stat 1 -->
                <div class="col-xl-3 col-lg-3 col-md-6">
                    <div class="stats-card">
                        <i class="fas fa-users"></i>
                        <h3>5,432</h3>
                        <p>Total Registered Users</p>
                    </div>
                </div>
                <!-- Static Stat 2 -->
                <div class="col-xl-3 col-lg-3 col-md-6">
                    <div class="stats-card">
                        <i class="fas fa-ticket-alt"></i>
                        <h3>12,345</h3>
                        <p>Total E-passes Issued</p>
                    </div>
                </div>
                <!-- Static Stat 3 -->
                <div class="col-xl-3 col-lg-3 col-md-6">
                    <div class="stats-card">
                        <i class="fas fa-road"></i>
                        <h3>25</h3>
                        <p>Active Toll Plazas</p>
                    </div>
                </div>
                <!-- Static Stat 4 -->
                <div class="col-xl-3 col-lg-3 col-md-6">
                    <div class="stats-card">
                        <i class="fas fa-clock"></i>
                        <h3>98%</h3>
                        <p>System Uptime</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- System Statistics Section End -->

    <%@include file="footer.jsp" %>
</body>
</html>