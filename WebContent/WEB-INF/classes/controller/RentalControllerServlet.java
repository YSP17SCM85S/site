package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MySQLDataRentCars;

import bean.CarBean;
import bean.RentalBean;
import bean.ReservationBean;

public class RentalControllerServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String billingAddress = request.getParameter("billingAddress");
		HttpSession session = request.getSession();
		MySQLDataRentCars dataRentCars = new MySQLDataRentCars();

		ReservationBean reservationBean = (ReservationBean)session.getAttribute("reservationSession");			
		reservationBean.setCustomerAddress(billingAddress);
		
		
		String startDate = (String) session.getAttribute("startDate");
		String endDate   = (String) session.getAttribute("endDate");
		
		
		int reservationResult = dataRentCars.reservingCar(reservationBean);
		
		if(reservationResult ==1 )
		{
			
			System.out.println("The Reservation was Successfull");
			
			int updateCarStatus = dataRentCars.updateCarStatus(reservationBean.getCarID());
			
			if(updateCarStatus ==1 )
			{
				System.out.println(" The Updation of the car was Successful");
				
			}
			
			// Preparing to write a row in the CAR RENTAL TABLE starts here 
			
			CarBean carBean = new CarBean();
			carBean = dataRentCars.getCarById(reservationBean.getCarID());
			
			
			RentalBean rentalBean = new RentalBean();
			
			rentalBean.setRentID(reservationBean.getReservationID());
			rentalBean.setCustomerID(reservationBean.getCustomerID());
			rentalBean.setStartDt(startDate);
			rentalBean.setEndDt(endDate);
			rentalBean.setCarName(carBean.getBrand()+" "+carBean.getCarNAME());
			rentalBean.setTarrif(reservationBean.getTarrif());
			rentalBean.setRegitrationNUMBER(reservationBean.getRegistrationNUMBER());
			
			int resultRental = dataRentCars.insertRental(rentalBean);
			
			session.setAttribute("showRent", rentalBean);
			
			if(resultRental != 0)
			{
				System.out.println("The data has been entered !!!!!!!");
				response.sendRedirect("reservationInformation.jsp");
			}
			else
			{
				System.out.println("The data has not been entered");				
			}
			
			
			
			
			// Preparing to write a row in the CAR RENTAL TABLE starts here
			
		}
		else
		{
			
			System.out.println(" The reservation could not be made");
		}

		
	
	
	}

}
