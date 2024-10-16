<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Map" %>

<%@ page import="DAO.BlogDAO" %>
<%@ page import="DAO.UsersDAO" %>

<%@ page import="entities.blog" %>
<%@ page import="entities.Commentaire" %>
<%@ page import="entities.User" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>BLogs</title>
</head>
<body>

<% User user =(User) session.getAttribute("User");
UsersDAO userDAO = (UsersDAO) session.getAttribute("userDAO");
System.out.println(userDAO);%>
<h2>Blog List</h2><button class="button-9" onclick="openAddBlogModal()">Add Blog</button>
			<div id="addBlogModal" class="modal">
			    <div class="modal-content">
			        <span class="close" onclick="closeAddBlogModal()">&times;</span>
			        <!-- Inclure ici le code du formulaire pour ajouter un blog -->
			        <form id="addBlogForm" action="/paincare/BlogServlet?action=add&id=${userId}" method="post" enctype="multipart/form-data">
			            <!-- Vos champs du formulaire -->
			            <label for="titre">Title :</label>
			            <input type="text" id="titre" name="titre" required><br>
			
			            <label for="description">Description :</label>
			            <textarea id="description" name="description"required></textarea><br>
			
			            <label for="image_url">image URL :</label>
			            <input type="file" id="image_url" name="image_url" required><br>
			
			            <input type="submit" value="Ajouter" class="button-9">
			        </form>
			    </div>
			</div>
						

<c:if test="${not empty blogs}">
    <div class="row">
    <div class="post">
    <c:forEach var="blog" items="${blogs}">
	
	    <c:set var="imagePath" value="${blog.image_url}" />
	    <div class="post-box ">
            <img src="${pageContext.request.contextPath}${imagePath}" onclick="showBlogDetails('${blog.id}','${pageContext.request.contextPath}${imagePath}', '${blog.titre}', '${blog.description}', '${blog.creation}')" class="post-img">
            
            <a href="#" class="post-title">${blog.titre}</a>
            <span class="post-date">${blog.getCreation()}</span>
            <p class="post-description">${blog.description}</p>
            <c:set var="id" value="${blog.userId}" />
         <%
			    User user1 =(User) userDAO.getByid((int)pageContext.getAttribute("id"));
         String prof = (String) user1.getImage_url();
         pageContext.setAttribute("prof", prof);
         pageContext.setAttribute("userName", user1.getName());
			%>
			<div class="profile">
			<c:set var="profi" value="${user1.image_url}" />
			    <img src="${pageContext.request.contextPath}${prof}" alt="" class="profile-img">
			    <span class="profile-name">${userName}</span>
			</div>
			<a href="#" onclick="showBlogDetails('${blog.id}','${pageContext.request.contextPath}${imagePath}', '${blog.titre}', '${blog.description}', '${blog.creation}')">comments</a>
			
        </div>
	        
	        <div id="blogDetailsModal${blog.id}" class="modal">
			    <div class="modal-content">
			        <span class="close" onclick="closeBlogDetailsModal('${blog.id}')">&times;</span>
			        <img id="modalImage${blog.id}" alt="" src="${pageContext.request.contextPath}${imagePath}">
			        <div class="modal-content-details">
			             <h3 id="modalTitle${blog.id}"></h3>
				          <p id="modalDescription${blog.id}"></p>
				          <p id="modalDate${blog.id}"></p>
			            <!-- Ajoutez d'autres détails du blog ici -->
			           
		                    <h4>Comments :</h4>
		                    <ul>
		                        <c:forEach var="comment" items="${commentsByBlogId[blog.id]}">
                                <li>${comment.comment}</li>
                            </c:forEach>
		                    </ul>
		                
						<form action="/paincare/BlogServlet?action=addComment&blogId=${blog.id}" method="post">
						       
						        <textarea name="commentContent" placeholder="Ajouter un commentaire"></textarea>
						        <button class="button-9" type="submit">Add comment</button>
						 </form>			            
						    <a href="/paincare/BlogServlet?action=delete&blogId=${blog.id}" class="button-9">Delete</a>
			            
			            <button onclick="copyBlogLink('${blog.titre}', '${blog.description}')" class="button-9" >Share</button>
			        </div>
			    </div>
			</div>
		
    </c:forEach>
    </div>
</div>
</c:if>
    <script>
    function showBlogDetails(id,image, title, description, date) {
    	
    	var modalId = 'blogDetailsModal' + id;
    	var imgId = 'modalImage' + id;
    	var titleId = 'modalTitle' + id;
        var descriptionId = 'modalDescription' + id;
        var dateId = 'modalDate' + id;

        document.getElementById(imgId).src = image;
        document.getElementById(titleId).innerText = title;
        document.getElementById(descriptionId).innerText = description;
        document.getElementById(dateId).innerText = date;
        document.getElementById(modalId).style.display = 'block';
        }

    function closeBlogDetailsModal(id) {
        var modalId = 'blogDetailsModal' + id;
        document.getElementById(modalId).style.display = 'none';
    }
    function openAddBlogModal() {
        document.getElementById('addBlogModal').style.display = 'block';
    }

    function closeAddBlogModal() {
        document.getElementById('addBlogModal').style.display = 'none';
    }
    function shareBlog(blogId) {
        // Vous pouvez implémenter ici la logique de partage, par exemple, ouvrir une fenêtre de partage
        // Vous pouvez également utiliser des bibliothèques ou des API de partage social

        // Exemple simple d'ouverture d'une fenêtre pop-up avec le lien de partage
        var blogUrl = "https://votre-site.com/blog/" + blogId; // Remplacez cela par l'URL réelle du blog
        var shareUrl = "https://www.facebook.com/sharer/sharer.php?u=" + encodeURIComponent(blogUrl);

        window.open(shareUrl, "_blank", "width=600,height=400");
    }
    function copyBlogLink(blogTitle, blogDescription) {
        // Créez le lien de partage avec le titre et la description
        var blogLink = "https://votre-site.com/blog?title=" + encodeURIComponent(blogTitle) + "&description=" + encodeURIComponent(blogDescription);

        // Copiez le lien dans le presse-papiers
        navigator.clipboard.writeText(blogLink)
            .then(function() {
                // Affichez le message "lien copié"
                alert("Lien copié : " + blogLink);
            })
            .catch(function(err) {
                console.error('Unable to copy text to clipboard.', err);
            });
    }
    function showComments(blogId) {
        var commentsSection = document.getElementById('commentsSection' + blogId);

        // Affichez ou masquez la section des commentaires
        commentsSection.style.display = (commentsSection.style.display === 'none') ? 'block' : 'none';
        if (commentsSection.style.display === 'block') {
            // Utilisez jQuery pour simplifier la requête AJAX
            $.ajax({
                url: '/paincare/BlogServlet',  // L'URL de votre servlet
                type: 'GET',
                data: {
                    action: 'getComments',
                    blogId: blogId
                },
                success: function (data) {
                    // Mettez à jour la section des commentaires avec les données reçues
                    $('#commentsSection' + blogId).html(data);
                },
                error: function (error) {
                    console.error('Erreur lors de la récupération des commentaires', error);
                }
            });
        }
    }
</script>
</body>
</html>