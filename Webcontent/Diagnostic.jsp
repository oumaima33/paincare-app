<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="jakarta.servlet.http.HttpSession" %>
    
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
<%
   int id = (int) session.getAttribute("userId");
   
    request.setAttribute("Iduser", id); 
    int Iduser = (int) request.getAttribute("Iduser");


%>

   <div class="formbold-main-wrapper">
  <!-- Author: FormBold Team -->
  <!-- Learn More: https://formbold.com -->
  <div class="formbold-form-wrapper">
    <form id="diagnosticForm" action="DiagnosticServlet?userId=${Iduser}" method="post" >
     <img src="assets\diag.jpg" width="100%" margin-top=0px;
			height="50%" alt="">
    <input type="hidden" name="user_id" value="123"> <!-- Replace 123 with the actual user id -->
    
      
 <%@ page import="entities.Diagnostic"%><% 
            Diagnostic diagnostic = new Diagnostic(); // Create an instance of Diagnostic
           
        %>
        <div class="formbold-form-step-1 active">
         
            <div>

          <div>
            <label for="qusOne" class="formbold-form-label">
       <%= diagnostic.getStaticQuestions().get(0).getExpression() %>
        </label>
  <% for (String choice : diagnostic.getStaticQuestions().get(0).getChoices()) { %>
        <div class="formbold-radio-flex">
          <div class="formbold-radio-group">
            <label class="formbold-radio-label">
              <input
                class="formbold-input-radio"
                type="radio"
              name="question<%= 1 %>"
                id="qusOne"
                value="<%= choice %>"
              required/>
           <%= choice %>
              <span class="formbold-radio-checkmark"></span>
            </label>
          </div>

          </div>
          <% } %>
        </div>
      
</div>
</div>
        <div class="formbold-form-step-2">
   <div>
            <label for="qusOne" class="formbold-form-label">
       <%= diagnostic.getStaticQuestions().get(1).getExpression() %>
        </label>
  <% for (String choice : diagnostic.getStaticQuestions().get(1).getChoices()) { %>
        <div class="formbold-radio-flex">
          <div class="formbold-radio-group">
            <label class="formbold-radio-label">
              <input
                class="formbold-input-radio"
                type="radio"
                 name="question<%= 2 %>"
                id="qusOne"
                value="<%= choice %>"
              />
           <%= choice %>
              <span class="formbold-radio-checkmark"></span>
            </label>
          </div>

          </div>
          <% } %>
        </div>
      
</div>
 <div class="formbold-form-step-3">
   <div>
            <label for="qusOne" class="formbold-form-label">
       <%= diagnostic.getStaticQuestions().get(2).getExpression() %>
        </label>
  <% for (String choice : diagnostic.getStaticQuestions().get(2).getChoices()) { %>
        <div class="formbold-radio-flex">
          <div class="formbold-radio-group">
            <label class="formbold-radio-label">
              <input
                class="formbold-input-radio"
                type="radio"
                 name="question<%= 3 %>"
                id="qusOne"
                value="<%= choice %>"
              />
           <%= choice %>
              <span class="formbold-radio-checkmark"></span>
            </label>
          </div>

          </div>
          <% } %>
        </div>
      
</div>
 <div class="formbold-form-step-4">
   <div>
            <label for="qusOne" class="formbold-form-label">
       <%= diagnostic.getStaticQuestions().get(3).getExpression() %>
        </label>
  <% for (String choice : diagnostic.getStaticQuestions().get(3).getChoices()) { %>
        <div class="formbold-radio-flex">
          <div class="formbold-radio-group">
            <label class="formbold-radio-label">
              <input
                class="formbold-input-radio"
                type="radio"
                 name="question<%= 4 %>"
                id="qusOne"
                value="<%= choice %>"
              />
           <%= choice %>
              <span class="formbold-radio-checkmark"></span>
            </label>
          </div>

          </div>
          <% } %>
        </div>
      
</div>
 <div class="formbold-form-step-5">
   <div>
            <label for="qusOne" class="formbold-form-label">
       <%= diagnostic.getStaticQuestions().get(4).getExpression() %>
        </label>
  <% for (String choice : diagnostic.getStaticQuestions().get(4).getChoices()) { %>
        <div class="formbold-radio-flex">
          <div class="formbold-radio-group">
            <label class="formbold-radio-label">
              <input
                class="formbold-input-radio"
                type="radio"
                 name="question<%= 5 %>"
                id="qusOne"
                value="<%= choice %>"
              />
           <%= choice %>
              <span class="formbold-radio-checkmark"></span>
            </label>
          </div>

          </div>
          <% } %>
        </div>
      
</div>
 <div class="formbold-form-step-6">
   <div>
            <label for="qusOne" class="formbold-form-label">
       <%= diagnostic.getStaticQuestions().get(5).getExpression() %>
        </label>
  <% for (String choice : diagnostic.getStaticQuestions().get(5).getChoices()) { %>
        <div class="formbold-radio-flex">
          <div class="formbold-radio-group">
            <label class="formbold-radio-label">
              <input
                class="formbold-input-radio"
                type="radio"
                 name="question<%= 6%>"
                id="qusOne"
                value="<%= choice %>"
              />
           <%= choice %>
              <span class="formbold-radio-checkmark"></span>
            </label>
          </div>

          </div>
          <% } %>
        </div>
      
</div>
 <div class="formbold-form-step-7">
   <div>
            <label for="qusOne" class="formbold-form-label">
       <%= diagnostic.getStaticQuestions().get(6).getExpression() %>
        </label>
  <% for (String choice : diagnostic.getStaticQuestions().get(6).getChoices()) { %>
        <div class="formbold-radio-flex">
          <div class="formbold-radio-group">
            <label class="formbold-radio-label">
              <input
                class="formbold-input-radio"
                type="radio"
                 name="question<%= 7 %>"
                id="qusOne"
                value="<%= choice %>"
              />
           <%= choice %>
              <span class="formbold-radio-checkmark"></span>
            </label>
          </div>

          </div>
          <% } %>
        </div>
      
</div>
 <div class="formbold-form-step-8">
   <div>
            <label for="qusOne" class="formbold-form-label">
       <%= diagnostic.getStaticQuestions().get(7).getExpression() %>
        </label>
  <% for (String choice : diagnostic.getStaticQuestions().get(7).getChoices()) { %>
        <div class="formbold-radio-flex">
          <div class="formbold-radio-group">
            <label class="formbold-radio-label">
              <input
                class="formbold-input-radio"
                type="radio"
                 name="question<%= 8 %>"
                id="qusOne"
                value="<%= choice %>"
              />
           <%= choice %>
              <span class="formbold-radio-checkmark"></span>
            </label>
          </div>

          </div>
          <% } %>
        </div>
      
</div>
 <div class="formbold-form-step-9">
   <div>
            <label for="qusOne" class="formbold-form-label">
       <%= diagnostic.getStaticQuestions().get(8).getExpression() %>
        </label>
  <% for (String choice : diagnostic.getStaticQuestions().get(8).getChoices()) { %>
        <div class="formbold-radio-flex">
          <div class="formbold-radio-group">
            <label class="formbold-radio-label">
              <input
                class="formbold-input-radio"
                type="radio"
                 name="question<%= 9 %>"
                id="qusOne"
                value="<%= choice %>"
              />
           <%= choice %>
              <span class="formbold-radio-checkmark"></span>
            </label>
          </div>

          </div>
          <% } %>
        </div>
      
</div>
 <div class="formbold-form-step-10">
   <div>
            <label for="qusOne" class="formbold-form-label">
       <%= diagnostic.getStaticQuestions().get(9).getExpression() %>
        </label>
  <% for (String choice : diagnostic.getStaticQuestions().get(9).getChoices()) { %>
        <div class="formbold-radio-flex">
          <div class="formbold-radio-group">
            <label class="formbold-radio-label">
              <input
                class="formbold-input-radio"
                type="radio"
                 name="question<%= 10 %>"
                id="qusOne"
                value="<%= choice %>"
              />
           <%= choice %>
              <span class="formbold-radio-checkmark"></span>
            </label>
          </div>

          </div>
          <% } %>
        </div>
      
</div>

  
  <button type="submit" value="Submit" class="formbold-btn">Submit</button>
        </div>
    </form>
  </div>
</div>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
 @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  body {
    font-family: 'Inter', sans-serif;
  }
  .formbold-main-wrapper {
  
    display: flex;
    align-items: center;
    justify-content: center;
    padding:0px;
  }

  .formbold-form-wrapper {
   border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); /* Box shadow for a subtle effect */
    margin: 0 auto;
    max-width: 800px;
    width: 100%;
    background: white;
    padding: 40px;
  }

  .formbold-img {
    display: block;
    margin: 0 auto 40px;
  }

  .formbold-form-input {
    width: 100%;
    padding: 13px 22px;
    border-radius: 5px;
    border: 1px solid #dde3ec;
    background: #ffffff;
    font-weight: 500;
    font-size: 16px;
    color: #536387;
    outline: none;
    resize: none;
  }
  .formbold-form-input:focus {
    border-color: #6a64f1;
    box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
  }
  .formbold-form-label {
    color: #07074d;
    font-weight: 500;
   
    line-height: 24px;
    display: block;
    margin-bottom: 20px;
    font-family: 'Roboto', sans-serif;
    font-size: 15px;
  
  }
  .formbold-form-label span {
    color: #536387;
    font-size: 12px;
    line-height: 18px;
    display: inline-block;
  }

  .formbold-mb-3 {
    margin-bottom: 15px;
  }
  .formbold-mb-6 {
    margin-bottom: 30px;
  }
  .formbold-radio-flex {
    display: flex;
    flex-direction: column;
    gap: 10px;
  }
  .formbold-radio-label {
    font-size: 14px;
    line-height: 24px;
    color: #07074d;
    position: relative;
    padding-left: 25px;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }
  .formbold-input-radio {
    position: absolute;
    opacity: 0;
    cursor: pointer;
  }
  .formbold-radio-checkmark {
    position: absolute;
    top: -1px;
    left: 0;
    height: 18px;
    width: 18px;
    background-color: #ffffff;
    border: 1px solid #dde3ec;
    border-radius: 50%;
  }
  .formbold-radio-label
    .formbold-input-radio:checked
    ~ .formbold-radio-checkmark {
    background-color: #6a64f1;
  }
  .formbold-radio-checkmark:after {
    content: '';
    position: absolute;
    display: none;
  }

  .formbold-radio-label
    .formbold-input-radio:checked
    ~ .formbold-radio-checkmark:after {
    display: block;
  }

  .formbold-radio-label .formbold-radio-checkmark:after {
    top: 50%;
    left: 50%;
    width: 10px;
    height: 10px;
    border-radius: 50%;
    background: #ffffff;
    transform: translate(-50%, -50%);
  }

  .formbold-btn {
    text-align: center;
    width: 100%;
    font-size: 16px;
    border-radius: 5px;
    padding: 14px 25px;
    border: none;
    font-weight: 500;
    background-color: #6a64f1;
    color: white;
    cursor: pointer;
    margin-top: 25px;
  }
  .formbold-btn:hover {
    box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
  }

</style>

</body>
</html>