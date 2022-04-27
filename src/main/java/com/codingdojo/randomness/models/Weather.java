package com.codingdojo.randomness.models;

public class Weather {

	// set up attributes for the weather object

	// From 'main'
	// temperature attribute
	private Double temperature;
	// low temperature attribute
	private Double lows;
	// high temperature attribute
	private Double highs;
	// humidity attribute
	private Long humidity;
	// feels like temperature attribute
	private Double feelsLike;

	// From 'coord'
	// * longitude attribute
	private Double longitude;
	// * latitude attribute
	private Double latitude;

	// from 'weather'
	// * weather icon attribute
	private String icon;
	// * description attribute
	private String description;
	// * weather condition attribute
	private String condition; // called 'main' in the json data

	// * city attribute
	private String city; // called 'name' in the json data

	// from 'wind'
	// wind direction attribute
	private Long windDirection;
	// wind speed attribute
	private Double windSpeed;

	// zip code attribute
	private String zip;

	// state attribute
	private String state;

	public Weather() {
		super();
	}

	public Weather(Double temperature, Double lows, Double highs, Long humidity, Double feelsLike, Double longitude,
			Double latitude, String icon, String description, String condition, String city, Long windDirection,
			Double windSpeed, String zip, String state) {
		super();
		this.temperature = temperature;
		this.lows = lows;
		this.highs = highs;
		this.humidity = humidity;
		this.feelsLike = feelsLike;
		this.longitude = longitude;
		this.latitude = latitude;
		this.icon = icon;
		this.description = description;
		this.condition = condition;
		this.city = city;
		this.windDirection = windDirection;
		this.windSpeed = windSpeed;
		this.zip = zip;
		this.state = state;
	}

	public Double getTemperature() {
		return temperature;
	}

	public void setTemperature(Double temperature) {
		this.temperature = temperature;
	}

	public Double getLows() {
		return lows;
	}

	public void setLows(Double lows) {
		this.lows = lows;
	}

	public Double getHighs() {
		return highs;
	}

	public void setHighs(Double highs) {
		this.highs = highs;
	}

	public Long getHumidity() {
		return humidity;
	}

	public void setHumidity(Long humidity) {
		this.humidity = humidity;
	}

	public Double getFeelsLike() {
		return feelsLike;
	}

	public void setFeelsLike(Double feelsLike) {
		this.feelsLike = feelsLike;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Long getWindDirection() {
		return windDirection;
	}

	public void setWindDirection(Long windDirection) {
		this.windDirection = windDirection;
	}

	public Double getWindSpeed() {
		return windSpeed;
	}

	public void setWindSpeed(Double windSpeed) {
		this.windSpeed = windSpeed;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
