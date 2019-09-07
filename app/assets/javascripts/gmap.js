/*
mapを関数の外で定義(codeAddressでも使うため)
geocoderを用意
*/

var map
var geocoder
var marker = [];
var infoWindow = [];
var markerData = gon.Data;
var markerName = gon.markerName;
var planData = gon.planData;
var planDestinationPosition = [];
function initMap(){
  // geocoderを初期化

  console.log(gon.planData);
  //console.log(markerName)
  //console.log(markerData[0]);
  //onsole.log(markerData[0]['lat']);
  geocoder = new google.maps.Geocoder();
  if(planData){
      for(var i = 0 ; i < planData.length ; i++){
        geocoder.geocode( { 'address': planData[i] }, function(results, status) {
          if (status == 'OK'){
            console.log(results[0])
            planDestinationPosition.push(results[0])
          }
        });
    }
  }
  console.log(planDestinationPosition);

  map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 35.6954806, lng: 139.76325010000005},
  zoom: 15
  });
  console.log(markerData[0]['lat']);
  if(markerName){
    for(var i = 0 ; i < markerName.length ; i++){
      geocoder.geocode( { 'address': markerName[i] }, function(results, status) {
        if (status == 'OK'){
    　　　 // google.maps.MarkerでGoogleMap上の指定位置にマーカが立つ
          new google.maps.Marker({
              map: map,
              position: results[0].geometry.location
          });
        } else {
          alert('Geocode was not successful for the following reason: ' + status);
        }
      });
    }
  }
  if(planData){
      for(var i = 0 ; i < planData.length ; i++){
        geocoder.geocode( { 'address': planData[i] }, function(results, status) {
          if (status == 'OK'){
      　　　 // google.maps.MarkerでGoogleMap上の指定位置にマーカが立つ
            new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
          }
        });
    }
  }

  // for (var i = 0; i < markerData.length; i++) {
  //       markerLatLng = new google.maps.LatLng({lat: markerData[i]['lat'], lng: markerData[i]['lng']}); // 緯度経度のデータ作成
  //       marker[i] = new google.maps.Marker({ // マーカーの追加
  //        position: markerLatLng, // マーカーを立てる位置を指定
  //           map: map // マーカーを立てる地図を指定
  //      });
  //
  //    infoWindow[i] = new google.maps.InfoWindow({ // 吹き出しの追加
  //        content: '<div class="sample">' + markerData[i]['name'] + '</div>' // 吹き出しに表示する内容
  //      });
  //
  //    markerEvent(i); // マーカーにクリックイベントを追加
  // }
}

function markerEvent(i) {
    marker[i].addListener('click', function() { // マーカーをクリックしたとき
      infoWindow[i].open(map, marker[i]); // 吹き出しの表示
  });
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
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}

function addMarker(){

  var inputAddress = document.getElementById('markerAddress').value;
  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
　　　　　　　　　　　　// map.setCenterで地図が移動
      map.setCenter(results[0].geometry.location);
　　　　　　　　　　　　// google.maps.MarkerでGoogleMap上の指定位置にマーカが立つ
      new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
      document.getElementById('markerList').innerHTML = inputAddress ;
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}


window.onload = function(){
      initMap();
  };
