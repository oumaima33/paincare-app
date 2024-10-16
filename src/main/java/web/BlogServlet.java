package web;

import jakarta.servlet.RequestDispatcher;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import DAO.UsersDAO;
import DAO.UsersDAOImpl;
import DAO.BlogDAO;
import DAO.BlogDAOImpl;
import entities.Commentaire;
import entities.blog;
import java.sql.Connection;



import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import web.Getconnexion;/**
 * Servlet implementation class BlogServlet
 */
@MultipartConfig
public class BlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    Connection conn =null ;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
       // System.out.println(action);

        if (action == null) {
        	response.sendRedirect("base.jsp");
        }else
        if ( action.equals("liste")) {
            listBlogs(request, response);
        } else if ("ajouter".equals(action)) {
            ajouterBlog(request, response);
        } else if ("delete".equals(action)) {
            supprimerBlog(request, response);
        } 
        else if ("search".equals(action)) {
            response.sendRedirect("base.jsp?action=search");
        } else if ("getComments".equals(action)) {
            int blogId = Integer.parseInt(request.getParameter("blogId"));
            try {
				conn =Getconnexion.getConnection();
				BlogDAO blogDAO = new BlogDAOImpl(conn);
	            List<Commentaire> comments = blogDAO.getCommentsByBlogId(blogId);
System.out.println(comments);
	            request.setAttribute("comments", comments);
	            RequestDispatcher dispatcher = request.getRequestDispatcher("/BlogServlet?action=liste");
	            dispatcher.forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
        }
    }

    private void listBlogs(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        // Logique pour récupérer la liste des blogs depuis la base de données
        // Utilisez votre DAO ici
    	try {
			conn =Getconnexion.getConnection();
			BlogDAO blogDAO = new BlogDAOImpl(conn); // Remplacez BlogDAO par votre classe réelle
			UsersDAO userDAO = new UsersDAOImpl(conn);
	        List<blog> blogs = blogDAO.getAll(); // Remplacez getAll par la méthode appropriée
	        Map<Integer, List<Commentaire>> commentsByBlogId = new HashMap();
	        for (blog blog : blogs) {
	            List<Commentaire> comments = blogDAO.getCommentsByBlogId(blog.getId());
	            commentsByBlogId.put(blog.getId(), comments);
	        }
	        // Ajouter la liste des blogs à l'objet de requête
	        request.setAttribute("blogs", blogs);
	        request.setAttribute("commentsByBlogId", commentsByBlogId);
	        request.getSession().setAttribute("blogs", blogs);
	        request.getSession().setAttribute("userDAO", userDAO);

	        request.getSession().setAttribute("commentsByBlogId", commentsByBlogId);

            response.sendRedirect("base.jsp?action=liste");

	        // Dispatcher vers la page JSP pour afficher la liste des blogs
//	        request.getRequestDispatcher("User/base.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
        
    }

    private void ajouterBlog(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	try {
			conn =Getconnexion.getConnection();
			 // Logique pour ajouter un blog à la base de données
	        // Utilisez votre DAO ici
	        BlogDAO blogDAO = new BlogDAOImpl(conn); // Remplacez BlogDAO par votre classe réelle
	        blog nouveauBlog = new blog(); // Créez un nouvel objet Blog avec les données du formulaire
	        blogDAO.insert(nouveauBlog); // Remplacez insert par la méthode appropriée

	        // Rediriger vers la page de liste après l'ajout
	        response.sendRedirect(request.getContextPath() + "/BlogServlet?action=liste");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

        // Logique pour ajouter un blog à la base de données
        // Utilisez votre DAO ici
        BlogDAO blogDAO = new BlogDAOImpl(conn); // Remplacez BlogDAO par votre classe réelle
        blog nouveauBlog = new blog(); // Créez un nouvel objet Blog avec les données du formulaire
        blogDAO.insert(nouveauBlog); // Remplacez insert par la méthode appropriée

        // Rediriger vers la page de liste après l'ajout
        response.sendRedirect(request.getContextPath() + "/BlogServlet?action=liste");
    }

    private void supprimerBlog(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	try {
			conn =Getconnexion.getConnection();
			 // Logique pour supprimer un blog de la base de données
	        // Utilisez votre DAO ici
	        BlogDAO blogDAO = new BlogDAOImpl(conn); // Remplacez BlogDAO par votre classe réelle
	        int blogId = Integer.parseInt(request.getParameter("blogId")); // Obtenez l'ID du blog à supprimer
	        blogDAO.delete(blogId); // Remplacez delete par la méthode appropriée

	        // Rediriger vers la page de liste après la suppression
	        response.sendRedirect(request.getContextPath() + "/BlogServlet?action=liste");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
        //System.out.println(action);

		if ("addComment".equals(action)) {
            AddComment(request, response);
            //System.out.println("hello/");
        }
		else if("add".equals(action)) {
			try {
		
			conn =Getconnexion.getConnection();
			BlogDAO blogDAO = new BlogDAOImpl(conn);
	        int userId = Integer.parseInt(request.getParameter("id"));
			String titre = request.getParameter("titre");
	        String description = request.getParameter("description");
	       // String image_url = request.getParameter("image_url");
	        Part filePart = request.getPart("image_url");  // Assurez-vous que votre champ d'upload s'appelle "image" dans le formulaire
            System.out.println(filePart) ;
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String basePath = getServletContext().getRealPath("/");
            String imagePath = "C:/Users/pc/eclipse-workspace/paincare/WebContent/Registration/images" + File.separator + fileName;
            System.out.println("dcs"+imagePath);
            // Stocker l'image sur le serveur
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, Paths.get(imagePath), StandardCopyOption.REPLACE_EXISTING);
            }

            // Création d'un nouvel objet Event avec le chemin de l'image
            String image="/Registration/images/"+ fileName;
	        Date creation = new Date(System.currentTimeMillis()); // Assurez-vous que vous utilisez la classe java.util.Date

	        // Vous devrez probablement obtenir userId à partir de la session ou d'une autre manière, selon votre logique d'authentification
	  // Obtenez votre userId ici ;

	        // Par défaut, le nombre de publications est 0
	        int nbr_pub = 0;
	        blog newBlog = new blog(image,titre, description,creation,userId,nbr_pub );
	        blogDAO.insert(newBlog);
	        response.sendRedirect("/paincare/BlogServlet?action=liste");


		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 // Logique pour supprimer un blog de la base de données
       // Utilisez votre DAO ici
	}else if (action.equals("search")) {
		try {
			conn =Getconnexion.getConnection();
			BlogDAO blogDAO = new BlogDAOImpl(conn);
        String searchQuery = request.getParameter("searchQuery");
        // Effectuer la recherche en utilisant searchQuery
        List<blog> searchResults = blogDAO.searchByTitle(searchQuery);
        int userId = Integer.parseInt(request.getParameter("id"));
        // Mettre les résultats dans la session pour les afficher dans la page
        request.getSession().setAttribute("searchResults", searchResults);
        request.getSession().setAttribute("userId", userId);

System.out.println(searchResults);

        // Rediriger vers une page de résultats de recherche
        response.sendRedirect("/paincare/BlogServlet?action=search");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
    } 
		}
	private void AddComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérez les données du formulaire
        int blogId = Integer.parseInt(request.getParameter("blogId"));
        String commentContent = request.getParameter("commentContent");
        try {
			conn =Getconnexion.getConnection();
			BlogDAO blogDAO = new BlogDAOImpl(conn);
	        // Ajoutez le commentaire à la base de données (utilisez votre DAO)
	       
	        blogDAO.addComment(blogId, commentContent);

	        // Redirigez vers la page du blog ou effectuez d'autres actions nécessaires
	        response.sendRedirect("/paincare/BlogServlet?action=liste");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
    }
}
