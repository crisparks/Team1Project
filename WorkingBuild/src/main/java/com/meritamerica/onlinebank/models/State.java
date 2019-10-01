package com.meritamerica.onlinebank.models;

import java.util.ArrayList;
import java.util.List;

public class State {
	public String name;
	public String abbr;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAbbr() {
		return abbr;
	}

	public void setAbbr(String abbr) {
		this.abbr = abbr;
	}

	public State(String a, String n) { name = n; abbr = a; }
	
	public static List<State> getStates() {
		List<State> retList = new ArrayList<>();
		retList.add(new State("AL", "Alabama"));
		retList.add(new State("AK", "Alaska"));
		retList.add(new State("AZ", "Arizona"));
		retList.add(new State("AR", "Arkansas"));
		retList.add(new State("CA", "California"));
		retList.add(new State("CO", "Colorado"));
		retList.add(new State("CT", "Connecticut"));
		retList.add(new State("DC", "Dist of Columbia"));
		retList.add(new State("DE", "Delaware"));
		retList.add(new State("FL", "Florida"));
		retList.add(new State("GA", "Georgia"));
		retList.add(new State("HI", "Hawaii"));
		retList.add(new State("ID", "Idaho"));
		retList.add(new State("IL", "Illinois"));
		retList.add(new State("IN", "Indiana"));
		retList.add(new State("IA", "Iowa"));
		retList.add(new State("KS", "Kansas"));
		retList.add(new State("KY", "Kentucky"));
		retList.add(new State("LA", "Louisiana"));
		retList.add(new State("ME", "Maine"));
		retList.add(new State("MD", "Maryland"));
		retList.add(new State("MA", "Massachusetts"));
		retList.add(new State("MI", "Michigan"));
		retList.add(new State("MN", "Minnesota"));
		retList.add(new State("MS", "Mississippi"));
		retList.add(new State("MO", "Missouri"));
		retList.add(new State("MT", "Montana"));
		retList.add(new State("NE", "Nebraska"));
		retList.add(new State("NV", "Nevada"));
		retList.add(new State("NH", "New Hampshire"));
		retList.add(new State("NJ", "New Jersey"));
		retList.add(new State("NM", "New Mexico"));
		retList.add(new State("NY", "New York"));
		retList.add(new State("NC", "North Carolina"));
		retList.add(new State("ND", "North Dakota"));
		retList.add(new State("OH", "Ohio"));
		retList.add(new State("OK", "Oklahoma"));
		retList.add(new State("OR", "Oregon"));
		retList.add(new State("PA", "Pennsylvania"));
		retList.add(new State("PR", "Puerto Rico"));
		retList.add(new State("RI", "Rhode Island"));
		retList.add(new State("SC", "South Carolina"));
		retList.add(new State("SD", "South Dakota"));
		retList.add(new State("TN", "Tennessee"));
		retList.add(new State("TX", "Texas"));
		retList.add(new State("UT", "Utah"));
		retList.add(new State("VT", "Vermont"));
		retList.add(new State("VA", "Virginia"));
		retList.add(new State("WA", "Washington"));
		retList.add(new State("WV", "West Virginia"));
		retList.add(new State("WI", "Wisconsin"));
		retList.add(new State("WY", "Wyoming"));
		return retList;
	}
}
