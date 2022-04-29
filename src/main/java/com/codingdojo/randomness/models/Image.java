package com.codingdojo.randomness.models;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

@Entity
@Table(name = "images")
public class Image {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @NotBlank
    @Column(unique = true)
    private String url;

    @NotNull
    @NotBlank
    @Column
    private String artist;

    @NotNull
    @NotBlank
    @Column
    private String category;

    @NotNull
    @NotBlank
    @Column
    private Double nsfwRating;
    
	// Relationships connections
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
    

    public Image() {
    }

    public Image(String url, String artist, String category) {
        this.url = url;
        this.artist = artist;
        this.category = category;
    }
    
    

    public Image(Long id, @NotNull @NotBlank String url, @NotNull @NotBlank String artist,
			@NotNull @NotBlank String category, @NotNull @NotBlank Double nsfwRating, User user) {
		super();
		this.id = id;
		this.url = url;
		this.artist = artist;
		this.category = category;
		this.nsfwRating = nsfwRating;
		this.user = user;
	}

    
    
    
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public static DecimalFormat getDf() {
		return df;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Double getNsfwRating() {
        return nsfwRating;
    }

    public void setNsfwRating(Double nsfwRating) {
        this.nsfwRating = nsfwRating;
    }

    private static final DecimalFormat df = new DecimalFormat("0.00");

    public Image getRandomImage() {
        // Create new image
        // Get random image, set image url and author
        // Get image NSFW rating using image url
        // Get image Labels using image url
        // Return image
        Image newImage = mapJsonPicsum();
        newImage.setNsfw();
        newImage.setCategories();
        return newImage;
    }

    public Image getRandomImage(String query) {
        Image newImage = mapJsonPexel(query);
        newImage.setNsfw();
        newImage.setCategories();
        return newImage;
    }

    public Image mapJsonPicsum() {
        Random rand = new Random();
        int randInt = rand.nextInt(1084); // Generate random value for selecting image from Json Result
                                          // Search query * to be entered by user *
                                          // Form URL with user query
        String search = "https://picsum.photos/id/" + randInt + "/info";
        String APIResult = "";
        try {
            HttpResponse<String> randomPic = Unirest.get(search)
                    .asString();
            APIResult = randomPic.getBody();
        } catch (UnirestException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        APIResult = APIResult.replaceFirst("url", "");
        APIResult = APIResult.replaceFirst("download_url", "url");
        APIResult = APIResult.replaceFirst("author", "artist");
        JsonObject jObjTwo = JsonParser.parseString(APIResult).getAsJsonObject();

        Gson gson = new Gson();
        Image image = gson.fromJson(APIResult, Image.class);
        return image;
    }

    public Image mapJsonPexel(String query) {
        Image newImage = new Image();
        query = query.replaceAll(" ", "%20");
        Random rand = new Random();
        int randInt = rand.nextInt(50); // Generate random value for selecting image from Json Result
                                        // Search query * to be entered by user *
                                        // Form URL with user query
        String APIResult = "";
        String search = "https://pexelsdimasv1.p.rapidapi.com/v1/search?query=" + query
                + "&locale=en-US&per_page=50&page=1";
        try {
            HttpResponse<String> response = Unirest.get(search)
                    .header("Authorization", "PEXEL_KEY")
                    .header("X-RapidAPI-Host", "PexelsdimasV1.p.rapidapi.com")
                    .header("X-RapidAPI-Key", "297858111amsh921cb02eb5b6074p1b2579jsn280f7b970284")
                    .asString();
            APIResult = response.getBody();

        } catch (UnirestException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String newJsonString = "";

        JsonObject jObj = JsonParser.parseString(APIResult).getAsJsonObject();
        JsonArray jArray = jObj.getAsJsonArray("photos");
        JsonElement jArrayElement = jArray.get(randInt);
        JsonObject temp = jArrayElement.getAsJsonObject();
        JsonElement tempElement = temp.get("src");
        JsonElement artist = temp.get("photographer");
        JsonObject tempFinal = tempElement.getAsJsonObject();
        JsonElement picUrl = tempFinal.get("original");

        newJsonString += "{\"artist\":" + artist.toString() + ",\"url\":" + picUrl.toString() + "}";
        // newJsonString += ",\"url\":" + picUrl.toString() + "}";

        Gson gson = new Gson();
        Image image = gson.fromJson(newJsonString, Image.class);
        return image;
    }

    public void setNsfw() {
        String apiUrl = "{ \"url\": \"" + this.getUrl() + "\" }";
        String nsfwInfo = "";
        try {
            HttpResponse<String> nsfw = Unirest.post("https://nsfw-image-classification1.p.rapidapi.com/img/nsfw")
                    .header("content-type", "application/json")
                    .header("X-RapidAPI-Host", "nsfw-image-classification1.p.rapidapi.com")
                    .header("X-RapidAPI-Key", "297858111amsh921cb02eb5b6074p1b2579jsn280f7b970284")
                    .body(apiUrl)
                    .asString();

            nsfwInfo = nsfw.getBody();
        } catch (UnirestException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        JsonObject jObj = JsonParser.parseString(nsfwInfo).getAsJsonObject();
        JsonElement jElement = jObj.get("NSFW_Prob");
        Double nsfwRating = jElement.getAsDouble();
        nsfwRating = nsfwRating * 100;
        BigDecimal tempNsfwDecimal = new BigDecimal(nsfwRating).setScale(2, RoundingMode.HALF_UP);
        nsfwRating = tempNsfwDecimal.doubleValue();
        this.setNsfwRating(nsfwRating);

    }

    public void setCategories() {
        String apiUrl = "{ \"url\": \"" + this.getUrl() + "\" }";
        String lResponse = "";
        String labels = "";
        try {
            HttpResponse<String> labelResponse = Unirest.post("https://image-labeling1.p.rapidapi.com/img/label")
                    .header("content-type", "application/json")
                    .header("X-RapidAPI-Host", "image-labeling1.p.rapidapi.com")
                    .header("X-RapidAPI-Key", "297858111amsh921cb02eb5b6074p1b2579jsn280f7b970284")
                    .body(apiUrl)
                    .asString();

            lResponse = labelResponse.getBody();
        } catch (UnirestException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        Pattern p = Pattern.compile("\"([^\"]*)\"");
        Matcher m = p.matcher(lResponse);
        while (m.find()) {
            labels += (m.group(1));
            labels += " | ";
        }
        this.setCategory(labels);
    }
}