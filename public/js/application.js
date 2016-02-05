$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $.ajax({
    dataType: 'text',
    url: '/coordinates/show',
  }).done(function(data){
    geojson = $.parseJSON(data),
    map.featureLayer.setGeoJSON(geojson)
  }).fail();
});


mapboxgl.accessToken = 'pk.eyJ1IjoiYmVybmljZWNodWEiLCJhIjoiY2lrOHZsODJnMDByNnYwa3Byejd4azdwdyJ9.ULosBQzbIJtQg88gDsQExA';
var map = L.mapbox.map('map', 'map-div').setView([45.52086, -122.679523], 14)

