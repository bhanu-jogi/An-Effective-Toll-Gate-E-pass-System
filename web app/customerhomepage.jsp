<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="headlinks.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* General Section Styling */
        .section-tittle { 
            margin-bottom: 40px; 
            background: linear-gradient(90deg, #1e3c72, #2a5298); 
            -webkit-background-clip: text; 
            color: transparent; 
        }
        
        .section-pad-t30, .feature-padding { 
            background: #f4f7fa; 
            padding: 60px 0; 
        }

        /* Vehicle Card Styling */
        .vehicle-card { 
            border: none; 
            padding: 20px; 
            margin-bottom: 20px; 
            border-radius: 10px; 
            background: linear-gradient(135deg, #ffffff, #e6ecf5); 
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); 
            transition: transform 0.3s ease, box-shadow 0.3s ease; 
        }
        .vehicle-card:hover { 
            transform: translateY(-5px); 
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15); 
        }
        .vehicle-card i { 
            color: #2a5298; 
            margin-bottom: 15px; 
        }
        .vehicle-card h5 { 
            margin: 0 0 10px; 
            color: #1e3c72; 
            font-weight: bold; 
        }
        .vehicle-card h6 { 
            color: #2a5298; 
            margin: 0 0 10px; 
        }
        .vehicle-card p { 
            color: #555; 
            font-size: 14px; 
        }
        .btn-action { 
            margin-top: 10px; 
            background: linear-gradient(90deg, #2a5298, #1e3c72); 
            color: #fff; 
            border: none; 
            padding: 8px 20px; 
            border-radius: 25px; 
            transition: background 0.3s ease; 
        }
        .btn-action:hover { 
            background: linear-gradient(90deg, #1e3c72, #2a5298); 
            color: #fff; 
        }

        /* E-pass Card Styling */
        .epass-card { 
            border: none; 
            padding: 20px; 
            margin-bottom: 20px; 
            border-radius: 10px; 
            background: linear-gradient(135deg, #ffffff, #e6ecf5); 
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); 
            transition: transform 0.3s ease, box-shadow 0.3s ease; 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
        }
        .epass-card:hover { 
            transform: translateY(-5px); 
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15); 
        }
        .epass-card h5 { 
            margin: 0 0 10px; 
            color: #1e3c72; 
            font-weight: bold; 
        }
        .epass-card ul { 
            list-style: none; 
            padding: 0; 
            margin: 0; 
        }
        .epass-card ul li { 
            color: #555; 
            font-size: 14px; 
            margin-bottom: 5px; 
        }
        .epass-card .items-link a { 
            background: linear-gradient(90deg, #2a5298, #1e3c72); 
            color: #fff; 
            padding: 8px 20px; 
            border-radius: 25px; 
            text-decoration: none; 
            transition: background 0.3s ease; 
        }
        .epass-card .items-link a:hover { 
            background: linear-gradient(90deg, #1e3c72, #2a5298); 
        }

        /* Add New Vehicle Button */
        .border-btn2 { 
            background: linear-gradient(90deg, #2a5298, #1e3c72); 
            color: #fff; 
            border: none; 
            padding: 10px 30px; 
            border-radius: 25px; 
            transition: background 0.3s ease; 
        }
        .border-btn2:hover { 
            background: linear-gradient(90deg, #1e3c72, #2a5298); 
            color: #fff; 
        }

        /* Hero Area Styling */
        .hero-cap h2 { 
            background: linear-gradient(90deg, #1e3c72, #2a5298); 
            -webkit-background-clip: text; 
            color: transparent; 
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); 
        }
    </style>
</head>

<body>
    <%@include file="customerheader.jsp" %>
    <%@include file="connect.jsp" %>
    <%
    String name = "";
    try {
        String email = (String) session.getAttribute("email");
        PreparedStatement ps = con.prepareStatement("select * from customer where cemail=?");
        ps.setString(1, email);
        rs = ps.executeQuery();
        while (rs.next()) {
            name = rs.getString(2); 
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>

    <!-- Hero Area Start-->
    <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Welcome <%=name%>!!</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero Area End-->

    <!-- Your Vehicles Section Start -->
    <section class="our-services section-pad-t30">
        <div class="container">
            <!-- Section Tittle -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-tittle text-center">
                        <span>Your Dashboard</span>
                        <h2>Your Vehicles</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <%
                try {
                    String email = (String) session.getAttribute("email");
                    PreparedStatement psVehicles = con.prepareStatement("SELECT * FROM vehicles WHERE vcemail=?");
                    psVehicles.setString(1, email);
                    ResultSet rsVehicles = psVehicles.executeQuery();
                    int vehicleCount = 0;
                    while (rsVehicles.next() && vehicleCount < 3) { // Limiting to 3 vehicles for display
                        vehicleCount++;
                        String vehicleNumber = rsVehicles.getString("vnumber");
                        String vehicleType = rsVehicles.getString("vtype");
                %>
                <div class="col-xl-4 col-lg-4 col-md-6">
                    <div class="vehicle-card text-center">
                        <i class="fas fa-car fa-2x"></i>&nbsp;
                        <i class="fas fa-motorcycle fa-2x"></i>&nbsp;
                        <i class="fas fa-truck fa-2x"></i>
                        <h5><%=vehicleNumber%></h5>
                        <h6><%=rsVehicles.getString("vname")%></h6>
                        <p>Type: <%=vehicleType%></p>
                    </div>
                </div>
                <%
                    }
                    if (vehicleCount == 0) {
                %>
                <div class="col-xl-12 text-center">
                    <p>No vehicles registered yet. <a href="customeraddvechile.jsp">Add a vehicle</a> to get started!</p>
                </div>
                <%
                    }
                    rsVehicles.close();
                    psVehicles.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <a href="customeraddvechile.jsp" class="btn border-btn2 mt-30">++Add New Vehicle</a>
                </div>
            </div>
        </div>
    </section>
    <!-- Your Vehicles Section End -->

    <!-- Recent E-pass Applications Section Start -->
    <section class="featured-job-area feature-padding">
        <div class="container">
            <!-- Section Tittle -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-tittle text-center">
                        <span>Your Activity</span>
                        <h2>Recent E-pass Applications</h2>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-xl-10">
                    <%
                    try {
                        String email = (String) session.getAttribute("email");
                        PreparedStatement psEpass = con.prepareStatement(
                            "SELECT epass.epassid, epass.tolplid, epass.evnumber, epass.epassstatus, tollplaza.tpname " +
                            "FROM epass JOIN tollplaza ON epass.tolplid = tollplaza.tpid " +
                            "WHERE epass.cpemail=? ORDER BY epass.edate DESC LIMIT 3"
                        );
                        psEpass.setString(1, email);
                        ResultSet rsEpass = psEpass.executeQuery();
                        int epassCount = 0;
                        while (rsEpass.next() && epassCount < 3) { // Limiting to 3 recent applications
                            epassCount++;
                            String epassId = rsEpass.getString("epassid");
                            String tollName = rsEpass.getString("tpname");
                            String vehicleNumber = rsEpass.getString("evnumber");
                            String status = rsEpass.getString("epassstatus");
                    %>
                    <div class="epass-card mb-30">
                        <div class="job-items">
                            <div class="job-tittle">
                                <h5>E-pass ID: <%=epassId%></h5>
                                <ul>
                                    <li>Toll Plaza: <%=tollName%></li>
                                    <li>Vehicle: <%=vehicleNumber%></li>
                                    <li>Status: <%=status%></li>
                                </ul>
                            </div>
                        </div>
                        <%-- <div class="items-link f-right">
                            <a href="epass_details.jsp?id=<%=epassId%>">View Details</a>
                        </div> --%>
                    </div>
                    <%
                        }
                        if (epassCount == 0) {
                    %>
                    <div class="col-xl-12 text-center">
                        <p>No e-pass applications yet now!</p>
                    </div>
                    <%
                        }
                        rsEpass.close();
                        psEpass.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
                </div>
            </div>
        </div>
    </section>
    <!-- Recent E-pass Applications Section End -->

    <%@include file="footer.jsp" %>
</body>
</html>