package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean;

import dao.MySQLDataRentCars;

public class UserControllerServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	MySQLDataRentCars storeUtilities = new MySQLDataRentCars(); 
	HashMap<String, UserBean> hmb = new HashMap<String, UserBean>();
	HttpSession session = request.getSession();
	PrintWriter out = response.getWriter();
	int result = 0;
	
	//Getting the Request Parameters
	String userName = request.getParameter("eMail");
	String passWord = request.getParameter("passWord");
	
	System.out.println("  here is the username before entering ::::"+userName);
	
	UserBean userBean = new UserBean();
	userBean.setUserName(userName);
	userBean.setPassWord(passWord);
	
	hmb.put("USERS", userBean);

	result = storeUtilities.userExists(userName);
	if(result == 1 )
	{
		out.println("User already Exists");
	}
	else
	{
		int resultSetaddUser = storeUtilities.addUser(hmb);
		session.setAttribute("resultSetaddUser", resultSetaddUser);
		session.setAttribute("userName", userName);
		if(resultSetaddUser != 0)
		{
			out.println("User Created");
		}
		else
		{
			out.println("User not Created");
		
		}
		
	}	
	
	
	
	
	
	
	
	
	}

}
