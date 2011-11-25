var placemark;
var map = new YMaps.Map(document.getElementById("point-holder"));
map.enableScrollZoom();
map.addControl(new YMaps.Zoom());


function showAddress (value, date) {
    var geocoder = new YMaps.Geocoder(value, {results: 1, boundedBy: map.getBounds()});
    YMaps.Events.observe(geocoder, geocoder.Events.Load, function () {
        if (this.length()) {
            var geoResult = this.get(0);
            map.setBounds(geoResult.getBounds());

            placemark = new YMaps.Placemark(geoResult.getGeoPoint(), {draggable: false, hideIcon: false, style:"default#orangePoint"});
            map.addOverlay(placemark);
            placemark.setGeoPoint(geoResult.getGeoPoint());
            setBalloonInfo(placemark, geoResult.getGeoPoint(), geoResult.text, date);
            placemark.openBalloon();
        }else {
            alert("111111")
            }
    });
}

function setBalloonInfo (placemark, geoPoint, text, date) {
    var content = '';
    if (text) {
        content += '<div class="title232"> <b>Fitness-Class</b>' + text + '</div>';
    }
 
    placemark.setBalloonContent(content);
}
