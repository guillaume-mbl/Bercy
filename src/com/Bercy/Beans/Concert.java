package com.Bercy.Beans;

public class Concert {

		private int id;
		private String intitule;
		private String description;
		private String dateHeure;
		private Etat etat;
		private Salle salle;
		private String cheminImage;
		
		
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
		public String getDateHeure() {
			return dateHeure;
		}
		public void setDateHeure(String dateHeure) {
			this.dateHeure = dateHeure;
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
