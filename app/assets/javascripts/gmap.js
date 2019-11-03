var map
var geocoder
var bounds
var marker = [];
var planData = gon.planData;
var planDestinationPosition = [];


function isPlanDataNull(array){
  let count = 0;
  array.forEach(function(value){
    if(value === "" || value === null) count++;
  });
  if(count === array.length) return true;
}

function initMap(){
  geocoder = new google.maps.Geocoder();
  //console.log(planDestinationPosition);
  map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 35.6954806, lng: 139.76325010000005},
  zoom: 12
  });

  if(!isPlanDataNull(planData)){
      map = new google.maps.Map(document.getElementById("map"));
      bounds = new google.maps.LatLngBounds();

      for(let i = 0 ; i < planData.length ; i++){
        console.log(planData[i])
        geocoder.geocode( { 'address': planData[i] }, function(results, status) {
          if (status == 'OK'){
            bounds.extend(results[0].geometry.location);
            map.fitBounds (bounds);

            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location,
                label: `${i + 1}`
            });
            //planDestinationPosition.push(results[0])

            var infowindow = new google.maps.InfoWindow({
              content: '<ul>'+ '<li>' + planData[i] + '</li>' + '<li>' + results[0].formatted_address + '</li>' + '</ul>'
            });

            marker.addListener('click', function() {
              infowindow.open(map, marker);
            });
          }
        });
    }
  }
}

function codeAddress(){
  // 入力を取得
  var inputAddress = document.getElementById('address').value;

  // geocodingしたあとmapを移動
  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
　　　　　　　　　　　　// map.setCenterで地図が移動
      map.setCenter(results[0].geometry.location);

　　　　　　　　　　　　// google.maps.MarkerでGoogleMap上の指定位置にマーカが立つ
      // var marker = new google.maps.Marker({
      //     map: map,
      //     position: results[0].geometry.location
      // });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }

    document.getElementById('address').value = '';
  });
}

function addMarker(){

  var inputAddress = document.getElementById('markerAddress').value;
  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK'){
　　　　　　　　　　　　// map.setCenterで地図が移動
      map.setCenter(results[0].geometry.location);
　　　　　　　　　　　　// google.maps.MarkerでGoogleMap上の指定位置にマーカが立つ
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });

      var infowindow = new google.maps.InfoWindow({
        content: '<ul>' + '<li>' + inputAddress + '</li>' + '<li>' + results[0].formatted_address + '</li>' + '</ul>'
      });

      marker.addListener('click', function() {
        infowindow.open(map, marker);
      });
    }else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });

  for(let i = 0; i < 10; i++){
    let id = 'plan_destinations_attributes_' + i + '_name';
    if(!document.getElementById(id).value){
      document.getElementById(id).value = inputAddress;
      break;
    }
  }
  document.getElementById('markerAddress').value = '';
}

window.onload = function(){
      initMap();
  };
