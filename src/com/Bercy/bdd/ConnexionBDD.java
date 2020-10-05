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
	    this.cheminFichierProperties = "C:\\Users\\tarik\\git\\Bercy\\src\\SQL\\db.properties";
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
	    	String query = "Select concert.*, etat.id, etat.intitule from concert inner join etat on concert.etat_id = etat.id order by dataheure desc";
	    	
	    	ResultSet rs = maConnexion.createStatement().executeQuery(query);
	    	
	    	List<Concert> liste = new ArrayList<Concert>();
	    	
	    	while(rs.next()) {
	    		Concert c = new Concert();
	    		Etat e = new Etat();
	    		
	    		c.setCheminImage(rs.getString("image"));
	    		c.setId(rs.getInt("id"));
	    		c.setIntitule(rs.getString("intitule"));
	    		c.setDescription(rs.getString("description"));
	    		c.setDateHeure(rs.getString("dateheure"));
	    		
	    		e.setId(rs.getInt("etat.id"));
	    		e.setIntitule(rs.getString("etat.intitule"));
	    		
	    		c.setEtat(e);
	    		
	    		liste.add(c);	    			    		
	    	}    	
	    	
	    	return liste;
	    	
	    }
	    
	    
}
