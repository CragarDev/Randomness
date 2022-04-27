package com.codingdojo.randomness.models;

import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GenerationType;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "images")
public class Image {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotNull
    @NotBlank
    @Column(unique=true)
    private String url;

    @NotNull
    @NotBlank
    @Column
    private String artist;

    @NotNull
    @NotBlank
    @Column
    private String category;

    public Image() {
    }

    public Image(String url, String artist, String category) {
        this.url = url;
        this.artist = artist;
        this.category = category;
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

    public static String fetchImage(){
        Random rand = new Random(); 
        int picNum = rand.nextInt(50); 
        int picNumTwo = rand.nextInt(1084);    // Generate random value for selecting image from Json Result
        String query = "Space";                // Search query * to be entered by user *
                                                // Form URL with user query
        String search = "https://picsum.photos/id/" + picNumTwo + "/info";
        Image newImage = new Image();
        String HTTPResult = "";
        
        try {
            HttpResponse<String> randomPic = Unirest.get(search)
            .asString();
            HTTPResult = randomPic.getBody();
        } catch (UnirestException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        JsonObject jObjTwo = JsonParser.parseString(HTTPResult).getAsJsonObject();

        JsonElement artist = jObjTwo.get("author");
        JsonElement picture = jObjTwo.get("download_url");

        String apiUrl = "{ \"url\": " + picture + "}";
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

        

        String labels = "";
        try {
            HttpResponse<String> labelResponse = Unirest.post("https://image-labeling1.p.rapidapi.com/img/label")
            .header("content-type", "application/json")
            .header("X-RapidAPI-Host", "image-labeling1.p.rapidapi.com")
            .header("X-RapidAPI-Key", "297858111amsh921cb02eb5b6074p1b2579jsn280f7b970284")
            .body(apiUrl)
            .asString();

            labels = labelResponse.getBody();
        } catch (UnirestException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        

        System.out.println("///////////////////////////////////////");
        System.out.println(artist);
        System.out.println(picture);
        System.out.println(nsfwInfo);
        System.out.println(labels);
        System.out.println("///////////////////////////////////////");

        return picture.toString();

    }
    public static String fetchImage(String query){
        Image newImage = new Image();
        String stringToParse = "";
        String nsfwInfo = "";
        String labels = "";
        Random rand = new Random(); 
        int picNum = rand.nextInt(50); 
        int picNumTwo = rand.nextInt(1084);   // Generate random value for selecting image from Json Result
                                                    // Search query * to be entered by user *
                                                    // Form URL with user query
        String search = "https://pexelsdimasv1.p.rapidapi.com/v1/search?query=" + query + "&locale=en-US&per_page=50&page=1";
        try {
            HttpResponse<String> response = Unirest.get(search)
            .header("Authorization", "563492ad6f91700001000001531ba5b6131744a38b9b9b7901022ff7")
            .header("X-RapidAPI-Host", "PexelsdimasV1.p.rapidapi.com")
            .header("X-RapidAPI-Key", "297858111amsh921cb02eb5b6074p1b2579jsn280f7b970284")
            .asString();
            stringToParse = response.getBody();
            // Parse string in to JSON object
            
        } catch (UnirestException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        JsonObject jObj = JsonParser.parseString(stringToParse).getAsJsonObject();
        JsonArray jArray = jObj.getAsJsonArray("photos");
        JsonElement jArrayElement = jArray.get(picNum);
        JsonObject temp = jArrayElement.getAsJsonObject();
        JsonElement tempElement = temp.get("src");
        JsonElement artist = temp.get("artist");
        JsonObject tempFinal = tempElement.getAsJsonObject();
        JsonElement picUrl = tempFinal.get("original");
        String picture = picUrl.toString();
        String imageUrl = "";

        String apiUrl = "{ \"url\": " + picture + "}";
        
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

        
        try {
            HttpResponse<String> labelResponse = Unirest.post("https://image-labeling1.p.rapidapi.com/img/label")
            .header("content-type", "application/json")
            .header("X-RapidAPI-Host", "image-labeling1.p.rapidapi.com")
            .header("X-RapidAPI-Key", "297858111amsh921cb02eb5b6074p1b2579jsn280f7b970284")
            .body(apiUrl)
            .asString();

            labels = labelResponse.getBody();
        } catch (UnirestException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        System.out.println("///////////////////////////////////////");
        System.out.println(artist);
        System.out.println(picture);
        System.out.println(nsfwInfo);
        System.out.println(labels);
        System.out.println("///////////////////////////////////////");
        


        return picture;
    }



}
