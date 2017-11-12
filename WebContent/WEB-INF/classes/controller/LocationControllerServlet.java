package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.LocationBean;
import bean.UserBean;

import dao.MySQLDataRentCars;

public class LocationControllerServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String lonlat = "87.6,41.8";
	String[] arrayLonLat = lonlat.split(",");

	String longitude = request.getParameter("lon");
	String latitude = request.getParameter("lat");
	
	LocationBean locationBean = new LocationBean();
	HashMap<String,LocationBean> hlb = new HashMap<String, LocationBean>();
	MySQLDataRentCars utilities = new MySQLDataRentCars();
	hlb = utilities.getGeoLocation(longitude, latitude);
	
	Set set = hlb.entrySet();
	Iterator iterator = set.iterator();
	while(iterator.hasNext())
	{
		Map.Entry entry   = (Map.Entry)iterator.next();
		locationBean = (LocationBean)entry.getValue();
	}

	PrintWriter out = response.getWriter();
	out.println("ZIP CODE IS "+locationBean.getZipCode() ); 
	
	System.out.println(" ZIP CODE IS    "+locationBean.getZipCode());
	}


}
