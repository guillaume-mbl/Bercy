package com.Bercy.bdd;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.Bercy.Beans.Concert;
import com.Bercy.Beans.Etat;

public class ConnexionBDD {
	 	
	private Connection maConnexion;
	    private String user;
	    private String password;
	    private String dbUrl;
	    private String cheminFichierProperties;

	    public ConnexionBDD() throws IOException, SQLException {
	    this.cheminFichierProperties = "C:\\Users\\tarik\\eclipse-workspace\\Bercy\\src\\SQL\\db.properties";
	    }

	    public void seConnecter() throws SQLException, IOException {
	        Properties props = new Properties();
	        props.load(new FileInputStream(cheminFichierProperties));
	        
	        user = props.getProperty("user");
	        password = props.getProperty("password");
	        dbUrl = props.getProperty("dburl");
	        
	        maConnexion = DriverManager.getConnection(dbUrl, user, password);
	    
	    }

	    public Connection getMaConnexion() {
	        return maConnexion;
	    }
	    
	    public List<Concert> recupConcerts() throws SQLException{
	    	String query = "Select concert.*, etat.id, etat.intitule from concert inner join etat on concert.etat_id = etat.id order by dateheure asc";
	    	
	    	ResultSet rs = maConnexion.createStatement().executeQuery(query);
	    	
	    	List<Concert> liste = new ArrayList<Concert>();
	    	
	    	String jour, mois, annee, heure, minutes;
	    	
	    	
	    	while(rs.next()) {
	    		Concert c = new Concert();
	    		Etat e = new Etat();
	    		
	    		c.setCheminImage(rs.getString("image"));
	    		c.setId(rs.getInt("id"));
	    		c.setIntitule(rs.getString("intitule"));
	    		c.setDescription(rs.getString("description"));
	    		
	    		System.out.println(rs.getString("dateheure"));
	    		annee = rs.getString("dateheure").substring(0,4);
	    		mois = rs.getString("dateheure").substring(5,7);
	    		jour = rs.getString("dateheure").substring(8,10);
	    		heure = rs.getString("dateheure").substring(11,13);
	    		minutes = rs.getString("dateheure").substring(14,16);
	    		
	    		c.setDate(jour + "/" + mois + "/" + annee); 		
	    		c.setHeure(heure + ":" + minutes);
	    		
	    		e.setId(rs.getInt("etat.id"));
	    		e.setIntitule(rs.getString("etat.intitule"));
	    		
	    		c.setEtat(e);
	    		
	    		liste.add(c);	    			    		
	    	}    	
	    	
	    	return liste;
	    	
	    }

		public Concert recupConcert(int idConcert) throws SQLException {
			// TODO Auto-generated method stub
			String query = "Select * from Concert inner join etat on concert.etat_id = etat.id where concert.id = "+ idConcert;
			
			ResultSet rs = maConnexion.createStatement().executeQuery(query);
	    	
			while(rs.next()) {
				Concert c = new Concert();
	    		Etat e = new Etat();
	    		
	    		c.setCheminImage(rs.getString("image"));
	    		c.setId(rs.getInt("id"));
	    		c.setIntitule(rs.getString("intitule"));
	    		c.setDescription(rs.getString("description"));
	    		c.setDate(rs.getString("dateheure"));
	    		
	    		e.setId(rs.getInt("etat.id"));
	    		e.setIntitule(rs.getString("etat.intitule"));
	    		
	    		c.setEtat(e);
	    		
	    		return c;				
			}
	    	
			
			
			return null;
		}
	    
	    
	    
}
