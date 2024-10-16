<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.List" %>
<%@ page import="enums.Painlocation, enums.SymptomType, enums.PainWorse, enums.Feelings" %>
<%@ page import="entities.Track" %>
	<link rel="stylesheet" href="style2.css">

<html>
<head>
    <title>Insert Track</title>
    <style>
.collapsible {
  background-color: #555;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 200%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 17px;
}

.active, .collapsible:hover {
  background-color: #777;
}

.content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
  background-color: #white;
  
}

:root {
  --form-control-color: rebeccapurple;
  --form-control-disabled: #959495;
}

*,
*:before,
*:after {
  box-sizing: border-box;
}

body {
  margin: 0;
}

form {
  display: grid;
  place-content: center;
  min-height: 100vh;
}

.form-control {
  font-family: system-ui, sans-serif;
  font-size: 2rem;
  font-weight: bold;
  line-height: 1.1;
  display: grid;
  grid-template-columns: 1em auto;
  gap: 0.5em;
}

.form-control + .form-control {
  margin-top: 1em;
}

.form-control--disabled {
  color: var(--form-control-disabled);
  cursor: not-allowed;
}

input[type="checkbox"] {
  /* Add if not using autoprefixer */
  -webkit-appearance: none;
  /* Remove most all native input styles */
  appearance: none;
  /* For iOS < 15 */
  background-color: var(--form-background);
  /* Not removed via appearance */
  margin: 0;

  font: inherit;
  color: currentColor;
  width: 1.15em;
  height: 1.15em;
  border: 0.15em solid currentColor;
  border-radius: 0.15em;
  transform: translateY(-0.075em);

  display: grid;
  place-content: center;
}

input[type="checkbox"]::before {
  content: "";
  width: 0.65em;
  height: 0.65em;
  clip-path: polygon(14% 44%, 0 65%, 50% 100%, 100% 16%, 80% 0%, 43% 62%);
  transform: scale(0);
  transform-origin: bottom left;
  transition: 120ms transform ease-in-out;
  box-shadow: inset 1em 1em var(--form-control-color);
  /* Windows High Contrast Mode */
  background-color: CanvasText;
}

input[type="checkbox"]:checked::before {
  transform: scale(1);
}

input[type="checkbox"]:focus {
  outline: max(2px, 0.15em) solid currentColor;
  outline-offset: max(2px, 0.15em);
}

input[type="checkbox"]:disabled {
  --form-control-color: var(--form-control-disabled);

  color: var(--form-control-disabled);
  cursor: not-allowed;
}

</style>
</head>
<body>



<form action="TrackServlet" method="post">
    <label for="painLevel">Pain Level:</label>
    <input type="text" name="painLevel" required><br>
<button type="button" for="painLoc" class="collapsible">Pain Location</button>
<div class="content">

  <c:forEach var="painLocation" items="${painLocations}">
    <input type="checkbox" name="painLoc[]" value="${painLocation}"> ${painLocation}
</c:forEach><br>
</label></div>

 
<button type="button" for="symptoms" class="collapsible">symptoms</button>
<div class="content">

<c:forEach var="symptom" items="${symptomTypes}">
    <input type="checkbox" name="symptoms[]" value="${symptom}"> ${symptom}
</c:forEach><br>
</div>
<button type="button" for="painWorse" class="collapsible">Pain Worse</button>
<div class="content">

<c:forEach var="painWorseEnum" items="${painWorses}">
    <input type="checkbox" name="painWorse[]" value="${painWorseEnum}"> ${painWorseEnum}
</c:forEach><br>
</div>
<button type="button" class="collapsible">Feelings</button>
<div class="content">
<label for="feelings">Feelings:</label>
<c:forEach var="feeling" items="${feelings}">
    <input type="checkbox" name="feelings[]" value="${feeling}"> ${feeling}
</c:forEach><br>
</div>


    <input type="submit" value="Submit">
</form>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="script.js"></script>
<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}
</script>

</body>
</html>
