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
    <meta name="google-signin-client_id" content="1043632766849-jmpg5bdbdlp05npgj3b3b75sjai9dif9.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
     <script>
     
     function geoLocation(){
    	 window.open("geoLocation.jsp");
     };
     
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
                 if(xml.responseText == "Created User")
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
       src="https://maps.googleapis.com/maps/api/js?key= AIzaSyBDTTnoPDqOcVKU-6tBn_uueJ8mvVG1O7Y&callback=initMap sensor=false">
     </script>
     <script type="text/javascript">
     	var map = null;
     	var xhr = new XMLHttprequest();
 			function showlocation() {
 			   // One-shot position request.
 			    navigator.geolocation.getCurrentPosition(callback);
 			   
 			   var lonlat = document.getElementById('geo-location').value;
 		        
 			   xml.onreadystatechange = function()
 		        {
 		          if(xml.readyState==4 && xml.status==200)
 		            {
 		            }
 		        };
 			   	
 			   	xhr.open("GET","./LocationControllerServlet?lonlat="+lonlat,true);
 		        xhr.send();
	
 			}
     	
       function callback(position) {
       	
       	var lat = position.coords.latitude;
       	var lon = position.coords.longitude;
       	
       	var lonlat = join(',',lon,lat);
       	
 	 		 document.getElementById('geo-location').value = lonlat;
 	     	 
            	
       	var latLong = new google.maps.LatLng(lat, lon);
       	
 				var marker = new google.maps.Marker({
 				    position: latLong
 				});      
 				
 				marker.setMap(map);
       	map.setZoom(8);
       	map.setCenter(marker.getPosition());
 
     	
       }
       
       google.maps.event.addDomListener(window, 'load', initMap);
       function initMap() {
         var mapOptions = {
           center: new google.maps.LatLng(0, 0),
           zoom: 1,
           mapTypeId: google.maps.MapTypeId.ROADMAP
         };
         map = new google.maps.Map(document.getElementById("map-canvas"), 
                                           mapOptions);
       
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

<body  >

	 
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
          <form accept-charset="utf-8" action="#" class="simform">
            <div class="sminputs">
              <div class="input full">
                <label class="string optional" for="user-name">Email*</label>
                <input class="string optional" maxlength="255" id="user-email" name="eMail" placeholder="Email" type="email" size="50" />
              </div>
            </div>
            <div class="sminputs">
              <div class="input full">
                <label class="string optional" for="user-pw">Password *</label>
                <input class="string optional" maxlength="255" id="user-pw" name="passWord" placeholder="Password" type="password" size="50" />
                						<span class="hide-password">Show</span>
              </div>
            </div>
            <div class="simform__actions">
              <input type="sumbit" class="sumbit" name="commit" value="Log In" />
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
								<li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li>								
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
							</ul>
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
						<select class="form-control">
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
					<input placeholder="Start Date" class="textbox-n form-control" type="text" onfocus="(this.type='date')" " id="date"/>
					</td>
					<td align="center">
					<input placeholder="End Date" class="textbox-n form-control" type="text" onfocus="(this.type='date')" " id="date"/>
					</td>
					<td>
					<input type="text" id="geo-location" class="form-control" placeholder="choose your location" />
					</td>
					<td><button style="height:35px" class="glyphicon glyphicon-map-marker" onclick="geoLocation()">     </button></td>
					<td > 
					
					<input type="Button" value="Search"  />
					</td>
					
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
					<div class="left-sidebar">
						<h2>Company</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
											
											Honda
										</a>
										<span class="pull-right"><input type="checkbox" /></span>
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
										</span><span class="pull-right"><input type="checkbox" /></span>
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
										</span><span class="pull-right"><input type="checkbox" /></span>
									</h4>
								</div>
								<div id="womens" class="panel-collapse collapse">
									<div class="panel-body">
										
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Fiat</a>
									<span class="pull-right"><input type="checkbox" /></span>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Hyundai</a>
									<span class="pull-right"><input type="checkbox" /></span>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Toyota</a>
									<span class="pull-right"><input type="checkbox" /></span>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Mercedes</a>
									<span class="pull-right"><input type="checkbox" /></span>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Ford</a>
									<span class="pull-right"><input type="checkbox" /></span>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Chevrolet</a>
									<span class="pull-right"><input type="checkbox" /></span>
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
							<h2>Number of seats</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="#">1 seat   <span class="pull-right"><input type="checkbox" /></span></a> </li> 
									<li><a href="#"> 2 seats  <span class="pull-right"><input type="checkbox" /></span></a> </li>
									<li><a href="#"> 3 seats  <span class="pull-right"><input type="checkbox" /></span></a> </li>
									<li><a href="#">4 seats  <span class="pull-right"><input type="checkbox" /></span></a> </li>
									
								</ul>
							</div>
						</div><!--/brands_products-->
						
						<div class="price-range"><!--price-range-->
							<h2>Price Range</h2>
							<div class="well text-center">
								 <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
								 <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
							</div>
						</div><!--/price-range-->
						
						<div ><!--shipping-->
							<h2> Driver Required </h2>
							<select class="form-control">
							<option>
							Yes
							</option>
							<option>
							No
							</option>
							</select>
						</div><!--/shipping-->
					
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Featured Cars</h2>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="images/home/product1.jpg" width="200" height="270" alt="" />
											<h2>$56</h2>
											<p>Honda Civic</p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Book now</a>
										</div>
										<div class="product-overlay">
											<div class="overlay-content">
												<h2>$56</h2>
												<p>Honda Civic</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Book now</a>
											</div>
										</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										
									</ul>
								</div>
							</div>
						</div>
						
						
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/home/product4.jpg" width="200" height="270" alt="" />
										<h2>$49</h2>
										<p>Chevrolet</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Book now</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2>$49</h2>
											<p>Chevrolet</p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Book now</a>
										</div>
									</div>
									<img src="images/home/new.png" class="new" alt="" />
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										
									</ul>
								</div>
							</div>
						</div>
						
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/home/product3.jpg" width="200" height="270" alt="" />
										<h2>$52</h2>
										<p>Honda Accord</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Book now</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2>$52</h2>
											<p>Honda Accord</p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Book now</a>
										</div>
									</div>
									<img src="images/home/new.png" class="new" alt="" />
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										
									</ul>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/home/product2.jpg" width="200" height="270" alt="" />
										<h2>$49</h2>
										<p> Honda Avancier </p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Book now</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2>$49</h2>
											<p>Honda Avancier</p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Book now</a>
										</div>
									</div>
									<img src="images/home/new.png" class="new" alt="" />
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										
									</ul>
								</div>
							</div>
						</div>
						
					</div><!--features_items-->
					
					
					
					<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">recommended items</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/product4.jpg" alt="" />
													<h2>$49</h2>
													<p>Chevrolet</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Book now</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/product3.jpg" alt="" />
													<h2>$52</h2>
													<p>Honda Accord </p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Book now</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/product2.jpg" alt="" />
													<h2>$49</h2>
													<p>Honda Avancier</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Book now</a>
												</div>
												
											</div>
										</div>
									</div>
								</div>
								<div class="item">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/product1.jpg" alt="" />
													<h2>$56</h2>
													<p>Honda Civic</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Book now</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/product6.jpg" alt="" />
													<h2>$76</h2>
													<p>Audi</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Book now</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/product5.jpg" alt="" />
													<h2>$40</h2>
													<p>Hyundai</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Book now</a>
												</div>
												
											</div>
										</div>
									</div>
								</div>
							</div>
							 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
								<i class="fa fa-angle-left"></i>
							  </a>
							  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
								<i class="fa fa-angle-right"></i>
							  </a>			
						</div>
					</div><!--/recommended_items-->
					
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
	
		
	
	
</body>
</html>