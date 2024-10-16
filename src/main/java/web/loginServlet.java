package web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import entities.User;
import DAO.UsersDAO;
import DAO.UsersDAOImpl;
/**
 * Servlet implementation class loginServlet
 */
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if ("logout".equals(action)) {
	        // Logique de déconnexion
	        HttpSession session = request.getSession();
	        session.invalidate();
	        response.sendRedirect("Registration/login.jsp");
	    }
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail = request.getParameter("username");
		String upwd = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		Connection conn = null; 
		try {
			conn = Getconnexion.getConnection(); 
			PreparedStatement pst = conn.prepareStatement("select * from user where uemail=? and upwd=?");			
			pst.setString(1,uemail);
			pst.setString(2,upwd);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				int userId = rs.getInt("uid"); // Récupérer l'ID de l'utilisateur
		        session.setAttribute("userId", userId);
				session.setAttribute("name",rs.getString("uname"));
				 try {
						conn =Getconnexion.getConnection();
						UsersDAO userDAO = new UsersDAOImpl(conn);
			             User user = userDAO.getByid(userId); // Implement this method to get the user by ID

			        // Assuming User class has a method to get the image URL
			        String imageUrl = user.getImage_url();
					System.out.println(imageUrl);
			        session.setAttribute("imageUrl", imageUrl);

			        session.setAttribute("User", user);

			       
					} catch (ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
//				System.out.println("hello");
				//dispatcher = request.getRequestDispatcher("/BlogServlet?action=liste");
				response.sendRedirect("/paincare/DashboardServlet?userId="+ userId);
				
			}else {
				request.setAttribute("status","failed");
				dispatcher = request.getRequestDispatcher("Registration/login.jsp");
			
			}
			//dispatcher.forward(request, response);
		 } catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
				conn.close();}
				catch (SQLException e){e.printStackTrace();
					
				}
			}
	}

}
