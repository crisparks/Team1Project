package com.meritamerica.onlinebank.models;

public class CdOption {
	private int id;
	public int term;
	public double rate;
	
	public CdOption(int i, int t, double r) { id = i; term = t; rate = r; }
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	
}
