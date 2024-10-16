<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Edit User Form</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="/paincare/Registration/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" type="text/css" href="/paincare/Registration/css/style.css">
    <%@ page import="entities.User" %>
    
</head>
<body>
<%
    User user = (User) request.getAttribute("user");
    String username = (user != null) ? user.getName() : "";
    String email = (user != null) ? user.getEmail() : "";
    int id = (user != null) ? user.getId() : -1;  // Utilise une valeur par défaut pour l'id
%>

    <div class="main">
        <!-- Edit User Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-form">
                        <h2 class="form-title">Edit User</h2>
                        <form method="post" action="/paincare/UserServlet?action=update&id=<%= id %>" enctype="multipart/form-data" >
						    <!-- Add form fields for editing user details -->
						    <div class="form-group">
						        <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
						        <input type="text" name="username" id="username" placeholder="Your Name" value="<%= username %>" />
						    </div>
						    <div class="form-group">
						        <label for="email"><i class="zmdi zmdi-lock"></i></label>
						        <input type="text" name="email" id="email" placeholder="email" value="<%= email %>"/>
						    </div>
						    <div class="form-group">
						        <label for="password"><i class="zmdi zmdi-lock"></i></label>
						        <input type="password" name="password" id="password" placeholder="New Password" />
						    </div>
						    <div class="form-group">
						        <label for="confirm-password"><i class="zmdi zmdi-lock"></i></label>
						        <input type="password" name="confirm-password" id="confirm-password" placeholder="Confirm Password" />
						    </div>
						    <div class="form-group">
						        
   								<input type="file" name="image" id="image" accept="image/*">
						    </div>
						    <div class="form-group">
						        <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
						        <label for="remember-me" class="label-agree-term">
						            <span><span></span></span>Remember me
						        </label>
						    </div>
						    <div class="form-group form-button">
						        <input type="submit"  class="form-submit" value="Save Changes" />
						    </div>
						</form>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="/paincare/Registration/js/main.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
