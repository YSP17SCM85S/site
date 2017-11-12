package dao;
import java.util.ArrayList;
import java.util.HashMap;

import bean.Bestrating;
import bean.Review;

import com.mongodb.AggregationOutput;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;



public class MongoDBDataUtilities
{

 public static void insertReviews(String carname,String rent,String modelnumber,String registrationnumber,String username,String gender,String occupation,String userage,String rating,String review,String reviewdate)
{    
    try{
	MongoClient mongo  = new MongoClient("localhost", 27017);
     DB db = mongo.getDB("carrental");
    DBCollection myReviews= db.getCollection("customerreviews");
	 BasicDBObject doc = new BasicDBObject("title", "customerreviews").
            append("Carname", carname).
            append("Rent", rent).
           append("Modelnumber", modelnumber).
            append("Registrationnumber", registrationnumber).
			append("Username", username).
            append("Gender", gender).
           append("Occupation", occupation).
            append("Userage", userage).
			append("Rating", rating).
            append("Review", review).
            append("Reviewdate", reviewdate);
			
             myReviews.insert(doc);
		   System.out.println("cool");
	}catch(Exception e){ System.out.println(e.getMessage());}
   //      System.out.println("Document inserted successfully");
 }

 public  HashMap<String, ArrayList<Review>> Viewreview(String carname)
 //public  void  Viewreview(String carname)
	{
		HashMap<String,ArrayList<Review>> Reviewmap = new HashMap<String, ArrayList<Review>>();
			ArrayList<Review> reviews = new  ArrayList<Review>();
		    System.out.println("cool story");
	
		
	
	        
				try{
				    MongoClient mongo  = new MongoClient("localhost", 27017);
					DB db = mongo.getDB("carrental");
					DBCollection myReviews= db.getCollection("customerreviews");
					BasicDBObject whereQuery = new BasicDBObject();
					whereQuery.put("Carname", carname);
			
	
			DBCursor cursor = myReviews.find(whereQuery);
				while (cursor.hasNext())
					{
				     BasicDBObject obj = (BasicDBObject) cursor.next();
					
					 
					 String car = obj.getString("Carname");
					 String rent = obj.getString("Rent");
					 String modelnumber = obj.getString("Modelnumber");
					 String registrationnumber = obj.getString("Registrationnumber");
					 String username = obj.getString("Username");
					 String gender = obj.getString("Gender");
					 String occupation = obj.getString("Occupation");
					 String userage = obj.getString("Userage");
					 String rating = obj.getString("Rating");
					 String reviewtext = obj.getString("Review");
					 String reviewdate = obj.getString("Reviewdate");
					 System.out.println(reviewtext);
					 Review review = new Review(car,rent,modelnumber,registrationnumber,username,gender,occupation,userage,rating,reviewtext,reviewdate);
					 reviews.add(review);
					 
					}
				
									 
					 Reviewmap.put("ViewReview",reviews);
					}
				
					catch(Exception e)
					{
						
						e.printStackTrace();
					}
					 System.out.println(Reviewmap.size());
					 return Reviewmap;
				
	}
	

 public  ArrayList <Bestrating> topProducts(){
	 ArrayList <Bestrating> bestrate = new ArrayList <Bestrating> ();
	 try{
		 System.out.println("top5");
		 MongoClient mongo  = new MongoClient("localhost", 27017);
		 DB db = mongo.getDB("carrental");
		 DBCollection myReviews= db.getCollection("customerreviews");
		 DBObject groupProducts = new BasicDBObject("_id","$Carname"); 
		 groupProducts.put("count",new BasicDBObject("$sum",1));
		 DBObject group = new BasicDBObject("$group",groupProducts);
		 DBObject limit=new BasicDBObject();
		 limit=new BasicDBObject("$limit",5);

		 DBObject sortFields = new BasicDBObject("count",-1);
		 DBObject sort = new BasicDBObject("$sort",sortFields);
		 AggregationOutput output = myReviews.aggregate(group,sort,limit);
		 for (DBObject res : output.results()) {
			 System.out.println(res);
			 String carname =(res.get("_id")).toString();
			 String count = (res.get("count")).toString();	
			 Bestrating best = new Bestrating(carname,count);
			 bestrate.add(best);

		 }
	 }catch (Exception e){ System.out.println(e.getMessage());}
	 return bestrate;
 }   

 
 
 
	}
  
 


