<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.TrackDAO" %>
<%@ page import="entities.Track" %>
<%@ page import="entities.Track" %>
<%@ page import="enums.Feelings" %>
<%@ page import="enums.PainWorse" %>
<%@ page import="enums.Painlocation" %>
<%@ page import="enums.SymptomType" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-GLhlTQ8iUN+0iI6ft8ePvdjMraDOwbqL5fgeea0aQFfR8HP+BtL2Qv8Tx2D6tA" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/apexcharts@3.28.2/dist/apexcharts.min.css">
<script src="https://cdn.jsdelivr.net/npm/apexcharts@3.28.2/dist/apexcharts.min.js"></script>
    
    <script src="script.js" defer></script>
	<link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<title>AdminSite</title>
</head>
<body>
	
	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand"><img src="assets\img.png" width="70" 
			height="70" alt=""> PainCare</a>
		<ul class="side-menu">
			<li><a href="DashboardServlet" class="active"><i class='bx bxs-dashboard icon' ></i> Dashboard</a></li>
			<li class="divider" data-text="main">Main</li>
			<li>
				<a href="#"><i class='bx bxs-inbox icon' ></i> Elements <i class='bx bx-chevron-right icon-right' ></i></a>
				<ul class="side-dropdown">
					<li><a href="#">Alert</a></li>
					<li><a href="#">Badges</a></li>
					<li><a href="#">Breadcrumbs</a></li>
					<li><a href="#">Button</a></li>
				</ul>
			</li>
			<li><a href="TrackServlet?action=viewTrack"><i class='bx bxs-chart icon' ></i> Track</a></li>
			<li><a href="DiagnosticServlet"><i class='bx bxs-widget icon' ></i> Diagnostic</a></li>
			<li class="divider" data-text="table and forms">Table and forms</li>
			<li><a href="#"><i class='bx bx-table icon' ></i> Tables</a></li>
			<li>
				<a href="#"><i class='bx bxs-notepad icon' ></i> Forms <i class='bx bx-chevron-right icon-right' ></i></a>
				<ul class="side-dropdown">
					<li><a href="#">Basic</a></li>
					<li><a href="#">Select</a></li>
					<li><a href="#">Checkbox</a></li>
					<li><a href="#">Radio</a></li>
				</ul>
			</li>
		</ul>
		<div class="ads">
			<div class="wrapper">
				<a href="#" class="btn-upgrade">Upgrade</a>
				<p>Become a <span>PRO</span> member and enjoy <span>All Features</span></p>
			</div>
		</div>
	</section>
	<!-- SIDEBAR -->

	<!-- NAVBAR -->
	<section id="content">
		<!-- NAVBAR -->
		<nav>
			<i class='bx bx-menu toggle-sidebar' ></i>
			<form action="#">
				<div class="form-group">
					<input type="text" placeholder="Search...">
					<i class='bx bx-search icon' ></i>
				</div>
			</form>
			<a href="#" class="nav-link">
				<i class='bx bxs-bell icon' ></i>
				<span class="badge">5</span>
			</a>
			<a href="#" class="nav-link">
				<i class='bx bxs-message-square-dots icon' ></i>
				<span class="badge">8</span>
			</a>
			<span class="divider"></span>
			<div class="profile">
				<img src="https://images.unsplash.com/photo-1517841905240-472988babdf9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="">
				<ul class="profile-link">
					<li><a href="#"><i class='bx bxs-user-circle icon' ></i> Profile</a></li>
					<li><a href="#"><i class='bx bxs-cog' ></i> Settings</a></li>
					<li><a href="#"><i class='bx bxs-log-out-circle' ></i> Logout</a></li>
				</ul>
			</div>
		</nav>
		<!-- NAVBAR -->

		<!-- MAIN -->
		<main>
			<h1 class="title">Dashboard</h1>
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="divider">/</li>
				<% String action = request.getParameter("action");
	if (action == null) { %>
				<li><a href="#" class="active">Dashboard</a></li>
				<% }else if ("track".equals(action)) {%>
				<li><a href="#" class="active">Track</a></li>
				<% }else if ("Diagnostic".equals(action)) {%>
				<li><a href="#" class="active">Diagnostic</a></li>
				
				<%} %>
			
			</ul>
			<%if (action == null){ %>
			<div class="info-data">
				<div class="card">
					<div class="card-body">
					    <%@ page import="entities.Diagnostic"%>
					     <%@ page import="DAO.DiagnosticDAO"%>
					      <%@ page import="DAO.DiagnosticDAOImpl"%>
		<%
                Diagnostic lastDiagnostic = (Diagnostic) request.getAttribute("lastDiagnostic");
                if (lastDiagnostic != null) {
            %>
                    <h5 class="card-title">User ID: <%= lastDiagnostic.getUser_id() %></h5>
                    <p class="card-text">Risk Level: <%= lastDiagnostic.getRiskLevel() %></p>
            <%
                } else {
            %>
                    <p class="card-text">No diagnostic data available for this user.</p>
            <%
                }
            %>
        </div>
				</div>
				<div class="card">
					<div class="head">
						<div>
							<h2>234</h2>
							<p>Sales</p>
						</div>
						<i class='bx bx-trending-down icon down' ></i>
					</div>
					<span class="progress" data-value="60%"></span>
					<span class="label">60%</span>
				</div>
				<div class="card">
					<div class="head">
						<div>
							<h2>465</h2>
							<p>Pageviews</p>
						</div>
						<i class='bx bx-trending-up icon' ></i>
					</div>
					<span class="progress" data-value="30%"></span>
					<span class="label">30%</span>
				</div>
				<div class="card">
					<div class="head">
						<div>
							<h2>235</h2>
							<p>Visitors</p>
						</div>
						<i class='bx bx-trending-up icon' ></i>
					</div>
					<span class="progress" data-value="80%"></span>
					<span class="label">80%</span>
				</div>
			</div>
			<div class="data">
				<div class="content-data">
					<div class="head">
						<h3>PainLevel Track</h3>
						<div class="menu">
							<i class='bx bx-dots-horizontal-rounded icon'></i>
							<ul class="menu-link">
								<li><a href="#">Edit</a></li>
								<li><a href="#">Save</a></li>
								<li><a href="#">Remove</a></li>
							</ul>
						</div>
					</div>
					<div class="chart">
						<div id="chart"></div>
					</div>
				</div>
				<div class="content-data">
					<div class="head">
						<h3>Chatbox</h3>
						<div class="menu">
							<i class='bx bx-dots-horizontal-rounded icon'></i>
							<ul class="menu-link">
								<li><a href="#">Edit</a></li>
								<li><a href="#">Save</a></li>
								<li><a href="#">Remove</a></li>
							</ul>
						</div>
					</div>
					
						<!-- Messages will be dynamically added here -->
						<!--<div class="chatbox" id="chatbox"><div class="msg">
							<img src="c:\Users\SuperElectro\Downloads\img.png" alt="">
							<div class="chat">
								<div class="profile">
									<span class="username">PainCare Bot</span>
									<span class="time">18:30</span>
								</div>
								<p>Hi there 👋<br>How can I help you today?</p>
							</div>
						</div>-->
				
									



								<ul class="chatbox ">
									<li class="chat incoming">
										<img src="assets/img.png" alt="">
										<div class="chat">
											
									  <p>Hi there 👋<br>How can I help you today?<i class="fas fa-star"></i></p>
									</li>
								  </ul>
					  <!--<form onsubmit="sendMessage(); return false;">
						<div class="form-group">
						  <input type="text" id="user-input" placeholder="Type...">
						  <button type="submit" class="btn-send"><i class='bx bxs-send'></i></button>
						</div>
					  </form>-->
					  <div class="chat-input">
						<div class="line"></div>
						<textarea placeholder="Enter a message..." spellcheck="false" required></textarea>
						
					  </div>
					


			</div>
			<%}else if ("track".equals(action)) {%>	<%@ include file="trackInsertForm.jsp" %>
			<%}else if ("Diagnostic".equals(action)) {%>	<%@ include file="Diagnostic.jsp" %>
			<%}else if ("diaresult".equals(action)) {%>	<%@ include file="DiagnosticResult.jsp" %><%} %>
		</main>
		<!-- MAIN -->
	</section>
	<!-- NAVBAR -->
<script>
    // APEXCHART
    var data = [];

    <c:forEach var="track" items="${tracks}">
        // Append data for each track to the JavaScript array
        data.push({
            x: new Date('${track.date}').getTime(),
            y: ${track.painlevel}
        });
    </c:forEach>

    var options = {
        series: [{
            name: 'Pain Level',
            data: data // Use the dynamically generated data array
        }],
        chart: {
            height: 350,
            type: 'area'
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            curve: 'smooth'
        },
        xaxis: {
            type: 'datetime',
            // categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", ...]
        },
        tooltip: {
            x: {
                format: 'dd/MM/yy HH:mm'
            },
        },
    };

    var chart = new ApexCharts(document.querySelector("#chart"), options);
    chart.render();
</script>
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="script.js"></script>
</body>
</html>