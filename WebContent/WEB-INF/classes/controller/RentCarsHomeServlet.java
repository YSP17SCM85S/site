package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CarBean;

import dao.MySQLDataRentCars;

public class RentCarsHomeServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//GLOBAL VARIABLES DECLARATION HERE
		
		
		HttpSession session = request.getSession();
		MySQLDataRentCars dataRentCars = new MySQLDataRentCars();

		
		
	    //GLOBAL VARIABLES DECLARATION ENDS HERE 
		
		
		
		
		
		//Processing the query from the index page for the Advanced Filter Search starts here ***********
		
		
		String[] advancedFilterManufacturer = request.getParameterValues("manufacturer");
		String[] advancedFilterType         = request.getParameterValues("carType");
		
		
		//** The advanced Search query *************************
		
		String advQuery = "SELECT CAR_ID, CAR_NAME, CATEGORY_ID, BRAND, MODEL, PRODUCTION_YEAR, MILEAGE, COLOR, IMAGE_PATH, STARTING_PRICE FROM CAR WHERE RESERVATION_STATUS = 1";
		
		StringBuffer advancedQuery = new StringBuffer();
		
		advancedQuery.append(advQuery);
		
		//** The advanced Serach query *************************
		
		if((advancedFilterManufacturer != null) && (advancedFilterType != null))
		{
			advancedQuery.append(" AND BRAND IN (");
			for(int i =0; i<advancedFilterManufacturer.length ; i++ )
			{
				
				switch(Integer.parseInt(advancedFilterManufacturer[i]))
				{
				case 1:
					if(i == 0)
					{
					advancedQuery.append("'HONDA'");
					}
					else
					{
						advancedQuery.append(",'HONDA'");
					}
					break;
				
				case 2:
					if(i == 0)
					{
					advancedQuery.append("'AUDI'");
					}
					else
					{
						advancedQuery.append(",'AUDI'");
					}
					break;
				
				case 3:
					if(i == 0)
					{
					advancedQuery.append("'NISSAN'");
					}
					else
					{
						advancedQuery.append(",'NISSAN'");
					}
					break;

				case 4:
					if(i == 0)
					{
					advancedQuery.append("'HYUNDAI'");
					}
					else
					{
						advancedQuery.append(",'HYUNDAI'");
					}
					break;
					
				case 5:
					if(i == 0)
					{
					advancedQuery.append("'TOYOTA'");
					}
					else
					{
						advancedQuery.append(",'TOYOTA'");
					}
					break;
	
				case 6:
					if(i == 0)
					{
					advancedQuery.append("'MERCEDES'");
					}
					else
					{
						advancedQuery.append(",'MERCEDES'");
					}
					break;
				
				case 7:
					if(i == 0)
					{
					advancedQuery.append("'FORD'");
					}
					else
					{
						advancedQuery.append(",'FORD'");
					}
					break;
				
				case 8:
					if(i == 0)
					{
					advancedQuery.append("'CHEVROLET'");
					}
					else
					{
						advancedQuery.append(",'CHEVROLET'");
					}
					break;
	
				}
			}
			advancedQuery.append(" )");
						
			
			if(advancedFilterType != null)
			{
				
				advancedQuery.append(" AND CATEGORY_ID IN (");
				
				for(int j = 0; j<advancedFilterType.length ; j++)
				{
					switch(Integer.parseInt(advancedFilterType[j]))
					{
					case 1:
						if(j ==0)
						{
							advancedQuery.append("1");
						}
						else
						{
							advancedQuery.append(",1");							
						}
						break;
					
					case 2:
						if(j ==0)
						{
							advancedQuery.append("2");
						}
						else
						{
							advancedQuery.append(",2");
						}
						break;
					case 3:
						if(j ==0)
						{
							advancedQuery.append("3");
						}
						else
						{
							advancedQuery.append(",3");
						}
						break;
					
					}
															
				}
				
				advancedQuery.append(")");
				
			}

			  
			
		}

		
		if((advancedFilterManufacturer != null) && (advancedFilterType == null))
		{
			advancedQuery.append(" AND BRAND IN (");
			for(int i =0; i<advancedFilterManufacturer.length ; i++ )
			{
				
				switch(Integer.parseInt(advancedFilterManufacturer[i]))
				{
				case 1:
					if(i == 0)
					{
					advancedQuery.append("'HONDA'");
					}
					else
					{
						advancedQuery.append(",'HONDA'");
					}
					break;
				
				case 2:
					if(i == 0)
					{
					advancedQuery.append("'AUDI'");
					}
					else
					{
						advancedQuery.append(",'AUDI'");
					}
					break;
				
				case 3:
					if(i == 0)
					{
					advancedQuery.append("'NISSAN'");
					}
					else
					{
						advancedQuery.append(",'NISSAN'");
					}
					break;

				case 4:
					if(i == 0)
					{
					advancedQuery.append("'HYUNDAI'");
					}
					else
					{
						advancedQuery.append(",'HYUNDAI'");
					}
					break;
					
				case 5:
					if(i == 0)
					{
					advancedQuery.append("'TOYOTA'");
					}
					else
					{
						advancedQuery.append(",'TOYOTA'");
					}
					break;
	
				case 6:
					if(i == 0)
					{
					advancedQuery.append("'MERCEDES'");
					}
					else
					{
						advancedQuery.append(",'MERCEDES'");
					}
					break;
				
				case 7:
					if(i == 0)
					{
					advancedQuery.append("'FORD'");
					}
					else
					{
						advancedQuery.append(",'FORD'");
					}
					break;
				
				case 8:
					if(i == 0)
					{
					advancedQuery.append("'CHEVROLET'");
					}
					else
					{
						advancedQuery.append(",'CHEVROLET'");
					}
					break;
	
				}
			}
			advancedQuery.append(" )");
									  
			
		}

		
		
		
		if( (advancedFilterManufacturer == null) && (advancedFilterType != null))
		{
			
			advancedQuery.append(" AND CATEGORY_ID IN (");
			for(int i =0; i<advancedFilterType.length ; i++ )
			{
				switch (Integer.parseInt(advancedFilterType[i])) 
				{

				case 1:
					if(i ==0)
					{
						advancedQuery.append("1");
					}
					else
					{
						advancedQuery.append(",1");							
					}
					break;
				
				case 2:
					if(i ==0)
					{
						advancedQuery.append("2");
					}
					else
					{
						advancedQuery.append(",2");
					}
					break;
				case 3:
					if(i ==0)
					{
						advancedQuery.append("3");
					}
					else
					{
						advancedQuery.append(",3");
					}		
					break;
				
				}
			}
			
			advancedQuery.append(")");
		}
		
		
		//Processing the query from the index page for the Advanced Filter Search ends here ***********
		
		// Getting all the cars from the database *************
 		
		
				
		HashMap<String, ArrayList<CarBean>> filteredData = new HashMap<String, ArrayList<CarBean>>();

		filteredData = dataRentCars.getFilteredCars(advancedQuery);
				
		session.setAttribute("filteredCars", filteredData);
		response.sendRedirect("filteredCars1.jsp");
		
		
		
	
	}


}
