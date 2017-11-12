package bean;

public class LocationBean {
	
	String longitude;
	String latitude;
	String zipCode;
	String city;
	String state;
	String country;
	public LocationBean(String longitude, String latitude, String zipCode,
		
		String city, String state, String country) {
		this.longitude = longitude;
		this.latitude = latitude;
		this.zipCode = zipCode;
		this.city = city;
		this.state = state;
		this.country = country;
	}
	public LocationBean() {
		 
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	
	

}
