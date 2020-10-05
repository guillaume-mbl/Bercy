package com.Bercy.bdd;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

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
}