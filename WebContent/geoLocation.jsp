<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFYnfR0vUsGOD1JCDxXp7cc6Rf19WqqtE">
    </script>
    <script type="text/javascript">
        var map = null;
                        function showlocation() {
                           // One-shot position request.
                            navigator.geolocation.getCurrentPosition(callback);
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

                                //marker.setMap(map);
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
  </head>
  <body>

        
                <input type="button" value="Show my location on Map"
                        onclick="javascript:showlocation()" />   <br/>
       
                Latitude: <span id="latitude"></span><br/>
                Longitude: <span id="longitude"></span><br/>

        <br/><br/>
    <div id="map-canvas" style="width: 500px; height: 500px"/>
  </body>
</html>
