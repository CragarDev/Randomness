package com.codingdojo.randomness.models;

import java.util.ArrayList;
import java.util.List;

public class LocationStats {
	private String state;
	private String country;
	private int lastestTotalCases;
	private int diffFromPrevDay;
	
	private List<LocationStats> allStats = new ArrayList<>();
	
	
	//Getter & Setters
	
	public List<LocationStats> getAllStats() {
		return allStats;
	}
	public void setAllStats(List<LocationStats> allStats) {
		this.allStats = allStats;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getLastestTotalCases() {
		return lastestTotalCases;
	}
	public void setLastestTotalCases(int lastestTotalCases) {
		this.lastestTotalCases = lastestTotalCases;
	}
	
	
	
	public int getDiffFromPrevDay() {
		return diffFromPrevDay;
	}
	public void setDiffFromPrevDay(int diffFromPrevDay) {
		this.diffFromPrevDay = diffFromPrevDay;
	}
	
	//ToString
	
	
	@Override
	public String toString() {
		return "LocationStats [state=" + state + ", country=" + country + ", lastestTotalCases=" + lastestTotalCases
				+ "]";
	}
}
