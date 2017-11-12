package service;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import bean.CarBean;

public class SaxParser4RentCars extends DefaultHandler {
	
	//Chunk for the Cars
	public CarBean carBean;
	public List<CarBean> cars;
	public String carBeanXMLFileName;
	public String elementValueRead;
	
	
	
	
    public SaxParser4RentCars(String carXMLFilename) {
    this.carBeanXMLFileName = carXMLFilename;
	System.out.println(carXMLFilename);
    cars = new ArrayList<CarBean>();
    parseDocument();
  
    }    
    private void parseDocument() {
        SAXParserFactory factory = SAXParserFactory.newInstance();
        try {
            SAXParser parser = factory.newSAXParser();
            parser.parse(carBeanXMLFileName, this);
        } catch (ParserConfigurationException e) {
            System.out.println("ParserConfig error");
        } catch (SAXException e) {
            System.out.println("SAXException : xml not well formed");
        } catch (IOException e) {
            System.out.println("IO error");
        }
    }

  
    public void startElement(String str1, String str2, String elementName, Attributes attributes) throws SAXException {

        if (elementName.equalsIgnoreCase("car")) {
        	carBean = new CarBean();
        	carBean.setCarID(Integer.parseInt(attributes.getValue("carid")));
        	
        }
    }

    
    public void endElement(String str1, String str2, String element) throws SAXException {
 
        if (element.equals("car")) {
            cars.add(carBean);
            
	    return;
        }

        if (element.equalsIgnoreCase("carname")) {
            carBean.setCarNAME(elementValueRead);
	    return;
        }
        if (element.equalsIgnoreCase("categoryid")) {           
           carBean.setCategoryID(Integer.parseInt(elementValueRead));
	    return;
        }

        if(element.equalsIgnoreCase("brand")){
        	carBean.setBrand(elementValueRead);
	    return;
        }
        if(element.equalsIgnoreCase("model")){
        	carBean.setModel(elementValueRead);
	    return;
        }
        if (element.equalsIgnoreCase("productionyear")) {
            carBean.setProductionYEAR(Integer.parseInt(elementValueRead));
	    return;
        }
        if (element.equalsIgnoreCase("mileage")) {
        	carBean.setMileage(Integer.parseInt(elementValueRead));
	    return;
        }

        if(element.equalsIgnoreCase("color")){
        	carBean.setColor(elementValueRead);
	    return;
        }
        if(element.equalsIgnoreCase("imagepath")){
        	carBean.setImagePATH(elementValueRead);
	    return;
        }
        if (element.equalsIgnoreCase("startingprice")) {
        	carBean.setStartingPRICE(Double.parseDouble(elementValueRead));
	    return;
        }

        if(element.equalsIgnoreCase("reservationstatus")){
        	carBean.setReservationSTATUS(Integer.parseInt(elementValueRead));
	    return;
        }
        if(element.equalsIgnoreCase("registrationnumber")){
        	carBean.setRegistrationNUMBER(elementValueRead);
	    return;
        }

        
    }

   
    public void characters(char[] content, int begin, int end) throws SAXException {
        elementValueRead = new String(content, begin, end);
    }


}
