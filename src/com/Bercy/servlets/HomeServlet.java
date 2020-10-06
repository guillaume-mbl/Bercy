package com.Bercy.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Bercy.Beans.Concert;
import com.Bercy.bdd.ConnexionBDD;

import jdk.nashorn.internal.ir.ForNode;

public class HomeServlet extends HttpServlet{

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
			
			listeConcerts = conn.recupConcerts();
			
			
			req.setAttribute("listeConcerts", listeConcerts);
			
			
		} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		this.getServletContext().getRequestDispatcher( "/WEB-INF/index.jsp" ).forward( req, res );	

	}
	

	 public void doPost( HttpServletRequest request, HttpServletResponse response ) throws IOException, ServletException {
		 try {
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				if(request.getParameter("idConcert") != null) {
					
				
				ConnexionBDD conn = new ConnexionBDD();
				conn.seConnecter();
				
				listeConcerts = conn.recupConcerts();
				
				
				request.setAttribute("listeConcerts", listeConcerts);
				request.setAttribute("concertChoisi",conn.recupConcert(Integer.parseInt(request.getParameter("idConcert"))));
			
				}
				
				
				this.getServletContext().getRequestDispatcher( "/WEB-INF/index.jsp" ).forward( request, response );	
				
		 	} catch (IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		 
	 }

}
