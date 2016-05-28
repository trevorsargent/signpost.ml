(function($) {
    $(function() {

        $('.button-collapse').sideNav();
        $('.parallax').parallax();

    }); // end of document ready

})(jQuery); // end of jQuery name space

var apiBase = "http://www.signpost.ml/api/"

function getPosts() {
    $.getJSON(apiBase + "posts",
        function(data) {
            // alert(data); 
            handlePosts(data);
        });
}

function getSigns(title) {
    $.getJSON(apiBase + "post/title/" + title + "/signs",
        function(data) {
            handleSigns(data);
        });

}
var map

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 45.5188479, lng: -122.6795271 },
        zoom: 15
    });


    // Try HTML5 geolocation.
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            map.setCenter(pos);

            getPosts();

        }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
        });
    } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, map.getCenter());
    }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
        'Error: The Geolocation service failed.' :
        'Error: Your browser doesn\'t support geolocation.');
}

function handlePosts(data) {
    var last;
    for (i = 0; i < data.length; i++) {

        var infowindow = new google.maps.InfoWindow({
            content: data[i].title
        });

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(data[i].lat, data[i].long),
            title: data[i].title,
            infowindow: infowindow,

        });

        google.maps.event.addListener(marker, 'mouseover', function() {
            this.infowindow.open(map, this);
        })

        google.maps.event.addListener(marker, 'mouseout', function() {
            this.infowindow.close();
        })

        marker.setMap(map);

        google.maps.event.addListener(marker, 'click', function() {
            $('#postListModal').find("h4").html(this.title);
            getSigns(this.title);
        });

    }
}

function handleSigns(data) {
    var modal = $('#postListModal');
    var mark = $("#insertBefore");

    modal.find(".collection").html('<span id="insertBefore"></span>')

    for (i = 0; i < data.length; i++) {
        $(makeHtml(data[i])).insertBefore("#insertBefore");
    }

    modal.openModal();
}

function makeHtml(sign){

	return "<li class=\"collection-item\"> \n <span class=\"title\">"
    +  sign.message
    + "</span> \n <a href=\"#!\" class=\"secondary-content\"><i class=\"material-icons\">grade</i></a></li>"


}
