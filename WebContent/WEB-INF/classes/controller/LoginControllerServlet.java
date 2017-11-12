package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MySQLDataRentCars;

import bean.LoginBean;

public class LoginControllerServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	//Getting the elements from the HttpRequest	
	
	PrintWriter out = response.getWriter();	
		
	String eMail 	=  request.getParameter("eMail");
	String passWord =  request.getParameter("passWord");
	
	
	LoginBean loginBean = new LoginBean();
	loginBean.setUserNameEmail(eMail);
	loginBean.setPassWord(passWord);
	
	MySQLDataRentCars dataRentCars = new MySQLDataRentCars();
	HashMap<String, LoginBean> hlb = new HashMap<String, LoginBean>();
	
	
	
	
    int userExists = dataRentCars.userExists(loginBean.getUserNameEmail());

    if(userExists==1)
	{
	hlb = (HashMap)dataRentCars.userLogIn(loginBean.getUserNameEmail());	
	if( hlb.get(loginBean.getUserNameEmail()).getPassWord().equals(loginBean.getPassWord()))
		{
		HttpSession session = request.getSession();
		session.setAttribute("userName",loginBean.getUserNameEmail());
		out.println("User Logged in successfully");
		
		
		}
	
		else
		{
		out.println("Login Failed");
		}
	
	}
		
	else
	{
		out.println("The username  "+loginBean.getUserNameEmail()+"  does not exist");
		
	}
	
	
	
	
	}

}
