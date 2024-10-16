<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="DAO.BlogDAO" %>
<%@ page import="entities.blog" %>
<%@ page import="entities.Commentaire" %>
<%@ page import="entities.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="DAO.UsersDAO" %>
<%@ page import="DAO.UsersDAOImpl" %> 
<%@ page import="entities.User" %>
<%@ page import="entities.Diagnostic"%>
 <%@ page import="DAO.DiagnosticDAO"%>
 <%@ page import="DAO.DiagnosticDAOImpl"%>
 <%@ page import="DAO.TrackDAO" %>
<%@ page import="entities.Track" %>
<%@ page import="enums.Feelings" %>
<%@ page import="enums.PainWorse" %>
<%@ page import="enums.Painlocation" %>
<%@ page import="enums.SymptomType" %>
<!DOCTYPE html>
<html >
<head>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
      integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/apexcharts@3.28.2/dist/apexcharts.min.css">
<script src="https://cdn.jsdelivr.net/npm/apexcharts@3.28.2/dist/apexcharts.min.js"></script>
 
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="style.css">
	
		
	
	<title>PainCare</title>
</head>
<body>
	<%
	 Connection conn =null ;
    HttpSession sssion = request.getSession();
    List<blog> blogs = (List<blog>) sssion.getAttribute("blogs");
    HttpSession ssion = request.getSession();
    Map<Integer, List<Commentaire>> commentsByBlogId = (Map<Integer, List<Commentaire>> ) ssion.getAttribute("commentsByBlogId");
    HttpSession sessio = request.getSession();
    System.out.println("Session attributes: " + sessio.getAttributeNames());

    if (!sessio.isNew()) {
        int userId = (int) sessio.getAttribute("userId");
       String imageUrl = (String) sessio.getAttribute("imageUrl"); 
       
       sessio.setAttribute("userId", userId);
    }   
%>
	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand"><img src="assets\img.png" width="70" 
			height="70" alt=""> PainCare</a>
		<ul class="side-menu">
			<li><a href="/paincare/DashboardServlet?userId=${userId}" class="active"><i class='bx bxs-dashboard icon' ></i> Dashboard</a></li>
			<li class="divider" data-text="main">Main</li>
			<li><a href="/paincare/TrackServlet?action=viewTrack?userId=${userId}"><i class='bx bxs-chart icon' ></i> Track</a></li>
			<li><a href="/paincare/DiagnosticServlet?userId=${userId}"><i class='bx bxs-widget icon' ></i> Diagnostic</a></li>
			<li><a href="User/base.jsp?action=cal"><i class='bx bx-calendar icon '></i> Calendar</a></li>
			
			<li><a href="/paincare/BlogServlet?action=liste&id=${userId}"><i class='bx bxs-conversation icon'></i>Community</a></li>
			
		</ul>
		
	</section>
	<!-- SIDEBAR -->

	<!-- NAVBAR -->
	<section id="content">
		<!-- NAVBAR -->
		<nav>
			<i class='bx bx-menu toggle-sidebar' ></i>
			<form action="/paincare/BlogServlet?action=search&id=${userId}" method="post">
				<div class="form-group">
					<input type="text" name="searchQuery" placeholder="Search...">
					<i class='bx bx-search icon' ></i>
				</div>
			</form>
			
			<a href="#" class="nav-link" onclick="openAlarmModal()">
				<i class='bx bxs-bell icon' ></i>
				
			</a>
			<div id="alarmModal" class="modal">
				<div class="modal-content">
					<span class="close" onclick="closeAlarmModal()">&times;</span>
					<!-- Insérez ici votre code HTML du réveil -->
					<div class="timer-display">00:00:00</div>
				      <div class="">
				        <div class="inputs">
				          <input
				            type="number"
				            id="hourInput"
				            placeholder="00"
				            min="0"
				            max="23"
				          />
				          <input
				            type="number"
				            id="minuteInput"
				            placeholder="00"
				            min="0"
				            max="59"
				          />
				        </div>
				        <button id="set">Add Alarm</button>
				        <div class="activeAlarms"></div>
				      </div>
				</div>
			</div>
			<span class="divider"></span>
			<div class="profile">
			   	  <c:set var="image" value="${imageUrl}" />
			
				<img src="${pageContext.request.contextPath}${imageUrl}" alt="">
				<ul class="profile-link">
					<li><a href="/paincare/UserServlet?action=edit&userid=${userId}"><i class='bx bxs-user-circle icon' ></i> Profile</a></li>
					<li><a href="/paincare/UserServlet?action=delete&userid=${userId}"><i class='bx bxs-trash'></i>Delete </a></li>
					<li><a href="/paincare/loginServlet?action=logout"><i class='bx bxs-log-out-circle' ></i> Logout</a></li>
				</ul>
			</div>
		</nav>
		<!-- NAVBAR -->

		<!-- MAIN -->
		<main>
			
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="divider">/</li>
				<% String action = request.getParameter("action");
	if (action == null) { %>
				<li><a href="#" class="active">Dashboard</a></li>
				<% }else if ("liste".equals(action)) {%>
				<li><a href="#" class="active">Community</a></li>
				<% }else if ("track".equals(action)) {%>
				<li><a href="#" class="active">Track</a></li>
				<% }else if ("Diagnostic".equals(action)) {%>
				<li><a href="#" class="active">Diagnostic</a></li>
				
				<%} %>
			</ul>
			<% 
	if (action == null) { %>
			<div class="info-data">
				<div class="card">
				 <div class="background"></div>
         <div class="image"></div>
            <div class="content">
					
					    <%@ page import="entities.Diagnostic"%>
					     <%@ page import="DAO.DiagnosticDAO"%>
					      <%@ page import="DAO.DiagnosticDAOImpl"%>
		<%
                Diagnostic lastDiagnostic = (Diagnostic) request.getAttribute("lastDiagnostic");
                if (lastDiagnostic != null) {
            %>
                 
                    <p class="card-text">Your Risk Level is :<br> <%= lastDiagnostic.getRiskLevel() %></p>
            <%
                } else {
            %>
                    <p class="card-text">No diagnostic data available for this user.</p>
            <%
                }
            %>
           <i class='bx bx-line-chart-down'></i>
        </div>
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
				
					
					<ul class="chatbox ">
						<li class="chat incoming">
										<img src="assets/img.png" alt="">
										<div class="chat">
											
									  <p>Hi there 👋<br>How can I help you today?<i class="fas fa-star"></i></p>
									  </div>
						</li>
					</ul>
					  
				<div class="chat-input">
						<div class="line"></div>
						<textarea placeholder="Enter a message..." spellcheck="false" required></textarea>
						
				</div>
			</div>
			</div>
			<% } %>
<% if ("liste".equals(action)) { %><%@ include file="bloglist.jsp" %>			<% } %>
<% if ("search".equals(action)) { %> <%@ include file="search.jsp" %> 
<%}else if ("track".equals(action)) {%>	<%@ include file="trackInsertForm.jsp" %>
<%}else if ("Diagnostic".equals(action)) { %>	
<%@ include file="Diagnostic.jsp" %>
<%}else if ("diaresult".equals(action)) {%>	<%@ include file="DiagnosticResult.jsp" %>
			<%}else if ("cal".equals(action)) {%>
			<!--Calendrier-->
			<div class="container">
				<div class="left">
					<div class="calendar">
					  <div class="month">
						<i class="fas fa-angle-left prev"></i>
						<div class="date">december 2015</div>
						<i class="fas fa-angle-right next"></i>
					  </div>
					  <div class="weekdays">
						<div>Sun</div>
						<div>Mon</div>
						<div>Tue</div>
						<div>Wed</div>
						<div>Thu</div>
						<div>Fri</div>
						<div>Sat</div>
					  </div>
					  <div class="days"></div>
					  <div class="goto-today">
						<div class="goto">
						  <input type="text" placeholder="mm/yyyy" class="date-input" />
						  <button class="goto-btn">Go</button>
						</div>
						<button class="today-btn">Today</button>
					  </div>
					</div>
				  </div>
				  <div class="right">
					<div class="today-date">
					  <div class="event-day">wed</div>
					  <div class="event-date">12th december 2022</div>
					</div>
					<div class="events"></div>
					<div class="add-event-wrapper">
					  <div class="add-event-header">
						<div class="title">Add Event</div>
						<i class="fas fa-times close"></i>
					  </div>
					  <div class="add-event-body">
						<div class="add-event-input">
						  <input type="text" placeholder="Event Name" class="event-name" />
						</div>
						<div class="add-event-input">
						  <input
							type="text"
							placeholder="Event Time From"
							class="event-time-from"
						  />
						</div>
						<div class="add-event-input">
						  <input
							type="text"
							placeholder="Event Time To"
							class="event-time-to"
						  />
						</div>
					  </div>
					  <div class="add-event-footer">
						<button class="add-event-btn">Add Event</button>
					  </div>
					</div>
				  </div>
				  <button class="add-event">
					<i class="fas fa-plus"></i>
				  </button>
			</div><% } %>


		</main>
		<!-- MAIN -->
	</section>
	<!-- NAVBAR -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

	
	<script src="script.js" ></script>
<script src="alarmscript.js" defer></script>
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	
	
<script>//ALARME ***************


function openAlarmModal() {
 var modal = document.getElementById('alarmModal');
 modal.style.display = 'block';
}

function closeAlarmModal() {
 var modal = document.getElementById('alarmModal');
 modal.style.display = 'none';
}
</script>	
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
            //categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", ...]
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
</body>
</html>