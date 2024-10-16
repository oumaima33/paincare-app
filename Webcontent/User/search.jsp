<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entities.blog" %>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body><% HttpSession d = request.getSession();
    List<blog> searchResults = (List<blog>) d.getAttribute("searchResults");%>

<c:forEach var="blog" items="${searchResults}">
   	    <c:set var="imagePath" value="${blog.image_url}" />
   
     <div class="column">
	        <div class="blog-card">
	        	<img class="card-img-top" src="${pageContext.request.contextPath}${imagePath}" alt="Card image cap"  onclick="showBlogDetails('${blog.id}','${blog.image_url}', '${blog.titre}', '${blog.description}', '${blog.creation}')">	    
	        
	    
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

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="script.js"></script>
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