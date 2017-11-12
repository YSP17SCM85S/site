package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import bean.CarBean;

public class AjaxUtility {
	
	// GETTING THE MATCHING CODE IN A STRINGBUFFER STARTS HERE 
	
		public StringBuffer streamData(String hint)
		{
			StringBuffer buffer = new StringBuffer();
			HashMap<String, ArrayList<CarBean>> hacpltn = new HashMap<String, ArrayList<CarBean>>();
			
			hacpltn = autoCompletion();
			
			for(Map.Entry<String, ArrayList<CarBean>> map : hacpltn.entrySet())
			{
				for(CarBean bean : map.getValue())
				{
					if(bean.getCarNAME().toLowerCase().startsWith(hint))
					{
						buffer.append("<product>");
						buffer.append("<id>"+bean.getCarID()+"</id>");
						buffer.append("<productName>"+bean.getCarNAME()+"</productName>");
						buffer.append("</product>");
					}
				}
			}
			
			
			
			return buffer;
		}
		
	
	
	// GETTING THE MATCHING CODE IN A STRINGBUFFER ENDS HERE 

	//CODE FOR AUTO COMPLETION STARTS HERE 
	
	public HashMap<String, ArrayList<CarBean>> autoCompletion()
	{
		HashMap<String, ArrayList<CarBean>> hacpltn = new HashMap<String, ArrayList<CarBean>>();
		ArrayList<CarBean> cars = new ArrayList<CarBean>();
		MySQLDataRentCars dataStoreUtilities =  new MySQLDataRentCars();
		ResultSet resultSet = null;
		
		try {
			dataStoreUtilities.createConnection();
			
			String query = "SELECT CAR_NAME, CAR_ID FROM CAR";
			PreparedStatement preparedstatement = dataStoreUtilities.connection.prepareStatement(query);
			resultSet = preparedstatement.executeQuery();
			
			while(resultSet.next())
			{
				CarBean carBean = new CarBean();
				carBean.setCarID(resultSet.getInt("CAR_ID"));
				carBean.setCarNAME(resultSet.getString("CAR_NAME"));
				
				cars.add(carBean);
			}
			
		} catch (Exception e) {		
			e.printStackTrace();
		} 		
		hacpltn.put("PRODUCTS", cars);				
		return hacpltn;
	}
		
	
	//CODE FOR AUTOCOMPLETION ENDS HERE 
	
}
