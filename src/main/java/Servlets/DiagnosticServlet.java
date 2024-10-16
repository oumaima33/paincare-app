package Servlets;

import jakarta.servlet.RequestDispatcher;

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
import java.util.ArrayList;
import java.util.List;

import DAO.DiagnosticDAO;
import DAO.DiagnosticDAOImpl;

import entities.Diagnostic;
/**
 * Servlet implementation class DiagnosticServlet
 */
public class DiagnosticServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiagnosticServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Connection conn = null;

		    try {
		        conn = Getconnexion.getConnection(); 
	            int userId = Integer.parseInt(request.getParameter("userId"));

	            DiagnosticDAO diagnosticDAO = new DiagnosticDAOImpl(conn);
	            Diagnostic lastDiagnostic = diagnosticDAO.getLastDiagnosticForUser(userId);

	            request.setAttribute("lastDiagnostic", lastDiagnostic);

	            RequestDispatcher dispatcher = request.getRequestDispatcher("base.jsp?action=Diagnostic");
	            dispatcher.forward(request, response);
//	            response.sendRedirect("User/base.jsp?action=Diagnostic");


	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle the exception as needed
	        } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;

	    try {
	    	conn =Getconnexion.getConnection();
	        DiagnosticDAO diagnosticDAO = new DiagnosticDAOImpl(conn);
	        Diagnostic diagnostic = new Diagnostic();

	        // Récupérer les réponses depuis le formulaire
	        List<String> responses = new ArrayList<>();

	        for (int i = 1; i <= diagnostic.getStaticQuestions().size(); i++) {
	            String answer = request.getParameter("question" + i);
	            responses.add(answer);
	        }

	        diagnostic.setUser_id(Integer.parseInt(request.getParameter("userId")));
	        diagnostic.setResponses(responses);
	        String riskLevel = diagnostic.evaluateRiskLevel();
	        Integer sum = diagnostic.calculateSum();
            diagnostic.setRiskLevel(riskLevel);
	      System.out.print(sum);
	      System.out.print(riskLevel);
	        diagnosticDAO.saveDiagnostic(diagnostic);
	     
	        request.setAttribute("diagnostic", diagnostic);
            RequestDispatcher dispatcher = request.getRequestDispatcher("base.jsp?action=diaresult");
            dispatcher.forward(request, response);
//            response.sendRedirect("User/base.jsp?action=diaresult");

	    } catch (ClassNotFoundException | SQLException e) {
	        // Gérer les exceptions
	        e.printStackTrace();
	    }
	    }

}
