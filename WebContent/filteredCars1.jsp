<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.ServletContext"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="dao.MySQLDataRentCars"%>
<%@ page import="controller.LoginControllerServlet "%>
<%@ page import="bean.CarBean"%>
<%@ page import="service.SaxParser4RentCars"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="google-signin-scope" content="profile email">
    <script src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>

<script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>

    <meta name="google-signin-client_id" content="1043632766849-jmpg5bdbdlp05npgj3b3b75sjai9dif9.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    
<script type="text/javascript" language="javascript" >
function init()
{
	completeField = document.getElementById("searchId");
	completeTable = document.getElementById("complete-table");
	autoRow       = document.getElementById("auto-row");
}
var xml = new XMLHttpRequest();
function doCompletion()
{
	
	var url = "./AutoCompletion?action=complete&searchId="+searchId.value;
	//req = initRequest();
	xml.open("GET", url, true);
	xml.send();
	xml.onreadystatechange = callback1;
}

function initRequest()
{
	if(window.XMLHttpRequest)
		{
		if(navigator.userAgent.indexOf('MSIE') != -1)
			{
				isIE = true;
			}
		return new XMLHttpRequest();
		}
	else if(window.ActiveXObject)
		{
			isIE = true;
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
}	

function appendProduct(productName, productId)
{
	var row;
	var col;
	var linkElement;

	completeTable.style.display = 'table';
	row  = document.createElement("tr");
	row.style.width = "70px";
	cell = document.createElement("td");
	row.appendChild(cell);
	completeTable.appendChild(row);
	
	cell.className = "popupCell";
	linkElement = document.createElement("a");
	linkElement.className = "popupItem";
	
	linkElement.setAttribute("href", "viewCarController.jsp?id="+productId);
	linkElement.appendChild(document.createTextNode(productName));
	linkElement.style.color = "white";	
	cell.appendChild(linkElement);
}

function parseMessage(responseXML)
{
	//no matches returned
	if(responseXML == null)
		{
		return false;		
		}
	else{
		var products = responseXML.getElementsByTagName("products")[0];
		if(products.childNodes.length > 0 )
			{
			completeTable.setAttribute("bordercolor", "black");
			completeTable.setAttribute("border", "1");
		
			for(loop =0; loop < products.childNodes.length; loop++)
				{
				var product    = products.childNodes[loop];
				var productName = product.getElementsByTagName("productName")[0];
				var productId   = product.getElementsByTagName("id")[0];
				appendProduct(productName.childNodes[0].nodeValue, productId.childNodes[0].nodeValue);
				}
			}
	}
}
function callback1()
{
	clearTable();
	if(xml.readyState == 4)
		{
		if(xml.status == 200)
			{
			 parseMessage(xml.responseXML);
			}
		}
}

function clearTable()
{
	if(completeTable.getElementsByTagName("tr").length > 0)
		{
		completeTable.style.display = 'none';
		for( loop = completeTable.childNodes.length -1; loop >= 0; loop --  )
			{
			completeTable.removeChild(completeTable.childNodes[loop]);
			}
		}
}

</script>
    
    
    
    
    <script>
    
  
    
    
    function checker()
    {
    	
    	var choice=document.getElementById("choice").value;
    	var startdate=document.getElementById("startdate").value;
    	var enddate=document.getElementById("enddate").value;
    	var location=document.getElementById("geo-location").value;
    	if(choice=="Door Car Drop")
    		{
    		alert("please select Yes or No from Door Car Drop");
    		return false;
    		}
    	else if(startdate=="")
    		{
    		alert("Please select start date first");
    		return false;
    		}
    	else if(enddate=="")
		{
		alert("Please select end date first");
		return false;
		
		}
    	else if(location=="")
		{
		alert("Please chose your location first");
		return false;
		}
    	else
    		{
    		booking();
    		}
 		   	
    }
    
    </script>


	<script>

    var xmp = new XMLHttpRequest();
    function booking()
    {
     var startDate = document.getElementById("startdate").value;
     var endDate   = document.getElementById("enddate").value;
     var carDrop   = document.getElementById("choice").value;
     var location  = document.getElementById("geo-location").value;
     var carId     = document.getElementById("carId").value;
     	xmp.onreadystatechange = function()
        {
            if(xmp.readyState==4 && xmp.status==200)
            {
               if(xmp.responseText.trim() === "1")
              	 {
              	 
          		  alert("Please carry on with your car booking");
          		  window.location.href = "reservation.jsp";
              	 }
               else
              	 {
              	 alert(xmp.responseText); 
              	 }
            
			 }
            };
        
			xmp.open("GET","./ReservationCarController?startDate="+startDate+"&endDate="+endDate+"&carDrop="+carDrop+"&carId="+carId+"&location="+location, true);
            xmp.send();
    }

    </script>
 
    <script>
    
    
    
    var xmr = new XMLHttpRequest();
    function login()
    {
     var username = document.getElementById("user-emailL").value;
     var passWord = document.getElementById("user-pwL").value;   
     	xmr.onreadystatechange = function()
        {
            if(xmr.readyState==4 && xmr.status==200)
            {
               if(xmr.responseText == "User Logged in successfully")
              	 {
              	 
          		  alert(xmr.responseText);
          		  document.location.href("index.jsp");
              	 }
               else
              	 {
              	 alert(xmr.responseText); 
              	 }
            
			 }
            };
        
			xmr.open("GET","./LoginControllerServlet?eMail="+username+"&passWord="+passWord,true);
            xmr.send();
    }
    

    </script>



     <script>





        
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("Email: " + profile.getEmail());
        var email=profile.getEmail();

        // The ID token you need to pass to your backend:
        //var id_token = googleUser.getAuthResponse().id_token;
        //console.log("ID Token: " + id_token);
        
      };
      function signOut() {
    	    var auth2 = gapi.auth2.getAuthInstance();
    	    auth2.signOut().then(function () {
    	      console.log('User signed out.');
    	    });
    	    var revokeAllScopes=function()
    	    {
    	    	auth2.disconnect();
    	    }
    	  }
      
    
      var xml = new XMLHttpRequest();
      function go1()
      {
       var username = document.getElementById("user-email").value;
       var passWord = document.getElementById("user-pw").value;   
          xml.onreadystatechange = function()
          {
              if(xml.readyState==4 && xml.status==200)
              {
                 if(xml.responseText == "User Created")
                	 {
                	 
            	  alert(xml.responseText);
            	  window.location.href("index.jsp");
                	 }
                 else
                	 {
                	 alert(xml.responseText); 
                	 }
              
 			 }
              };
          

          
           xml.open("GET","./UserControllerServlet?eMail="+username+"&passWord="+passWord,true);
           xml.send();
      }
    </script>
 <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFYnfR0vUsGOD1JCDxXp7cc6Rf19WqqtE">
    </script>
    <script type="text/javascript">
        var map=null;

                        function showlocation() {
                        	 
                           // One-shot position request.
                            navigator.geolocation.getCurrentPosition(callback);

                            document.getElementById("geo-location").value="Chicago";













                        }
                        
                        

      function callback(position) {

        var lat = position.coords.latitude;
        var lon = position.coords.longitude;



                         document.getElementById('latitude').innerHTML = lat;
             document.getElementById('longitude').innerHTML = lon;



        var latLong = new google.maps.LatLng(lat, lon);

        

                                var marker = new google.maps.Marker({
                                    position: latLong



                                });
                               // $('#myModal2').on('show.bs.modal', function() {
                                //	 google.maps.event.trigger(map, "resize");
                                 //	});
                                //$("#myModal2").on('shown', function () {
                                 //   ResizeMap();
                                //});
                                var bootstrapModal = $('#myModal2').modal.noConflict();
                                       $('#myModal2').bootstrapMdl = bootstrapModal;
        							map.setZoom(8);
        //map.setCenter(marker.getPosition());




      }

      google.maps.event.addDomListener(window, 'load', initMap);
      function initMap() {
        var mapOptions = {
          center: new google.maps.LatLng(41.8346890, -87.6269050),
          zoom: 1,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
        map.setZoom(9);

        var locations = [
          ['IIT', 41.834689, -87.6269050, 1],
          ['O-Hare', 41.974163, -87.9073210, 2]
        ];

        var markers = [];
        for (var i = 0; i < locations.length; i++) {
          var location = locations[i];
          var latLng = new google.maps.LatLng(location[1], location[2]);
          var _marker = new google.maps.Marker({
            position: latLng
          });
          //markers.push(_marker);
          _marker.setMap(map);
        }
       









       

        //var markerCluster = new MarkerClusterer(map, markers);

      }

    </script>


    <title>Car Rental</title>
	

      
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

      <link rel="stylesheet" href="css/style1.css">
	  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

      <script src="js/index.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap-flex.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap-grid.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap-reboot.css" rel="stylesheet">
	<link href="bootstrap1/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->


<body  onload="init()">

	 
<div class="container">

 
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="logmod" >
  <div class="logmod__wrapper">
     <button type="button" class="close" data-dismiss="modal">&times</button>
    <div class="logmod__container" >
      <ul class="logmod__tabs">
                
        <li data-tabtar="lgm-2"><a href="#">Login</a></li>
        <li data-tabtar="lgm-1"><a href="#">Sign Up</a></li>        
      </ul>
      <div class="logmod__tab-wrapper">
      <div class="logmod__tab lgm-1">
        <div class="logmod__heading">
          <span class="logmod__heading-subtitle">Enter your personal details <strong>to create an acount</strong></span>
        </div>
        <div class="logmod__form">
          <form accept-charset="utf-8" action="Javascript:go1()" class="simform" >
            <div class="sminputs">
              <div class="input full">
                <label class="string optional" for="user-name">Email*</label>
                <input class="string optional" maxlength="255" id="user-email" name="eMail" placeholder="Email" type="email" size="50" />
              </div>
            </div>
            <div class="sminputs">
              <div class="input string optional">
                <label class="string optional" for="user-pw">Password *</label>
                <input type="password" class="string optional" maxlength="255" id="user-pw" name="passWord" placeholder="Password" type="text" size="50" />
              </div>
              <div class="input string optional">
                <label class="string optional" for="user-pw-repeat">Repeat password *</label>
                <input type="password" class="string optional" maxlength="255" id="user-pw-repeat"  placeholder="Repeat password" type="text" size="50" />
              </div>
            </div>
            <div class="simform__actions">
              <input type="submit" class="sumbit" name="commit" value="Create Account"  />
             
              <span class="simform__actions-sidetext">By creating an account you agree to our <a class="special" href="#" target="_blank" role="link">Terms & Privacy</a></span>
            </div> 
            
            
            
 
          </form>
        </div> 
        <div class="logmod__alter">
          <div class="logmod__alter-container">
            
           
          </div>
        </div>
      </div>
      <div class="logmod__tab lgm-2">
        <div class="logmod__heading">
          <span class="logmod__heading-subtitle">Enter your email and password <strong>to sign in</strong></span>
        </div> 
        <div class="logmod__form">
          <form accept-charset="utf-8" action="Javascript:login()" class="simform">
            <div class="sminputs">
              <div class="input full">
                <label class="string optional" for="user-name" >Email*</label>
                <input class="string optional" maxlength="255" id="user-emailL" name="eMailLogin" placeholder="Email" type="email" size="50" />
              </div>
            </div>
            <div class="sminputs">
              <div class="input full">
                <label class="string optional" for="user-pw">Password *</label>
                <input class="string optional" maxlength="255" id="user-pwL" name="passWordLogin" placeholder="Password" type="password" size="50" />
                						<span class="hide-password">Show</span>
              </div>
            </div>
            <div class="simform__actions">
              <button type="sumbit" class="sumbit" name="commit" value="Log In" >Log In</button>
              <span class="simform__actions-sidetext"><a class="special" role="link" href="#">Forgot your password?<br>Click here</a></span>
            </div> 
          </form>
        </div> 
        <div class="logmod__alter">
          <div class="logmod__alter-container">
            
               <div  class="g-signin2" data-width="600" data-height="50" data-longtitle="true" data-onsuccess="onSignIn" data-theme="dark"></div>
              
          </div>
        </div>
          </div>
      </div>
    </div>
  </div>
</div>
</div>
      
    </div>
  </div>
  
</div>

	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#">CAR RENTAL</a></li>
								<li><a href="#"> </a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="index.html"><img src="images/home/logoo.png" alt="" height="130" width="130" /></a>
						</div>
						<div class="btn-group pull-right">
							<div class="btn-group">
							
								
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								 <li><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Login</button></li>
								<li><a href="#"><i class="fa fa-star"></i> Wishlist</a></li>						

								<li><a href="index.jsp" onclick="signOut();">Sign Out</a></li>								
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.html" class="active">Home</a></li>
								<li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="shop.html">Cars</a></li>
										<li><a href="product-details.html">Car Details </a></li> 
										<li><a href="checkout.html">Checkout</a></li> 
										
										<li><a href="login.html">Login</a></li> 
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="#"></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="blog.html"></a></li>
										<li><a href="blog-single.html"></a></li>
                                    </ul>
                                </li> 
								
								<li><a href="contact-us.html">Contact</a></li>
								<li>   </li>
								<li>   </li>
								<li>   </li>
								<li> <div class="col-sm-12"></div>  </li>
								<li>  <div class="col-sm-12"></div> </li>
								<li>  
								<div class="col-sm-12"></div>
								
								   </li>
								<li>
								
								<center><div class="form-group col-sm-12" name="autofillform" align="right">
        <input type="text" class="form-control col-lg-12 "  name="searchId" value="" class="input" id="searchId" onkeyup="doCompletion()"  placeholder="search here ..." style="width:160px; padding:5px; font-size: 16px"/>
        <br/>
       <br/>
        <div id="auto-row" align="right" width="600 px" style="color:#ffffff;" >
        <table id="complete-table" class="gridtable " style=" width:600 px; position:absolute; background:#55B9EB; color:#ffffff ;"></table>
        </div>
        </div></center>
								
								</li>				</ul>
						</div>
					</div>
					<br>
					<br>
					
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
	<h2><center>Manage Your Trip</center></h2>
					<div class="search-header " style="background-color:#55B9EB">
					           
						<form  >
						<table cellpadding="5" style="width: 100%" >
						<tr>
						
						
						
						</tr>
						<tr>
						<td>
						<select class="form-control" id="choice" name="carDrop">
						<option default>Door Car Drop</option>
						<option>
						YES
						</option>
						<option>
						NO
						</option>
						</select>
						</td>
						<td align="center">
					<input placeholder="Start Date" class="textbox-n form-control" type="text" name="startDate" id="startdate" onfocus="(this.type='date')" />
					</td>
					<td align="center">
					<input placeholder="End Date" class="textbox-n form-control" type="text" id="enddate" name="endDate" onfocus="(this.type='date')"  />
					</td>
					<td>
					<input type="text" id="geo-location" name="location" class="form-control"  placeholder="choose your location" />





					</td>
					<td><button style="height:35px" class="glyphicon glyphicon-map-marker" data-toggle="modal"  data-target="#myModal2">     </button></td>
		
					
					</tr>
						</table>
							</form>
						
					</div>
					<br/>
					<br/>
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								
								<div class="col-sm-12">
									<img src="images/home/rentcar2.jpg" class="girl img-responsive" alt="" />
									
								</div>
							</div>
							<div class="item">
								
								<div class="col-sm-12">
									<img src="images/home/rentcar1.jpg" class="girl img-responsive" alt="" />
									
								</div>
							</div>
							
							<div class="item">
								
								<div class="col-sm-12">
									<img src="images/home/rentcar3.jpg" class="girl img-responsive" alt="" />
									
								</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
				<form action="RentCarsHomeServlet">
					<div class="left-sidebar">
						<h2>Company</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
											
											Honda
										</a>
										<span class="pull-right"><input type="checkbox" name="manufacturer" value="1"/></span>
									</h4>
								</div>
								<div id="sportswear" class="panel-collapse collapse">
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#mens">
											
											Audi
										</a>
										</span><span class="pull-right"><input type="checkbox" name="manufacturer" value="2" /></span>
									</h4>
								</div>
								<div id="mens" class="panel-collapse collapse">
									<div class="panel-body">
										
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#womens">
											
											Nissan
										</a>
										</span><span class="pull-right"><input type="checkbox" name="manufacturer" value="3" /></span>
									</h4>
								</div>
								<div id="womens" class="panel-collapse collapse">
									<div class="panel-body">
										
									</div>
								</div>
							</div>
					
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Hyundai</a>
									<span class="pull-right"><input type="checkbox" name="manufacturer" value="4" /></span>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Toyota</a>
									<span class="pull-right"><input type="checkbox" name="manufacturer" value="5" /></span>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Mercedes</a>
									<span class="pull-right"><input type="checkbox" name="manufacturer" value="6"/></span>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Ford</a>
									<span class="pull-right"><input type="checkbox" name="manufacturer" value="7" /></span>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Chevrolet</a>
									<span class="pull-right"><input type="checkbox" name="manufacturer" value="8" /></span>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#"></a></h4>
								</div>
							</div>
						</div><!--/category-products-->
					
						<div class="brands_products"><!--brands_products-->
							<h2>CAR TYPE</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
								
									<li><a href="#"> SEDAN <span class="pull-right"><input type="checkbox" name="carType" value="1" /></span></a> </li>
									<li><a href="#"> SUV  <span class="pull-right"><input type="checkbox" name="carType" value="2"/></span></a> </li>
									<li><a href="#"> SPORTS CAR  <span class="pull-right"><input type="checkbox" name="carType" value="3" /></span></a> </li>
									
								</ul>
							</div>
						</div><!--/brands_products-->
						
						<div class="price-range"><!--price-range-->
							<h2>Price Range</h2>
							<div class="well text-center">
								 <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="300" data-slider-step="5" data-slider-value="[0,60]" id="sl2" ><br />
								 <b class="pull-left">$ 0</b> <b class="pull-right">$ 300</b>
							</div>
						</div><!--/price-range-->
						
						
							<button class="btn btn-warning btn-lg"  type="submit" value="Search">Search</button>
							
						
					</div>
					</form>
				</div>
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Featured Cars</h2>
				<%
				
				// CODE FOR THE SAX PARSER STARTS HERE 
				
			ServletContext sc = request.getServletContext();
			String Filename= sc.getRealPath("WEB-INF/XMLFiles/ProductCatalog.xml");
			SaxParser4RentCars dealRetail = new SaxParser4RentCars(Filename);
					
					//** CODE TO ADD THE CARS TO DATABASE STARTS HERE

			HashMap<String, ArrayList<CarBean>> hcb1 = new HashMap<String, ArrayList<CarBean>>();
			int resultLap = 0;
			int countProducts = 0;
			ArrayList<CarBean> carBeans =  new ArrayList<CarBean>();
			for( CarBean carBean : dealRetail.cars)
			{
				CarBean bean = new CarBean();
				bean.setCarID(carBean.getCarID());
				bean.setCarNAME(carBean.getCarNAME());
				bean.setCategoryID(carBean.getCategoryID());
				bean.setBrand(carBean.getBrand());				
				bean.setModel(carBean.getModel());
				bean.setProductionYEAR(carBean.getProductionYEAR());
				bean.setMileage(carBean.getMileage());
				bean.setColor(carBean.getColor());
				bean.setImagePATH(carBean.getImagePATH());
				bean.setStartingPRICE(carBean.getStartingPRICE());
				bean.setReservationSTATUS(carBean.getReservationSTATUS());
				bean.setRegistrationNUMBER(carBean.getRegistrationNUMBER());
				carBeans.add(bean);
			}
			hcb1.put("PRODUCTS", carBeans);
			
			MySQLDataRentCars dataStoreUtilities = new MySQLDataRentCars();
			countProducts = dataStoreUtilities.countCars();
			if(countProducts == 0)
			{
				resultLap = dataStoreUtilities.addProducts(hcb1);
						if(resultLap != 0)
						{
							System.out.println("The cars has been dumped into the Database  : Yesss !!!!!");
						}
						else
						{
							System.out.println("The cars has not been dumped into the Database  : No !!!!!");
						}
			}
				

					//**CODE TO ADD THE CARS TO DATABASE ENDS HERE
				
				// CODE FOR THE SAX PARSER ENDS HERE
				
				//CODE FOR FETCHING THE CARS FROM THE DATABASE STARS HERE
				
				HashMap<String, ArrayList<CarBean>> filteredCars =  new HashMap<String, ArrayList<CarBean>>();
				
				filteredCars = (HashMap)session.getAttribute("filteredCars");
				
				MySQLDataRentCars dataRentCars = new MySQLDataRentCars();
				
				for(Map.Entry<String, ArrayList<CarBean>> map : filteredCars.entrySet())
				{
					for(CarBean bean : map.getValue())
					{
						
			//			session.setAttribute("reservation",bean);
						
						%>
						<div class="col-sm-4">
						<div class="product-image-wrapper">
							<div class="single-products">
									<div class="productinfo text-center">
										<img src=<%=bean.getImagePATH()%> width="200" height="270" alt="" />
										<h2>Starting At $<%=bean.getStartingPRICE() %></h2>
										<p><%=bean.getCarNAME() %></p>
										<input type="hidden" name="carId" id="carId" value=<%=bean.getCarID()%>></input>									
										<a href="#" class="btn btn-default add-to-cart" onclick="checker()"><i class="fa fa-shopping-cart"></i>Book now</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2>Starting At $<%=bean.getStartingPRICE() %></h2>
											<p><%=bean.getCarNAME() %></p>
											<a href="#" class="btn btn-default add-to-cart" onclick="checker()"><i class="fa fa-shopping-cart"></i>Book now</a>
										</div>
									</div>
							</div>
							<div class="choose">
								<ul class="nav nav-pills nav-justified">
									
								</ul>
							</div>
						</div>
					</div>
					
					<%
					
						
					}
														
				}
				
				
				%>
	
						
								</div>
						
					</div><!--features_items-->
					
					
					
					
					
				</div>
			</div>
		</div>
	</section>
	
	<footer id="footer"><!--Footer-->
		
		
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Service</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Online Help</a></li>
								<li><a href="#">Contact Us</a></li>
								<li><a href="#">Order Status</a></li>
								<li><a href="#">Change Location</a></li>
								<li><a href="#">FAQ’s</a></li>
							</ul>
						</div>
					</div>
					
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Policies</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Terms of Use</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Refund Policy</a></li>
								<li><a href="#">Billing System</a></li>
								<li><a href="#">Ticket System</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>About Shopper</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Company Information</a></li>
								<li><a href="#">Careers</a></li>
								<li><a href="#">Store Location</a></li>
								<li><a href="#">Affillate Program</a></li>
								<li><a href="#">Copyright</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>About Customer</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Your email address" />
								<button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
								<p>Get the most recent updates from <br />our site and be updated your self...</p>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					
					
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	

  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>

	<div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
   
        <input type="button" value="Show my location on Map"
                        onclick="javascript:showlocation()" />   <br/>
       
                Latitude: <span id="latitude"></span><br/>
                Longitude: <span id="longitude"></span><br/>

                  <div id="map-canvas" style="width: 500px; height: 500px"/>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
  
		
	
	
</body>
</html>