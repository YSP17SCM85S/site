package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MySQLDataRentCars;

import bean.CarBean;
import bean.ReservationBean;

public class ReservationCarController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//Processing the Request of the from the index page starts here 
		
		HttpSession session = request.getSession();
		
		
		System.out.println("Hi I have reached over here !!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
	    String startDateFromJsp = request.getParameter("startDate");
	    String endDateFromJsp = request.getParameter("endDate");
	    String carDropFromJsp = request.getParameter("carDrop");
	    String locationFromJsp = request.getParameter("location");
	    String customerAddress = request.getParameter("customerAddress");
	    String carId = request.getParameter("carId");
	    
	    session.setAttribute("startDate", startDateFromJsp);
	    session.setAttribute("endDate", endDateFromJsp);
	    
	    System.out.println("Here is the car id "+carId);
	   		    
	    
	   //GENERATING STARTDATE AND ENDDATE CODE STARS HERE
			    
		Date startDate = null;
		Date endDate = null;
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		int difference = 0;
		
		try {
			startDate = format.parse(startDateFromJsp);
			endDate   = format.parse(endDateFromJsp);

		} catch (ParseException e) {		
			e.printStackTrace();
		}
		
		
		difference = datedifference(endDate, startDate);
		
		System.out.println(" Here I am the difference "+difference);
			
		//GENERATING STARTDATE AND ENDDATE CODE STARS HERE
	    		
	// Processing the request from the index page ends here
		
		
		
		
		// RESRERVATION STARTS HERE 
	
	
		PrintWriter out = response.getWriter();
		MySQLDataRentCars dataRentCars = new MySQLDataRentCars(); 
				
		String userNameSession = (String)session.getAttribute("userName");
		
		
		if(userNameSession == null)
		{
			
			out.println("Please Sign in into the System First");
	
			
		}
		else
		{
			out.println("1");
			CarBean carBean = new CarBean();
			carBean = dataRentCars.getCarById(Integer.parseInt(carId));
			
			//Calculating Tarrif starts here ***********
			
			double startingPrice = dataRentCars.getTarrif(carBean.getCarID());
			double totalTarrif   = difference * startingPrice;
			
			//Calculating Tarrif ends here   ********** 
			
			
			//Getting city zipCode from the database starts here ************* 
			
			int zipCode = dataRentCars.getCityZipCode(locationFromJsp);
			
			//Getting city zipCode from the database ends here   *************
			
			
			//Generating a unique and self-incrementing reservation id starts here 
			
			int maxReservationId = dataRentCars.getMaxReservationId();
			int reservationId = maxReservationId +1;
			
			
			//Generating a unique and self- incrementing reservation id ends here
			
			//Preparing data for the Reservation Class starts here 
			
			ReservationBean reservationBean = new ReservationBean();
			
			reservationBean.setReservationID(reservationId);
			reservationBean.setCarID(carBean.getCarID());
			reservationBean.setCategoryID(carBean.getCategoryID());
			reservationBean.setCityID(zipCode);
			reservationBean.setCustomerID(userNameSession);
			reservationBean.setStatus(1);
//			reservationBean.setCustomerAddress(customerAddress);
			reservationBean.setTarrif(totalTarrif);
			reservationBean.setRegistrationNUMBER(carBean.getRegistrationNUMBER());

			session.setAttribute("reservationSession", reservationBean);
			
			
		    System.out.println("The data has been set in the session for reservation");
			
			
		}
			
		
		// RESERVATION ENDS HERE 
		
	}
	
	int datedifference(Date orderDate, Date currentDate)
	{
		int difference = 0;
		
		difference = (int)((orderDate.getTime() - currentDate.getTime())/(1000*60*60*24));
		
		return difference;
	}

}
