<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Map" %>

<%@ page import="DAO.BlogDAO" %>
<%@ page import="entities.blog" %>
<%@ page import="entities.Commentaire" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>BLogs</title>
</head>
<body>


<h2>Liste des Blogs</h2><button onclick="openAddBlogModal()">Ajouter un Blog</button>
			<div id="addBlogModal" class="modal">
			    <div class="modal-content">
			        <span class="close" onclick="closeAddBlogModal()">&times;</span>
			        <!-- Inclure ici le code du formulaire pour ajouter un blog -->
			        <form id="addBlogForm" action="/paincare/BlogServlet?action=add&id=${userId}" method="post" enctype="multipart/form-data">
					<div class="form-group">
			            
			            <label for="titre">Titre :</label>
			            <input type="text" id="titre" name="titre" required><br>
			          </div>
					   <div class="form-group">
			            <label for="description">Description :</label>
			            <textarea id="description" name="description" required></textarea><br>
			           </div>
						<div class="form-group">
			
			            <label for="image_url">URL de l'image :</label>
			            <input type="file" id="image_url" name="image_url" required><br>
							</div>
							<div class="form-group form-button">
								<input type="submit"
									class="form-submit" value="Ajouter" />
							</div>
			        </form>
			    </div>
			</div>


<c:if test="${not empty blogs}">
    <div class="row">

    <c:forEach var="blog" items="${blogs}">
	    <div class="column">
	    <c:set var="imagePath" value="${blog.image_url}" />
	        <div class="blog-card">
	        <img class="card-img-top" src="${pageContext.request.contextPath}${imagePath}" alt="Card image cap"  onclick="showBlogDetails('${blog.id}','${blog.image_url}', '${blog.titre}', '${blog.description}', '${blog.creation}')">
	            <img src="${blog.image_url}"  onclick="showBlogDetails('${blog.id}','${blog.image_url}', '${blog.titre}', '${blog.description}', '${blog.creation}')">
	    
	            <h3>${blog.titre}</h3>
	            <p>${blog.description}</p>
	            <span class="date">${blog.getCreation()}</span>
	            <a href="#" onclick="showBlogDetails('${blog.id}','${blog.image_url}', '${blog.titre}', '${blog.description}', '${blog.creation}')">Afficher les commentaires</a>
	            
	            <!-- Ajoutez d'autres propriétés du blog à afficher -->
	        </div>
	        <div id="blogDetailsModal${blog.id}" class="modal">
			    <div class="modal-content">
			        <span class="close" onclick="closeBlogDetailsModal('${blog.id}')">&times;</span>
			        <img id="modalImage${blog.id}" alt="">
			        <div class="modal-content-details">
			             <h3 id="modalTitle${blog.id}"></h3>
				          <p id="modalDescription${blog.id}"></p>
				          <p id="modalDate${blog.id}"></p>
			            <!-- Ajoutez d'autres détails du blog ici -->
			           
		                    <h4>Commentaires :</h4>
		                    <ul>
		                        <c:forEach var="comment" items="${commentsByBlogId[blog.id]}">
                                <li>${comment.comment}</li>
                            </c:forEach>
		                    </ul>
		                
						<form action="/paincare/BlogServlet?action=addComment&blogId=${blog.id}" method="post">
						       
						        <textarea name="commentContent" placeholder="Ajouter un commentaire"></textarea>
						        <button type="submit">Ajouter un commentaire</button>
						 </form>			            
						    <a href="/paincare/BlogServlet?action=delete&blogId=${blog.id}">Supprimer</a>
			            
			            <button onclick="copyBlogLink('${blog.titre}', '${blog.description}')">Partager</button>
			        </div>
			    </div>
			</div>
		</div>	
    </c:forEach>
</div>
</c:if>
</body>
</html>