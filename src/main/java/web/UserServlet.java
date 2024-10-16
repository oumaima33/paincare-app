package web;

import jakarta.servlet.ServletException;



import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import entities.User;
import DAO.UsersDAO;
import DAO.UsersDAOImpl;



/**
 * Servlet implementation class UserServlet
 */
@MultipartConfig
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Connection conn =null ;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		try {
			conn =Getconnexion.getConnection();
			UsersDAO usersDAO = new UsersDAOImpl(conn);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		UsersDAO usersDAO = new UsersDAOImpl(conn);
        if (action == null) {
            // Si aucune action spécifique n'est spécifiée, afficher la liste des utilisateurs
            List<User> users = usersDAO.getAll();
            request.setAttribute("users", users);
            request.getRequestDispatcher("users.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            // Afficher le formulaire d'édition pour un utilisateur spécifié par l'ID
            int userId = Integer.parseInt(request.getParameter("userid"));
            User user = usersDAO.getByid(userId);
            request.setAttribute("user", user);
            request.getRequestDispatcher("/Registration/editUser.jsp").forward(request, response);
        }else if (action.equals("delete")) {
            // Supprimer un utilisateur spécifié par l'ID
            int userId = Integer.parseInt(request.getParameter("userid"));
            UsersDAO userDAO = new UsersDAOImpl(conn);
            userDAO.delete(userId);
            response.sendRedirect("Registration/registration.jsp");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
        if (action.equals("update")) {
            // Mettez à jour les informations de l'utilisateur
        	int userId = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            Part filePart = request.getPart("image");  // Assurez-vous que votre champ d'upload s'appelle "image" dans le formulaire
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

            try {
				conn =Getconnexion.getConnection();
				UsersDAO userDAO = new UsersDAOImpl(conn);
	            User user= new User(userId,email , password,username,image);
	            

	            userDAO.update(user);
	            session.setAttribute("userId", userId);
	            response.sendRedirect("/paincare/DashboardServlet?userId="+userId);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
        } 
	}

}
