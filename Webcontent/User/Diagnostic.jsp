<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Diagnostic Form</title>
    <!-- Add Bootstrap CSS link for styling -->
  
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script>
    
    </script>
</head>
<body>

    <form id="diagnosticForm" action="DiagnosticServlet" method="post" onsubmit="showResultModal()">
        <!-- Your existing form code -->

        <input type="hidden" name="user_id" value="7"> <!-- Replace 123 with the actual user id -->

        <%@ page import="entities.Diagnostic"%><% 
            Diagnostic diagnostic = new Diagnostic(); // Create an instance of Diagnostic
            for (int i = 0; i < diagnostic.getStaticQuestions().size(); i++) {
        %>
            <p>Question <%= i+1 %>: <%= diagnostic.getStaticQuestions().get(i).getExpression() %></p>
            <% for (String choice : diagnostic.getStaticQuestions().get(i).getChoices()) { %>
                <label>
                    <input type="radio" name="question<%= i+1 %>" value="<%= choice %>"> <%= choice %>
                </label>
            <% } %>
            <br>
        <% } %>
        
      
        <input type="submit" value="Submit">
    </form>


</body>
</html>
