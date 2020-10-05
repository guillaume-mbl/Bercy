package com.Bercy.Beans;

public class Place {

	private int id;
	private int numero;
	private String dateHeure;
	Reservation resa;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	public String getDateHeure() {
		return dateHeure;
	}
	public void setDateHeure(String dateHeure) {
		this.dateHeure = dateHeure;
	}
	public Reservation getResa() {
		return resa;
	}
	public void setResa(Reservation resa) {
		this.resa = resa;
	}
	
	
	
	
	
}
