package bean;

public class LoginBean {
	
	private String userNameEmail;
	private String passWord;


	public LoginBean() {
	
	}
	
	public LoginBean(String userNameEmail, String passWord) {
		this.userNameEmail = userNameEmail;
		this.passWord = passWord;
	}
	public String getUserNameEmail() {
		return userNameEmail;
	}
	public void setUserNameEmail(String userNameEmail) {
		this.userNameEmail = userNameEmail;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
}
