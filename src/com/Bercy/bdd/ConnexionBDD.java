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
import java.util.Random;

import com.Bercy.Beans.Categorie;
import com.Bercy.Beans.Concert;
import com.Bercy.Beans.Etat;
import com.Bercy.Beans.Place;
import com.Bercy.Beans.Reservation;
import com.Bercy.Beans.Tarif;

public class ConnexionBDD {
	 	
	private Connection maConnexion;
	    private String user;
	    private String password;
	    private String dbUrl;
	    private String cheminFichierProperties;

	    public ConnexionBDD() throws IOException, SQLException {
	    this.cheminFichierProperties = "C:\\Users\\guill\\git\\Bercy\\src\\SQL\\db.properties";
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
	    		
	    		c.setUrlAlbum(rs.getString("spotify"));
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
	    		
	    		c.setUrlAlbum(rs.getString("spotify"));
	    		
	    		e.setId(rs.getInt("etat.id"));
	    		e.setIntitule(rs.getString("etat.intitule"));
	    		
	    		c.setEtat(e);
	    		
	    		return c;				
			}
	    	
			
			
			return null;
		}
	    
		public List<Tarif> recupPrixMinis() throws SQLException{
			String query = "select round(min(prix),2) as prix, concert_id from concert_categorie group by concert_id";
			
			ResultSet rs = maConnexion.createStatement().executeQuery(query);

			List<Tarif> liste = new ArrayList<Tarif>();
			
			while(rs.next()) {
				Tarif t = new Tarif();
				t.setPrix(rs.getFloat("prix"));
								
				Concert concert = new Concert();
				concert.setId(rs.getInt("concert_id"));
				
				t.setConcert(concert);
				
				System.out.println(t.getPrix() + " " + t.getConcert().getId());
				liste.add(t);
			}
			
			
			return liste;
			
		}
		
		public List<Categorie> recupCategories() throws SQLException{
			String query = "select * from categorie";
			
			ResultSet rs = maConnexion.createStatement().executeQuery(query);

			List<Categorie> liste = new ArrayList<Categorie>();
			
			while(rs.next()) {
				
				Categorie c = new Categorie();
				c.setIdCategorie(rs.getInt("categorie.id"));
				c.setIntitule(rs.getString("categorie.intitule"));
				
				
				liste.add(c);
			}
			return liste;
			
		}
		
		public List<Tarif> recupTarifs (int idConcert) throws SQLException {
			String query = "Select * from concert_categorie inner join categorie on categorie_id = categorie.id where concert_id = "+ idConcert;

			ResultSet rs = maConnexion.createStatement().executeQuery(query);
			
			List<Tarif> liste = new ArrayList<Tarif>();
			
			while(rs.next()) {
				Tarif t = new Tarif();
				t.setPrix(rs.getFloat("prix"));
				t.setRestant(rs.getInt("restant"));
				
				Categorie c = new Categorie();
				c.setIdCategorie(rs.getInt("categorie.id"));
				c.setIntitule(rs.getString("categorie.intitule"));
				
				t.setCat(c);
				
				liste.add(t);
				
			}
			return liste;
			
		}
	    
		public float getPrix(int idConcert, String nomCat) throws SQLException {
			String query = "Select prix from concert_categorie inner join "
					+ "categorie on categorie_id = categorie.id "
					+ "where concert_id = "+ idConcert + " and categorie.intitule = '"+nomCat+"'";

			ResultSet rs = maConnexion.createStatement().executeQuery(query);
			
			
			while(rs.next()) {
				return rs.getFloat("prix");
				
			}
			
			return 0;
		}
		
		public String ajouterReservation(String prenom, String nom, String email,int idConcert) throws SQLException {
			Random rnd = new Random();
			int nb = rnd.nextInt(1500)+1000;
			
			String query = "insert into reservation (numero,dateheure,concert_id,nom,prenom,mail) "
					+ "VALUES ('"+prenom.substring(0,2)+nom.substring(0,2)+nb+"',now(),"+idConcert+",'"+nom+"','"+prenom+"','"+email+"')";
			
			maConnexion.createStatement().execute(query);
			
			return prenom.substring(0,2)+nom.substring(0,2)+nb;
			
		}
		
		public Reservation recupReservation(String numReservation) throws SQLException {
			String query = "Select * from reservation where numero = '"+numReservation+"'";
			
			ResultSet rs = maConnexion.createStatement().executeQuery(query);
			
			Reservation r = new Reservation();
			
			while(rs.next()) {
				Concert c = new Concert();
				c.setId(rs.getInt("concert_id"));
				r.setConcert(c);
				
				r.setDate_heure(rs.getString("dateheure"));
				
				r.setId(rs.getInt("id"));
				
				r.setNumero(rs.getString("numero"));
				r.setNom(rs.getString("nom"));
				r.setPrenom(rs.getString("prenom"));
				r.setEmail(rs.getString("mail"));
				
				return r;			
			}
			
			return null;
			
		}
		public int recupPlaceMax(int idConcert, int idCategorie) throws SQLException {
			String query = "SELECT MAX(place.numero) as numPlace from place "
					+ "inner join reservation on reservation_id = reservation.id "
					+ "inner join concert on reservation.concert_id = concert.id"
					+ " where concert.id = "+idConcert+" AND categorie_id = "+idCategorie+" group by concert.id, categorie_id";
			
			ResultSet rs = maConnexion.createStatement().executeQuery(query);
			
			while(rs.next()) {
				
				return rs.getInt("numPlace");
			}
			
			return 0;
		}
		
		public void ajoutePlace(int idResa, int idConcert, int idCategorie) throws SQLException {
			
			int numPlace = recupPlaceMax(idConcert, idCategorie) +1;
			
			String query = "INSERT INTO place (numero,dateheure,reservation_id,categorie_id) VALUES ("+numPlace+",now(),"+idResa+","+idCategorie+")";
			
			maConnexion.createStatement().execute(query);
					
			query = "UPDATE concert_categorie set restant = restant-1 where categorie_id = "+idCategorie+" and concert_id = "+idConcert;
		
			maConnexion.createStatement().executeUpdate(query);
		}
		
		public List<Place> recupPlaces(Reservation r) throws SQLException{
			String query = "Select COUNT(*) as nbPlaces, place.categorie_id, prix, categorie.intitule from place "
					+ "inner join reservation on reservation_id = reservation.id "
					+ "inner join concert_categorie on concert_categorie.concert_id = reservation.concert_id "
					+ "and concert_categorie.categorie_id = place.categorie_id "
					+ "inner join categorie on categorie.id = place.categorie_id "
					+ "where reservation_id = '"+r.getId()+"'"
					+ " group by categorie_id";
			
			ResultSet rs = maConnexion.createStatement().executeQuery(query);
			
			List<Place> listePlaces = new ArrayList<Place>();
			
			while(rs.next()) {
				Place p = new Place();
				p.setResa(r);
				p.setNbPlace(rs.getInt("nbPlaces"));
				
				Categorie c = new Categorie();
				c.setIntitule(rs.getString("categorie.intitule"));
				c.setIdCategorie(rs.getInt("place.categorie_id"));
				
				Tarif t = new Tarif();
				t.setPrix(rs.getFloat("prix"));
				t.setCat(c);
				
				p.setTarif(t);
				
				listePlaces.add(p);
				
			}
			
			return listePlaces;
		}
		
		
		
	    
}
