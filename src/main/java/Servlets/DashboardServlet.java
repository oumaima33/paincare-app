package Servlets;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import web.Getconnexion;

import java.io.IOException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import DAO.DiagnosticDAO;
import DAO.DiagnosticDAOImpl;
import DAO.TrackDAO;
import DAO.TrackDAOImpl;
import entities.Diagnostic;
import entities.Track;
import enums.Feelings;
import enums.PainWorse;
import enums.Painlocation;
import enums.SymptomType;

/**
 * Servlet implementation class DashboardServlete
 */
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
Connection conn = null;
		

	    try {
	    	conn =Getconnexion.getConnection();
	    	TrackDAO trackDAO = new TrackDAOImpl(conn);
			List<Track> tracks = trackDAO.getAll();
			System.out.println(tracks);
			request.setAttribute("tracks", tracks);
			 String action = request.getParameter("action");
			  conn = Getconnexion.getConnection(); 
	            int userId = Integer.parseInt(request.getParameter("userId"));
	            for (Track track : tracks) {
	                System.out.println("Retrieved Date: " + track.getDate());}
	            DiagnosticDAO diagnosticDAO = new DiagnosticDAOImpl(conn);
	            Diagnostic lastDiagnostic = diagnosticDAO.getLastDiagnosticForUser(userId);

	            request.setAttribute("lastDiagnostic", lastDiagnostic);
	            request.getRequestDispatcher("base.jsp").forward(request, response);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
