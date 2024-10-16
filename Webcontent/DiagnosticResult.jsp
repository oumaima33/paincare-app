<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.List" %>

<%@ page import="entities.Diagnostic" %>

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

   <div class="formbold-main-wrapper">
  <!-- Author: FormBold Team -->
  <!-- Learn More: https://formbold.com -->
  <div class="formbold-form-wrapper">
   <img src="assets\resultoum.png" width="50%" margin-top=0px;
			height="50%" class="center">
    <input type="hidden" name="user_id" value="123"> <!-- Replace 123 with the actual user id -->
    
      <h3>Overview of Diagnostic</h3><br>
    <ul>
        <c:forEach var="question" items="${diagnostic.staticQuestions}" varStatus="loop">
            <li>
                ${question.expression}:<br>
                <strong>${diagnostic.responses[loop.index]}</strong><br>
            </li>
        </c:forEach>
    </ul>
    <p> Your Risk Level: <strong>${diagnostic.riskLevel}</strong></p>
 
  </div>
</div>
<style>
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}

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
    font-family: 'Roboto', sans-serif;
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