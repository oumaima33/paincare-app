package Servlets;

import jakarta.servlet.ServletException;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import web.Getconnexion;

import java.io.IOException;
import java.sql.Connection;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;

import DAO.TrackDAO;
import DAO.TrackDAOImpl;

import entities.Track;
import enums.Feelings;
import enums.PainWorse;
import enums.Painlocation;
import enums.SymptomType;

/**
 * Servlet implementation class TrackServlet
 */
public class TrackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrackServlet() {
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
			request.setAttribute("tracks", tracks);
			System.out.println("tst"+ tracks);
			 String action = request.getParameter("action");
	
			request.setAttribute("painLocations", Painlocation.values());
		
			request.setAttribute("symptomTypes", SymptomType.values());
			request.setAttribute("painWorses", PainWorse.values());
			request.setAttribute("feelings", Feelings.values());
			 request.getRequestDispatcher("base.jsp?action=track").forward(request, response);
//	            response.sendRedirect("User/base.jsp?action=track");

			
	     // Récupérer les données de la table "track"
	      
	    
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
Connection conn = null;
		

        try {
            conn = Getconnexion.getConnection();
      
        TrackDAO trackDAO = new TrackDAOImpl(conn);
    	
      
        int painLevel = Integer.parseInt(request.getParameter("painLevel"));

        java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(System.currentTimeMillis());

        List<Painlocation> painLoc = Arrays.stream(request.getParameterValues("painLoc[]"))
                .map(Painlocation::valueOf)
                .collect(Collectors.toList());

        List<SymptomType> symptoms = Arrays.stream(request.getParameterValues("symptoms[]"))
                .map(SymptomType::valueOf)
                .collect(Collectors.toList());

        List<PainWorse> painWorse = Arrays.stream(request.getParameterValues("painWorse[]"))
                .map(PainWorse::valueOf)
                .collect(Collectors.toList());

        List<Feelings> feelings = Arrays.stream(request.getParameterValues("feelings[]"))
                .map(Feelings::valueOf)
                .collect(Collectors.toList());
        

        Track newTrack = new Track();
       
        newTrack.setPainlevel(painLevel);
        newTrack.setDate(currentTimestamp.toString());
        newTrack.setPainLoc(painLoc);
        newTrack.setSymptoms(symptoms);
        newTrack.setPainWorse(painWorse);
        newTrack.setFeelings(feelings);
        
        trackDAO.insert(newTrack);
        int userId = Integer.parseInt(request.getParameter("userId"));

        response.sendRedirect("DashboardServlet?userId="+ userId );
        } catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();}

    
}

}
