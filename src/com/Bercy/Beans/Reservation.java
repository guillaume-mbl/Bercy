package com.Bercy.Beans;

import java.util.List;

public class Reservation {
	
	private int id;
	private String numero;
	private String date_heure;
	private String nom;
	private String prenom;
	private String email;
	
	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	private Concert concert;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getDate_heure() {
		return date_heure;
	}

	public void setDate_heure(String date_heure) {
		this.date_heure = date_heure;
	}

	public Concert getConcert() {
		return concert;
	}

	public void setConcert(Concert concert) {
		this.concert = concert;
	}
	
	
	
	
}
