<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.List" %>
<%@ page import="enums.Painlocation, enums.SymptomType, enums.PainWorse, enums.Feelings" %>
<%@ page import="entities.Track" %>

<html>
<head>

</head>

<body>
<%         int userId = (int) session.getAttribute("userId");
    %>

<div class="formbold-main-wrapper">
  <!-- Author: FormBold Team -->
  <!-- Learn More: https://formbold.com -->
  <div class="formbold-form-wrapper">
         <img src="assets\track.jpg" width="100%" margin-top=0px;
			height="50%" alt="">
    <form action="TrackServlet?userId=${userId}" method="post">
      <div class="formbold-mb-6">
        <label for="qusOne" class="formbold-form-label">
       On a scale of 0 to 10, how would you rate your current pain level ?
  </label>
 <input type="range" name="painLevel" class="form-control-range" min="0" max="10" width="100%" value="0" required> 
      </div>
 <div class="formbold-mb-6">
        <label for="qusTwo" class="formbold-form-label">
     Where is the location of your pain ?
        </label>
 <c:forEach var="painLocation" items="${painLocations}">
        <div class="formbold-radio-flex">
          <div class="formbold-radio-group">
            <label class="formbold-radio-label">
              <input
                class="formbold-input-radio"
               type="checkbox"
               
                id="qusTwo"
               name="painLoc[]" value="${painLocation}"
              />
           ${painLocation}
              <span class="formbold-radio-checkmark"></span>
            </label>
          </div>
    </c:forEach>
      <div class="formbold-mb-6">
        <label for="qusTwo" class="formbold-form-label">
        What specific symptoms have you been experiencing ? 
        </label>
 <c:forEach var="symptom" items="${symptomTypes}">
        <div class="formbold-radio-flex">
          <div class="formbold-radio-group">
            <label class="formbold-radio-label">
              <input
                class="formbold-input-radio"
              type="checkbox"
               
                id="qusTwo"
                name="symptoms[]" value="${symptom}"
              />
            ${symptom}
              <span class="formbold-radio-checkmark"></span>
            </label>
          </div>
    </c:forEach>

         

      <div class="formbold-mb-6">
        <label for="qusThree" class="formbold-form-label">
          what's the factor that makes your pain worse?
        </label>
<c:forEach var="painWorseEnum" items="${painWorses}">
        <div class="formbold-radio-flex">
          <div class="formbold-radio-group">
            <label class="formbold-radio-label">
              <input
                class="formbold-input-radio"
              type="checkbox"
                name="painWorse[]"
                 value="${painWorseEnum}"
                id="qusThree"
              />
          ${painWorseEnum}
              <span class="formbold-radio-checkmark"></span>
            </label>
          </div>
</c:forEach>
  <div class="formbold-mb-6">
        <label for="qusThree" class="formbold-form-label">
          How would you describe your current emotional state or feelings ?
        </label>
<c:forEach var="feeling" items="${feelings}">
        <div class="formbold-radio-flex">
          <div class="formbold-radio-group">
            <label class="formbold-radio-label">
              <input
                class="formbold-input-radio"
                type="checkbox"
                name="feelings[]" value="${feeling}"
                id="qusThree"
              />
       ${feeling}
              <span class="formbold-radio-checkmark"></span>
            </label>
          </div>
</c:forEach>
         


      <button type="submit" value="Submit" class="button-9">Submit</button>
    </form>
  </div>
</div>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
<style>
/*********** Baseline, reset styles ***********/
input[type="range"] {
  -webkit-appearance: none;
  appearance: none;
  background: transparent;
  cursor: pointer;
  width: 25rem;
}

/* Removes default focus */
input[type="range"]:focus {
  outline: none;
}

/******** Chrome, Safari, Opera and Edge Chromium styles ********/
/* slider track */
input[type="range"]::-webkit-slider-runnable-track {
  background-color: #c399d6;
  border-radius: 0.5rem;
  height: 0.5rem;
}

/* slider thumb */
input[type="range"]::-webkit-slider-thumb {
  -webkit-appearance: none; /* Override default look */
  appearance: none;
  margin-top: -4px; /* Centers thumb on the track */
  background-color: #b040bf;
  border-radius: 0.5rem;
  height: 1rem;
  width: 1rem;
}

input[type="range"]:focus::-webkit-slider-thumb {
  outline: 3px solid #b040bf;
  outline-offset: 0.125rem;
}

/*********** Firefox styles ***********/
/* slider track */
input[type="range"]::-moz-range-track {
  background-color: #c399d6;
  border-radius: 0.5rem;
  height: 0.5rem;
}

/* slider thumb */
input[type="range"]::-moz-range-thumb {
  background-color: #b040bf;
  border: none; /*Removes extra border that FF applies*/
  border-radius: 0.5rem;
  height: 1rem;
  width: 1rem;
}

input[type="range"]:focus::-moz-range-thumb{
  outline: 3px solid #b040bf;
  outline-offset: 0.125rem;
}
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