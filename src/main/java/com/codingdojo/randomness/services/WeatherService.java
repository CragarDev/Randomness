package com.codingdojo.randomness.services;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.codingdojo.randomness.models.Weather;

import io.github.cdimascio.dotenv.Dotenv;

@Service
public class WeatherService {

    //
    // generate a random zipcode
    //
    public String zipcode() {
        // System.out.println("********* random zipcode *********");

        String zipcode = null;

        // generate a random zipcode

        int zip1 = (int) (Math.random() * 9);
        int zip2 = (int) (Math.random() * 9);
        int zip3 = (int) (Math.random() * 9);
        int zip4 = (int) (Math.random() * 9);
        int zip5 = (int) (Math.random() * 9);
        // int zipped = zip1 * 1000 + zip2 * 100 + zip3 * 10 + zip4 * 1 + zip5;
        zipcode = (zip1 + "" + zip2 + "" + zip3 + "" + zip4 + "" + zip5);

        // System.out.println(zip1 + "" + zip2 + "" + zip3 + "" + zip4 + "" + zip5);
        // System.out.println("Zipcode: " + zipcode);

        // System.out.println("**********************************");

        return zipcode;
    }

    // Get the data from the API
    private static HttpURLConnection connection;

    public Weather weatherData() throws ParseException {

        // import the Api key
        Dotenv dotenv = Dotenv.load();
        String weatherApi = dotenv.get("WEATHER_API");

        // System.out.println("************TEST Weather Key ****************");
        // System.out.println(weatherApi);
        // System.out.println("*********************************************");

        // define a zipcode variable
        String zipcode = null;

        // define buffer reader
        BufferedReader reader;

        // define a string to hold the line of data
        String line;

        // define the stringBuffer to hold the lines
        StringBuffer responseContent = new StringBuffer();

        try {

            // Method 1:
            // set up the status code variable
            int statusCode = 0;

            // while status is not 200, means there is a bad connection or no zipcode found
            while (statusCode != 200) {

                // generate a random zipcode
                zipcode = this.zipcode();

                System.out.println("********* random zipcode *********");
                System.out.println("Zipcode: " + zipcode);
                System.out.println("**********************************");

                // set up the url
                URL url = new URL("https://api.openweathermap.org/data/2.5/weather?zip=" + zipcode
                        + "&appid=" + weatherApi + "&units=imperial");

                // Open our connection
                connection = (HttpURLConnection) url.openConnection();

                // Request Setup
                connection.setRequestMethod("GET");

                // Set timeout
                connection.setConnectTimeout(5000);
                connection.setReadTimeout(5000);

                // Get Response Code
                statusCode = connection.getResponseCode();
                System.out.println("********* weather data *********");
                System.out.println("statusCode" + statusCode);
                System.out.println("**********************************");
            }

            // reading the response data
            reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            while ((line = reader.readLine()) != null) {
                responseContent.append(line);
            }
            reader.close();

        } catch (MalformedURLException e) {
            e.printStackTrace();
        }

        catch (IOException e) {
            e.printStackTrace();
        } finally {
            connection.disconnect();
        }

        String returnedData = responseContent.toString();

        // convert the data to a JSON object
        // JSONObject jsonObject = new JSONObject(returnedData);
        JSONParser parser = new JSONParser();
        JSONObject json = null;
        try {
            json = (JSONObject) parser.parse(returnedData);
        } catch (org.json.simple.parser.ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } // generates the json object to return

        System.out.println("********* weather data *********");
        System.out.println("json" + json);
        System.out.println("**********************************");

        // from weatherOutput -----------------------------------------

        // work the items from the weather api into a Weather model
        Weather weather = new Weather();

        JSONObject jsonMain = (JSONObject) json.get("main");
        // n- convert the temperatures into fahrenheit and celcius

        // // get the temperature in fahrenheit
        // Double tempF = (Double) jsonMain.get("temp");
        // // convert the temperature to celcius
        // Double tempC = (tempF - 32) * 5 / 9;
        // // round the temperature to 0 decimal places
        // Double tempF2 = Math.round(tempF * 100) / 100;
        // // set the temperature in the model
        // weather.setTemperature(tempF2);

        weather.setTemperature((Double) jsonMain.get("temp")); // temp
        weather.setLows((Double) jsonMain.get("temp_min")); // temp_min
        weather.setHighs((Double) jsonMain.get("temp_max")); // temp_max
        weather.setHumidity((Long) jsonMain.get("humidity")); // humidity
        weather.setFeelsLike((Double) jsonMain.get("feels_like")); // feels_like

        JSONObject jsonCoord = (JSONObject) json.get("coord");
        weather.setLongitude((Double) jsonCoord.get("lon")); // longitude
        weather.setLatitude((Double) jsonCoord.get("lat")); // latitude

        List<?> jsonWeather = (List<?>) json.get("weather");
        JSONObject jsonWeatherObject = (JSONObject) jsonWeather.get(0);
        weather.setDescription((String) jsonWeatherObject.get("description")); // description
        weather.setIcon((String) jsonWeatherObject.get("icon")); // icon
        weather.setCondition((String) jsonWeatherObject.get("main")); // main

        weather.setCity((String) json.get("name")); // name

        JSONObject jsonWind = (JSONObject) json.get("wind");
        weather.setWindSpeed((Double) jsonWind.get("speed")); // wind speed
        weather.setWindDirection((Long) jsonWind.get("deg")); // wind direction

        weather.setZip(zipcode);

        // get state using the zipcode
        Map<String, String> stateMap = state(zipcode);
        weather.setState(stateMap.get("state"));

        System.out.println("********* weather data *********");
        System.out.println("city" + weather.getCity());
        System.out.println("temp" + weather.getTemperature());
        System.out.println("temp_min" + weather.getLows());
        System.out.println("temp_max" + weather.getHighs());
        System.out.println("humidity" + weather.getHumidity());
        System.out.println("feels_like" + weather.getFeelsLike());
        System.out.println("longitude" + weather.getLongitude());
        System.out.println("latitude" + weather.getLatitude());
        System.out.println("description" + weather.getDescription());
        System.out.println("icon" + weather.getIcon());
        System.out.println("condition" + weather.getCondition());
        System.out.println("wind speed" + weather.getWindSpeed());
        System.out.println("wind direction" + weather.getWindDirection());
        System.out.println("state" + weather.getState());
        System.out.println("zip" + weather.getZip());
        System.out.println("**********************************");

        return weather;
    }

    // Get the state using the zipcode from a list of states
    public Map<String, String> state(String zipcode) {

        // define the state variable
        String state = null;
        String stateAbr = null;

        // parse the zipcode into an integer
        int zip = Integer.parseInt(zipcode);

        // if the zipcode is in the first half of the zipcode range
        if (zip >= 35000 && zip <= 36999) {
            stateAbr = "AL";
            state = "Alabama";
        }
        if (zip >= 99500 && zip <= 99999) {
            stateAbr = "AK";
            state = "Alaska";
        }
        if (zip >= 85000 && zip <= 86999) {
            stateAbr = "AZ";
            state = "Arizona";
        }
        if (zip >= 71600 && zip <= 72999) {
            stateAbr = "AR";
            state = "Arkansas";
        }
        if (zip >= 90000 && zip <= 96699) {
            stateAbr = "CA";
            state = "California";
        }
        if (zip >= 80000 && zip <= 81999) {
            stateAbr = "CO";
            state = "Colorado";
        }
        if (zip >= 6000 && zip <= 6999) {
            stateAbr = "CT";
            state = "Connecticut";
        }
        if (zip >= 19700 && zip <= 19999) {
            stateAbr = "DE";
            state = "Delaware";
        }
        if (zip >= 32000 && zip <= 34999) {
            stateAbr = "FL";
            state = "Florida";
        }
        if (zip >= 30000 && zip <= 31999) {
            stateAbr = "GA";
            state = "Georgia";
        }
        if (zip >= 96700 && zip <= 96999) {
            stateAbr = "HI";
            state = "Hawaii";
        }
        if (zip >= 83200 && zip <= 83999) {
            stateAbr = "ID";
            state = "Idaho";
        }
        if (zip >= 60000 && zip <= 62999) {
            stateAbr = "IL";
            state = "Illinois";
        }
        if (zip >= 46000 && zip <= 47999) {
            stateAbr = "IN";
            state = "Indiana";
        }
        if (zip >= 50000 && zip <= 52999) {
            stateAbr = "IA";
            state = "Iowa";
        }
        if (zip >= 66000 && zip <= 67999) {
            stateAbr = "KS";
            state = "Kansas";
        }
        if (zip >= 40000 && zip <= 42999) {
            stateAbr = "KY";
            state = "Kentucky";
        }
        if (zip >= 70000 && zip <= 71599) {
            stateAbr = "LA";
            state = "Louisiana";
        }
        if (zip >= 3900 && zip <= 4999) {
            stateAbr = "ME";
            state = "Maine";
        }
        if (zip >= 20600 && zip <= 21999) {
            stateAbr = "MD";
            state = "Maryland";
        }
        if (zip >= 1000 && zip <= 2799) {
            stateAbr = "MA";
            state = "Massachusetts";
        }
        if (zip >= 48000 && zip <= 49999) {
            stateAbr = "MI";
            state = "Michigan";
        }
        if (zip >= 55000 && zip <= 56999) {
            stateAbr = "MN";
            state = "Minnesota";
        }
        if (zip >= 38600 && zip <= 39999) {
            stateAbr = "MS";
            state = "Mississippi";
        }
        if (zip >= 63000 && zip <= 65999) {
            stateAbr = "MO";
            state = "Missouri";
        }
        if (zip >= 59000 && zip <= 59999) {
            stateAbr = "MT";
            state = "Montana";
        }
        if (zip >= 27000 && zip <= 28999) {
            stateAbr = "NC";
            state = "North Carolina";
        }
        if (zip >= 58000 && zip <= 58999) {
            stateAbr = "ND";
            state = "North Dakota";
        }
        if (zip >= 68000 && zip <= 69999) {
            stateAbr = "NE";
            state = "Nebraska";
        }
        if (zip >= 88900 && zip <= 89999) {
            stateAbr = "NV";
            state = "Nevada";
        }
        if (zip >= 3000 && zip <= 3899) {
            stateAbr = "NH";
            state = "New Hampshire";
        }
        if (zip >= 7000 && zip <= 8999) {
            stateAbr = "NJ";
            state = "New Jersey";
        }
        if (zip >= 87000 && zip <= 88499) {
            stateAbr = "NM";
            state = "New Mexico";
        }
        if (zip >= 10000 && zip <= 14999) {
            stateAbr = "NY";
            state = "New York";
        }
        if (zip >= 43000 && zip <= 45999) {
            stateAbr = "OH";
            state = "Ohio";
        }
        if (zip >= 73000 && zip <= 74999) {
            stateAbr = "OK";
            state = "Oklahoma";
        }
        if (zip >= 97000 && zip <= 97999) {
            stateAbr = "OR";
            state = "Oregon";
        }
        if (zip >= 15000 && zip <= 19699) {
            stateAbr = "PA";
            state = "Pennsylvania";
        }
        if (zip >= 300 && zip <= 999) {
            stateAbr = "PR";
            state = "Puerto Rico";
        }
        if (zip >= 2800 && zip <= 2999) {
            stateAbr = "RI";
            state = "Rhode Island";
        }
        if (zip >= 29000 && zip <= 29999) {
            stateAbr = "SC";
            state = "South Carolina";
        }
        if (zip >= 57000 && zip <= 57999) {
            stateAbr = "SD";
            state = "South Dakota";
        }
        if (zip >= 37000 && zip <= 38599) {
            stateAbr = "TN";
            state = "Tennessee";
        }
        if (zip >= 75000 && zip <= 79999) {
            stateAbr = "TX";
            state = "Texas";
        }
        if (zip >= 88500 && zip <= 88599) {
            stateAbr = "TX";
            state = "Texas";
        }
        if (zip >= 84000 && zip <= 84999) {
            stateAbr = "UT";
            state = "Utah";
        }
        if (zip >= 5000 && zip <= 5999) {
            stateAbr = "VT";
            state = "Vermont";
        }
        if (zip >= 22000 && zip <= 24699) {
            stateAbr = "VA";
            state = "Virginia";
        }
        if (zip >= 20000 && zip <= 20599) {
            stateAbr = "DC";
            state = "Washington DC";
        }
        if (zip >= 98000 && zip <= 99499) {
            stateAbr = "WA";
            state = "Washington";
        }
        if (zip >= 24700 && zip <= 26999) {
            stateAbr = "WV";
            state = "West Virginia";
        }
        if (zip >= 53000 && zip <= 54999) {
            stateAbr = "WI";
            state = "Wisconsin";
        }
        if (zip >= 82000 && zip <= 83199) {
            stateAbr = "WY";
            state = "Wyoming";
        }

        // create a map using the state and state abbr
        Map<String, String> stateMap = new HashMap<String, String>();
        stateMap.put("state", state);
        stateMap.put("stateAbr", stateAbr);

        System.out.println("****************** statemap ********************");
        System.out.println(stateMap);
        System.out.println("************************************************");

        return stateMap;
    }

}
