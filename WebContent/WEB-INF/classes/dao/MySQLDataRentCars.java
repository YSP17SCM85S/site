package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.ArrayList;
import java.util.Set;
import java.util.Map.Entry;
import bean.CarBean;
import bean.LocationBean;
import bean.LoginBean;
import bean.RentalBean;
import bean.ReservationBean;
import bean.UserBean;

public class MySQLDataRentCars {
	
	Connection connection=null;
	Statement statement=null;
	PreparedStatement preparedStatement=null;
	ResultSet rs = null; 

	public int addUser(HashMap<String,UserBean> hmb) 
	{
		UserBean userBean = new UserBean();
		Set set = hmb.entrySet();
		Iterator iterator = set.iterator();
		int result = 0;
		while(iterator.hasNext())
		{
			Map.Entry entry   = (Map.Entry)iterator.next();
			userBean = (UserBean)entry.getValue();
			
		}
		String userName = userBean.getUserName();
		String passWord = userBean.getPassWord();
		String role     = "Regular Customer";
		
		try{
		createConnection();
		String query = "INSERT INTO rent_car_users(USER_NAME,PASSWORD)"+"VALUES(?,?)";
		PreparedStatement preparedStatement = connection.prepareStatement(query);
		preparedStatement.setString(1,userName);
		preparedStatement.setString(2,passWord);		
		
		result  = preparedStatement.executeUpdate();

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
		
		
		return result ;
	}
	
	
	// Code for retrieving a UserName 
	
	public int userExists( String userName){
		
		HashMap<String, UserBean> userList = new HashMap<String,UserBean>();
		UserBean userBean 	= new UserBean();
		ResultSet resultSet;
		int result =0;
		
		try {
			createConnection();
			String query = "SELECT USER_NAME FROM rent_car_users WHERE USER_NAME = ? ";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1,userName);
			resultSet = preparedStatement.executeQuery();
			
			if(!resultSet.next())
			{
				result = 0;
			}
			else
			{
				result = 1;
			}
			
			
			
		} 
		
		catch (Exception e) {
			
			e.printStackTrace();
		} 
				
		return result;
		
	}
	
	
	// CODE FOR VALID USER ENDS HERE
	
	
	
	//CODE FOR USER LOGIN STARTS HERE 
	
	
	 public HashMap<String, LoginBean >  userLogIn(String userName)
	 {
		 HashMap<String, LoginBean> hlb =  new HashMap<String, LoginBean>();
		 ResultSet resultSet;
		 LoginBean loginBean = new LoginBean();
		 
		 try{
			 createConnection();
			 String query = "SELECT USER_NAME, PASSWORD  FROM rent_car_users WHERE USER_NAME = ?";
			 PreparedStatement ps1 = connection.prepareStatement(query);
			 ps1.setString(1,userName);
			 resultSet= ps1.executeQuery();
			 
			 while(resultSet.next())
			 {
				 loginBean.setUserNameEmail(resultSet.getString("USER_NAME"));
				 loginBean.setPassWord(resultSet.getString("PASSWORD"));
			 }
			 hlb.put(loginBean.getUserNameEmail(),loginBean);
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 return hlb;
	 }
	
	
	//CODE FOR USER LOGIN ENDS HERE
	
	
	
	
	
	
	
	
	
	
	//CODE FOR RETURNING THE geolocation
	  
	  public HashMap<String,LocationBean> getGeoLocation(String longitude, String latitude)
	  {
		  HashMap<String,LocationBean> hlb = new HashMap<String, LocationBean>();
		  ResultSet resultSet =null;
		  LocationBean locationBean = new LocationBean();
		  try {
			createConnection();
			String query = "SELECT ZIP_CODE, city, STATE, COUNTRY FROM geolocation WHERE LONGITUDE = ? AND LATITUDE = ? ";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, longitude);
			preparedStatement.setString(2, latitude);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next())
			{
				locationBean.setZipCode(String.valueOf(resultSet.getInt("ZIP_CODE")));
				locationBean.setState(resultSet.getString("city"));
				locationBean.setCountry(resultSet.getString("COUNTRY"));
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}  
		  hlb.put("Location", locationBean);		  
		  return hlb;
	  }
	
	//CODE FOR geolocation ENDS HERE 
	  

	  
	//CODE FOR ADDING A NEW car IN THE DATABASE STARTS HERE  
		
	  public int addProducts(HashMap<String, ArrayList<CarBean>> hcb)
	  {
		  int result= 0;
		  
		  CarBean carBean = new CarBean();
		  for(Map.Entry<String, ArrayList<CarBean>> map : hcb.entrySet())
		  {
			  for(CarBean bean : map.getValue())
			  {
				  carBean = bean;
				  try {
						createConnection();
						String query ="INSERT INTO car (CAR_ID, CAR_NAME, CATEGORY_ID, BRAND, MODEL, PRODUCTION_YEAR, MILEAGE, COLOR, IMAGE_PATH, STARTING_PRICE, RESERVATION_STATUS, REGISTRATION_NUMBER) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
						PreparedStatement preparedStatement = connection.prepareStatement(query);
						preparedStatement.setInt(1, carBean.getCarID());
						preparedStatement.setString(2, carBean.getCarNAME());
						preparedStatement.setInt(3, carBean.getCategoryID());
						preparedStatement.setString(4, carBean.getBrand());
						preparedStatement.setString(5, carBean.getModel());
						preparedStatement.setInt(6, carBean.getProductionYEAR());
						preparedStatement.setInt(7, carBean.getMileage());
						preparedStatement.setString(8, carBean.getColor());
						preparedStatement.setString(9, carBean.getImagePATH());
						preparedStatement.setDouble(10, carBean.getStartingPRICE());
						preparedStatement.setInt(11, carBean.getReservationSTATUS());
						preparedStatement.setString(12, carBean.getRegistrationNUMBER());
						result = preparedStatement.executeUpdate();
									
						
					} catch (Exception e) {
						
						e.printStackTrace();
					}

			  }
				  
		  }
		  
		  
		  
		  return result;
	  }
		
	//CODE FOR ADDING A car FROM THE DATA BASE ENDS HERE
  
	  
	  
	  
	  
	  
	  
	  
	//CODE FOR RETURNING ALL THE CARS FROM THE DATABASE STARTS HERE 
	  
	  public HashMap<String, ArrayList<CarBean>> getAllCars()
	  {
		  ResultSet resultSet = null;
		  HashMap<String, ArrayList<CarBean>> hcb = new HashMap<String, ArrayList<CarBean>>();
		  ArrayList<CarBean> carList =  new ArrayList<CarBean>();
		  
		  
		  try {
			createConnection();
			
			String query = "SELECT CAR_ID, CAR_NAME, CATEGORY_ID, BRAND, MODEL, PRODUCTION_YEAR, MILEAGE, COLOR, IMAGE_PATH, STARTING_PRICE, REGISTRATION_NUMBER FROM car WHERE RESERVATION_STATUS = ? ORDER BY CATEGORY_ID";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, 1);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next())
			{
				CarBean bean = new CarBean();
				
				bean.setCarID(resultSet.getInt("CAR_ID"));
				bean.setCarNAME(resultSet.getString("CAR_NAME"));
				bean.setCategoryID(resultSet.getInt("CATEGORY_ID"));
				bean.setBrand(resultSet.getString("BRAND"));
				bean.setModel(resultSet.getString("MODEL"));
				bean.setProductionYEAR(resultSet.getInt("PRODUCTION_YEAR"));
				bean.setMileage(resultSet.getInt("MILEAGE"));
				bean.setColor(resultSet.getString("COLOR"));
				bean.setImagePATH(resultSet.getString("IMAGE_PATH"));
				bean.setStartingPRICE(resultSet.getDouble("STARTING_PRICE"));
				bean.setRegistrationNUMBER(resultSet.getString("REGISTRATION_NUMBER"));
				
				carList.add(bean);
				hcb.put("CARS", carList);
				
			}
			
		
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		  
		  
		  return hcb;		  
		  
	  }
  
	  
	//CODE FOR RETURNING ALL THE CARS ENDS HERE   
	  
	  
	//CODE FOR RETURNING ALL THE CARS FROM THE DATABASE STARTS HERE 
	  
	  public CarBean getCarById(int carId)
	  {
		  ResultSet resultSet = null;
		  CarBean bean = new CarBean();		
		  
		  try {
			createConnection();
			
			String query = "SELECT CAR_ID, CAR_NAME, CATEGORY_ID, BRAND, MODEL, PRODUCTION_YEAR, MILEAGE, COLOR, IMAGE_PATH, STARTING_PRICE, RESERVATION_STATUS, REGISTRATION_NUMBER FROM car WHERE CAR_ID = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, carId);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next())
			{
								
				bean.setCarID(resultSet.getInt("CAR_ID"));
				bean.setCarNAME(resultSet.getString("CAR_NAME"));
				bean.setCategoryID(resultSet.getInt("CATEGORY_ID"));
				bean.setBrand(resultSet.getString("BRAND"));
				bean.setModel(resultSet.getString("MODEL"));
				bean.setProductionYEAR(resultSet.getInt("PRODUCTION_YEAR"));
				bean.setMileage(resultSet.getInt("MILEAGE"));
				bean.setColor(resultSet.getString("COLOR"));
				bean.setImagePATH(resultSet.getString("IMAGE_PATH"));
				bean.setStartingPRICE(resultSet.getDouble("STARTING_PRICE"));
				bean.setReservationSTATUS(resultSet.getInt("RESERVATION_STATUS"));
				bean.setRegistrationNUMBER(resultSet.getString("REGISTRATION_NUMBER"));
								
			}
			
		
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		  
		  
		  return bean;		  
		  
	  }
  
	  
	//CODE FOR RETURNING ALL THE CARS ENDS HERE   
	  
	//CODE FOR RETURNING car FOR AUTOMCOMPLETION FEATURE FROM THE DATABASE STARTS HERE 
	  
	 // public HashMap<String, ArrayList<CarBean>> getCarByIdforAutoComplete(int carId)
	  public CarBean getCarByIdforAutoComplete(int carId)
	  {
		 // HashMap<String, ArrayList<CarBean>> hashCar = new HashMap<String, ArrayList<CarBean>>();
		  CarBean bean = new CarBean();
		  ResultSet resultSet = null;
		  ArrayList<CarBean> listCar = new ArrayList<CarBean>();
		  
		  try {
			createConnection();
			
			String query = "SELECT CAR_ID, CAR_NAME, CATEGORY_ID, BRAND, MODEL, PRODUCTION_YEAR, MILEAGE, COLOR, IMAGE_PATH, STARTING_PRICE, RESERVATION_STATUS, REGISTRATION_NUMBER FROM car WHERE CAR_ID = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, carId);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next())
			{
				//CarBean bean = new CarBean();				
				bean.setCarID(resultSet.getInt("CAR_ID"));
				bean.setCarNAME(resultSet.getString("CAR_NAME"));
				bean.setCategoryID(resultSet.getInt("CATEGORY_ID"));
				bean.setBrand(resultSet.getString("BRAND"));
				bean.setModel(resultSet.getString("MODEL"));
				bean.setProductionYEAR(resultSet.getInt("PRODUCTION_YEAR"));
				bean.setMileage(resultSet.getInt("MILEAGE"));
				bean.setColor(resultSet.getString("COLOR"));
				bean.setImagePATH(resultSet.getString("IMAGE_PATH"));
				bean.setStartingPRICE(resultSet.getDouble("STARTING_PRICE"));
				bean.setReservationSTATUS(resultSet.getInt("RESERVATION_STATUS"));
				bean.setRegistrationNUMBER(resultSet.getString("REGISTRATION_NUMBER"));
				listCar.add(bean);
								
			}
			
		
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		  
		  
		 // return hashCar;		  
		return bean;
		  
	  }
  
	  
	//CODE FOR RETURNING THE car car FOR AUTOMCOMPLETION FEATURE ENDS HERE   

	  
	  
	
	  
	 	  
	  
	//CODE FOR ADVANCED QUERY STARTS HERE 
	  
	  
	  public HashMap<String, ArrayList<CarBean>> getFilteredCars(StringBuffer stringBuffer)
	  {
		  ResultSet resultSet = null;
		  HashMap<String, ArrayList<CarBean>> hcb = new HashMap<String, ArrayList<CarBean>>();
		  ArrayList<CarBean> carList =  new ArrayList<CarBean>();
		  
		  
		  try {
			createConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(stringBuffer.toString());
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next())
			{
				CarBean bean = new CarBean();
				
				bean.setCarID(resultSet.getInt("CAR_ID"));
				bean.setCarNAME(resultSet.getString("CAR_NAME"));
				bean.setCategoryID(resultSet.getInt("CATEGORY_ID"));
				bean.setBrand(resultSet.getString("BRAND"));
				bean.setModel(resultSet.getString("MODEL"));
				bean.setProductionYEAR(resultSet.getInt("PRODUCTION_YEAR"));
				bean.setMileage(resultSet.getInt("MILEAGE"));
				bean.setColor(resultSet.getString("COLOR"));
				bean.setImagePATH(resultSet.getString("IMAGE_PATH"));
				bean.setStartingPRICE(resultSet.getDouble("STARTING_PRICE"));
				
				carList.add(bean);
				hcb.put("CARS", carList);
				
			}
			
		
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		  
		  
		  return hcb;		  
		  
	  }  
	  
	//CODE FOR ADVANCED QUERY ENDS HERE  
	  
	  
	//GETTING TARRIF FROM THE DATABASE  
	  
	 public double getTarrif(int carId)
	  {
		  double basicTarrif= 0;
		  ResultSet resultSet = null;
		  
		  try {
			createConnection();
			String query = "SELECT STARTING_PRICE FROM car WHERE CAR_ID = ?"; 
		    PreparedStatement preparedStatement = connection.prepareStatement(query);
		    preparedStatement.setInt(1, carId);
		    resultSet = preparedStatement.executeQuery();
		    
		    
		    while(resultSet.next())
		    {
		    	
		    	basicTarrif = resultSet.getDouble("STARTING_PRICE");
		    	
		    }
		  
		  
		  } catch (Exception e) {			
				e.printStackTrace();
			} 

		  
		  
		  return basicTarrif;		  
	  }
  
	  
	//GETTING TARRIF FROM THE DATABASE  

	 
	// GETTING city ZIP CODE FROM THE DATABASE STARTS HERE 
	 
	 public int getCityZipCode(String cityName)
	  {
		  int zipCode = 0;
		  ResultSet resultSet = null;
		  
		  try {
			createConnection();
			String query = "SELECT ZIP_CODE FROM city WHERE UPPER(NAME) = UPPER(?)"; 
		    PreparedStatement preparedStatement = connection.prepareStatement(query);
		    preparedStatement.setString(1, cityName);
		    resultSet = preparedStatement.executeQuery();
		    
		    
		    while(resultSet.next())
		    {
		    	
		    	zipCode = Integer.parseInt(String.valueOf(resultSet.getInt("ZIP_CODE")));
		    	
		    }
		  
		  
		  } catch (Exception e) {			
				e.printStackTrace();
			} 

		  
		  
		  return zipCode;		  
	  }
 

	 
	 // GETTING city ZIP CODE FROM THE DATABASE ENDS HERE 

	 
	 //CODE FOR GETTING MAX reservation ID STARTS HERE
		
		public int getMaxReservationId()
		{
			int maxReservationId =0;
			
			ResultSet resultSet;
			
			try {
				createConnection();
				String query = "SELECT MAX(RES_ID) FROM reservation";
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next())
				{
					maxReservationId = resultSet.getInt(1);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			
			return maxReservationId;
		}
	
 	//CODE FOR GETTING MAX RESERVATION_ID ENDS HERE
	 
	// CODE FOR CREATING A ROW IN reservation TABLE START HERE	
		
		  public int reservingCar(ReservationBean reservationBean)
		  {
			  int result= 0;
			  

					  try {
							createConnection();
							String query = "INSERT INTO reservation (RES_ID, CATEGORY_ID, CUSTOMER_ID, STATUS, CAR_ID, CITY_ID, CUSTOMER_ADDRESS, TARRIF, REGISTRATION_NUMBER) VALUES (?,?,?,?,?,?,?,?,?)";
							PreparedStatement preparedStatement = connection.prepareStatement(query);
							preparedStatement.setInt(1, reservationBean.getReservationID());
							preparedStatement.setInt(2, reservationBean.getCategoryID());
							preparedStatement.setString(3, reservationBean.getCustomerID());
							preparedStatement.setInt(4, reservationBean.getStatus());
							preparedStatement.setInt(5, reservationBean.getCarID());
							preparedStatement.setInt(6, reservationBean.getCityID());
							preparedStatement.setString(7, reservationBean.getCustomerAddress());
							preparedStatement.setDouble(8, reservationBean.getTarrif());
							preparedStatement.setString(9, reservationBean.getRegistrationNUMBER());
							result = preparedStatement.executeUpdate();
										
							
						} catch (Exception e) {
							
							e.printStackTrace();
						}
			  
			  
			  return result;
		  }
		
		
	// CODE FOR CREATING A ROW IN reservation TABLE ENDS HERE
		  
		  
	// CODE FOR CREATING A ROW IN rental TABLE START HERE	
			
		  public int insertRental(RentalBean rentalBean)
		  {
			  int result= 0;
			  

					  try {
							createConnection();
							String query = "INSERT INTO rental (RENT_ID, CUSTOMER_ID, START_DT, END_DT, CAR_NAME, TARRIF, REGISTRATION_NUMBER) VALUES (?,?,?,?,?,?,?)";
							PreparedStatement preparedStatement = connection.prepareStatement(query);
							preparedStatement.setInt(1, rentalBean.getRentID());
							preparedStatement.setString(2, rentalBean.getCustomerID());
							preparedStatement.setString(3, rentalBean.getStartDt());
							preparedStatement.setString(4, rentalBean.getEndDt());
							preparedStatement.setString(5, rentalBean.getCarName());
							preparedStatement.setDouble(6, rentalBean.getTarrif());
							preparedStatement.setString(7, rentalBean.getRegitrationNUMBER());
							result = preparedStatement.executeUpdate();
										
							
						} catch (Exception e) {
							
							e.printStackTrace();
						}
			  
			  
			  return result;
		  }
		
		
	// CODE FOR CREATING A ROW IN rental TABLE ENDS HERE	  
		  
		  
		  
	//CODE FOR UPDATING THE STATUS OF car IN THE DATABASE AFTER BEING RESERVED STARTS HERE	  
	
		  public int updateCarStatus(int carId)
		  {
			  int result = 0;
			  
			  try {
				createConnection();
				String query = "UPDATE car SET RESERVATION_STATUS = ? WHERE CAR_ID = ?";
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, 2);
				preparedStatement.setInt(2, carId);
				result = preparedStatement.executeUpdate();
				
				
				
			} catch (Exception e) {		
				e.printStackTrace();
			} 
			 			  
			  return result;
		  }
		  
		  
    //CODE FOR UPDATING THE STATUS OF car IN THE DATABASE AFTER BEING RESERVED ENDS HERE	  
	 
	
    //CODE FOR TOTAL COUNT OF CARS STARTS HERE   
			
		  public int countCars()
		  {
			  int result =0;
			  ResultSet resultSet = null;
			  try {
				createConnection();
				String query = "SELECT COUNT(1) AS COUNT_CARS FROM car";
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				resultSet = preparedStatement.executeQuery();
				
				if(!resultSet.next())
				{
					result = 0;
				}
				else
				{
					result = resultSet.getInt("COUNT_CARS");
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}   
			  return result;
		  }
		  
		//CODE FOR TOTAL COUNT OF CARS ENDS HERE   	  
		  
		  
		  
		  
			  
	 //CODE FOR RETURNING THE geolocation

		public Connection createConnection() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
		String driverName="com.mysql.jdbc.Driver";
		Class.forName(driverName).newInstance();
		String serverName="localhost";
		String portNumber="3306";
		String sid="rentcars";
		String url="jdbc:mysql://"+serverName+":"+portNumber+"/"+sid;
		String username="root";
		String password="root";
		connection=DriverManager.getConnection(url, username, password);
		
		statement=connection.createStatement();
		return connection;
	}

	

}
