<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.List" %>

<%@ page import="entities.Diagnostic" %>
<html>
<head>
    <title>Diagnostic Result</title>
  
</head>
<body>

    <h2>Diagnostic Result</h2>

    <p>User ID: ${diagnostic.user_id}</p>

    <h3>Questions and Responses:</h3>
    <ul>
        <c:forEach var="question" items="${diagnostic.staticQuestions}" varStatus="loop">
            <li>
                ${question.expression}:
                <strong>${diagnostic.responses[loop.index]}</strong>
            </li>
        </c:forEach>
    </ul>

    <p>Risk Level: ${diagnostic.riskLevel}</p>

</body>
</html>
