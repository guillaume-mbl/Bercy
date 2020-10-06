package com.Bercy.Beans;

public class Concert {

		private int id;
		private String intitule;
		private String description;
		private String date;
		private String heure;
		private Etat etat;
		private Salle salle;
		private String cheminImage;
		private String urlAlbum;
		
		
		public String getUrlAlbum() {
			return urlAlbum;
		}
		public void setUrlAlbum(String urlAlbum) {
			this.urlAlbum = urlAlbum;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getIntitule() {
			return intitule;
		}
		public void setIntitule(String intitule) {
			this.intitule = intitule;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getHeure() {
			return heure;
		}
		public void setHeure(String heure) {
			this.heure = heure;
		}
		public Etat getEtat() {
			return etat;
		}
		public void setEtat(Etat etat) {
			this.etat = etat;
		}
		public Salle getSalle() {
			return salle;
		}
		public void setSalle(Salle salle) {
			this.salle = salle;
		}
		public String getCheminImage() {
			return cheminImage;
		}
		public void setCheminImage(String cheminImage) {
			this.cheminImage = cheminImage;
		}
		
		
		
}
