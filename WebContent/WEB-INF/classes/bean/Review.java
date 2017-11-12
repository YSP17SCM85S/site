package bean;

import java.util.ArrayList;
import java.util.List;

public class Review {

    String carname;
    String rent;
    String modelnumber;
    String registrationnumber;
    String username;
    String gender;
	String occupation;
	
	String userage;
	String rating;
	String review;
	String reviewdate;
	
	

   public Review(String carname,String rent,String modelnumber,String registrationnumber,String username, String gender,String occupation,String userage,String rating,String review,String reviewdate){
   
   this.carname = carname;
   this.rent = rent;
   this.modelnumber = modelnumber;
   this.registrationnumber = registrationnumber;
   this.rating = rating;
   this.username = username;
    this.userage = userage;
   this.gender = gender;
   this.occupation = occupation;
   this.review = review;
   this.reviewdate = reviewdate;
   
   }

	public String getCarname() {
		return carname;
	}


	public String getRent() {
		return rent;
	}


	public String getModelnumber() {
		return modelnumber;
	}


	public String getReview() {
		return review;
	}


	public String getRating() {
		return rating;
	}

	public String getRegistrationnumber() {
		return registrationnumber;
	}

	
	public String getUsername() {
		return username;
	}

	


	public String getUserage(){
		return userage;
	}
	
	public String getGender(){
		return gender;		
	}
	
	public String getOccupation(){
		return occupation;
}

public String getReviewdate(){
		return reviewdate;
}
}