function map_ian(){
 var map;
    var layer_0;
    var layer_1;
    function initialize() {
      map = new google.maps.Map(document.getElementById('map-canvas'), {
        center: new google.maps.LatLng(23.746730958843408, 120.6109398964643),
        zoom: 10
      });
      var style = [
        {
          featureType: 'all',
          elementType: 'all',
          stylers: [
            { saturation: -64 }
          ]
        }
      ];
      var styledMapType = new google.maps.StyledMapType(style, {
        map: map,
        name: 'Styled Map'
      });
      map.mapTypes.set('map-style', styledMapType);
      map.setMapTypeId('map-style');
      layer_0 = new google.maps.FusionTablesLayer({
        query: {
          select: "col7",
          from: "1_VaYR36Gkbc6rClW7iA1znwVfNVcwL0p179-yQkB"
        },
        map: map,
        styleId: 2,
        templateId: 2
      });
      layer_1 = new google.maps.FusionTablesLayer({
        query: {
          select: "col4",
          from: "1YsiwaClOqZWrqqdJT-L2GyekvPb-uVFo1SJINTEJ"
        },
        map: map,
        styleId: 2,
        templateId: 2
      });
    }
    google.maps.event.addDomListener(window, 'load', initialize);
}