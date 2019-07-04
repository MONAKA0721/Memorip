/*
mapを関数の外で定義(codeAddressでも使うため)
geocoderを用意
*/

let map
let geocoder
var marker = [];
var infoWindow = [];
var markerData = [ // マーカーを立てる場所名・緯度・経度
  {
       name: 'TAM 東京',
       lat: 35.6954806,
        lng: 139.76325010000005,
 }, {
        name: '小川町駅',
     lat: 35.6951212,
        lng: 139.76610649999998
 }, {
        name: '淡路町駅',
     lat: 35.69496,
      lng: 139.76746000000003
 }, {
        name: '御茶ノ水駅',
        lat: 35.6993529,
        lng: 139.76526949999993
 }, {
        name: '神保町駅',
     lat: 35.695932,
     lng: 139.75762699999996
 }, {
        name: '新御茶ノ水駅',
       lat: 35.696932,
     lng: 139.76543200000003
 }
];

function initMap(){
  // geocoderを初期化
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 35.6954806, lng: 139.76325010000005},
  zoom: 15
  });

  for (var i = 0; i < markerData.length; i++) {
        markerLatLng = new google.maps.LatLng({lat: markerData[i]['lat'], lng: markerData[i]['lng']}); // 緯度経度のデータ作成
        marker[i] = new google.maps.Marker({ // マーカーの追加
         position: markerLatLng, // マーカーを立てる位置を指定
            map: map // マーカーを立てる地図を指定
       });

     infoWindow[i] = new google.maps.InfoWindow({ // 吹き出しの追加
         content: '<div class="sample">' + markerData[i]['name'] + '</div>' // 吹き出しに表示する内容
       });

     markerEvent(i); // マーカーにクリックイベントを追加
 }
}

function markerEvent(i) {
    marker[i].addListener('click', function() { // マーカーをクリックしたとき
      infoWindow[i].open(map, marker[i]); // 吹き出しの表示
  });
}

function codeAddress(){
  // 入力を取得
  let inputAddress = document.getElementById('address').value;

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

  let inputAddress = document.getElementById('markerAddress').value;
  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
　　　　　　　　　　　　// map.setCenterで地図が移動
      map.setCenter(results[0].geometry.location);
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
