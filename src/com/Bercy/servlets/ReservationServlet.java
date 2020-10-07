package com.Bercy.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Bercy.Beans.Concert;
import com.Bercy.Beans.Reservation;
import com.Bercy.Beans.Tarif;
import com.Bercy.bdd.ConnexionBDD;

import jdk.nashorn.internal.ir.ForNode;

public class ReservationServlet extends HttpServlet{

	List<Concert> listeConcerts;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		      throws ServletException, IOException {
		

		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ConnexionBDD conn = new ConnexionBDD();
			conn.seConnecter();
			
			
			req.setAttribute("Concert", conn.recupConcert(Integer.parseInt(req.getParameter("id"))));
			req.setAttribute("Tarifs", conn.recupTarifs(Integer.parseInt(req.getParameter("id"))));
			
			
			
			
		} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		this.getServletContext().getRequestDispatcher( "/WEB-INF/reserver.jsp" ).forward( req, res );	

	}
	

	 public void doPost( HttpServletRequest request, HttpServletResponse response ) throws IOException, ServletException {
		 

		System.out.println(request.getParameter("idConcert"));
		 
		 if(request.getParameter("idConcert")!=null) {

			try {
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				ConnexionBDD conn = new ConnexionBDD();
				conn.seConnecter();
				
				boolean aChoisiPlace = false;
				
				Concert c = conn.recupConcert(Integer.parseInt(request.getParameter("idConcert")));
				List<Tarif> listeTarifs = conn.recupTarifs(Integer.parseInt(request.getParameter("idConcert")));
				
				float prixTotal = 0;
				
				System.out.println(prixTotal);
				
				for(Tarif t : listeTarifs) {
					if(t.getRestant()>0) {
						if(Integer.parseInt(request.getParameter(c.getId()+"_"+t.getCat().getIntitule()))>0) {
							aChoisiPlace = true;
							break;
						}
					}
				}
				
				if( aChoisiPlace == true) {
					String numResa = conn.ajouterReservation(request.getParameter("nom"),request.getParameter("prenom"),request.getParameter("email"),Integer.parseInt(request.getParameter("idConcert")));
					
					Reservation r = conn.recupReservation(numResa);
					
					
					for(Tarif t : listeTarifs) {
						if(t.getRestant() > 0) {
							prixTotal += Integer.parseInt(request.getParameter(c.getId()+"_"+t.getCat().getIntitule())) * conn.getPrix(c.getId(), t.getCat().getIntitule());
							
							for(int i = 0; i<Integer.parseInt(request.getParameter(c.getId()+"_"+t.getCat().getIntitule()));i++) {
								conn.ajoutePlace(r.getId(),r.getConcert().getId(), t.getCat().getIdCategorie());
							}
						}
						
					}
					
					request.setAttribute("places", conn.recupPlaces(r));				
					request.setAttribute("reservation", r);	
					request.setAttribute("tarifs", listeTarifs);
					
					this.getServletContext().getRequestDispatcher( "/WEB-INF/recap.jsp" ).forward( request, response );	
				}
				
			} catch (IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			 
			 
		 }


	 }

}
