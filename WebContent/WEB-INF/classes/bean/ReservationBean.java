package bean;

public class ReservationBean {
	
	int reservationID;
	int categoryID;
	String customerID;
	int status;
	int carID;
	int cityID;
	String customerAddress;
	double tarrif;
	String registrationNUMBER;
	public String getRegistrationNUMBER() {
		return registrationNUMBER;
	}
	public void setRegistrationNUMBER(String registrationNUMBER) {
		this.registrationNUMBER = registrationNUMBER;
	}
	public int getReservationID() {
		return reservationID;
	}
	public void setReservationID(int reservationID) {
		this.reservationID = reservationID;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public String getCustomerID() {
		return customerID;
	}
	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getCarID() {
		return carID;
	}
	public void setCarID(int carID) {
		this.carID = carID;
	}
	public int getCityID() {
		return cityID;
	}
	public void setCityID(int cityID) {
		this.cityID = cityID;
	}
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	public double getTarrif() {
		return tarrif;
	}
	public void setTarrif(double tarrif) {
		this.tarrif = tarrif;
	}
		

}
