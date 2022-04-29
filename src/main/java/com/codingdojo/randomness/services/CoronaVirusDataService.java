package com.codingdojo.randomness.services;

import java.io.IOException;
import java.io.StringReader;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.PostConstruct;

import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.codingdojo.randomness.models.LocationStats;

@Service
public class CoronaVirusDataService {

	// to get the raw data from the URL
	private static String VIRUS_DATA_URL = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv";

	// injecting dependency from model file
	private List<LocationStats> allStats = new ArrayList<>();

	// Random part
	private static Random random = new Random();

	// Getters
	public List<LocationStats> getAllStats() {
		return allStats;
	}

	public void setAllStats(List<LocationStats> allStats) {
		this.allStats = allStats;
	}

	@PostConstruct // is a way to tell Spring after completion of the CoronaVirusDataService
					// construction, execute the fetchVirusData()
	@Scheduled(cron = "* * 1 * * *") // to update daily
	// created a method to make an HTTP call to the URL
	public void fetchVirusData() throws IOException, InterruptedException {
		List<LocationStats> newStats = new ArrayList<>(); // created a new newStates to prevent error responses

		// to create HTTP call is using the HTTP client
		HttpClient client = HttpClient.newHttpClient(); // create new client
		HttpRequest request = HttpRequest.newBuilder() // HttpRequest is another class that allow to use builder pattern
				.uri(URI.create(VIRUS_DATA_URL)) // meaning where do i need to access or Http request
				.build();

		// this HttpResponse is to get a response from the all the raw data as a string
		HttpResponse<String> httpResponse = client.send(request, HttpResponse.BodyHandlers.ofString()); // take the body
																										// and return as
																										// a string
		// System.out.println(httpResponse.body());

		// from Common CSV java library to parse the data
		// Use manual header input
		StringReader csvBodyReader = new StringReader(httpResponse.body()); // StringReader is an instance of Reader

		Iterable<CSVRecord> records = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(csvBodyReader);
		for (CSVRecord record : records) {
			LocationStats locationStat = new LocationStats();
			locationStat.setState(record.get("Province/State"));
			locationStat.setCountry(record.get("Country/Region"));

			int latestCases = Integer.parseInt(record.get(record.size() - 1));
			int prevDayCases = Integer.parseInt(record.get(record.size() - 12));

			locationStat.setLastestTotalCases(latestCases);
			locationStat.setDiffFromPrevDay(latestCases - prevDayCases);
			newStats.add(locationStat);

		}
		System.out.println("====================================================================");

		this.allStats = newStats;

		// Random Part
		getRandomItem(newStats);
	}

	private void getRandomItem(List<LocationStats> newStats) {
		System.out.println(random.nextInt(newStats.size()));

	}

}
