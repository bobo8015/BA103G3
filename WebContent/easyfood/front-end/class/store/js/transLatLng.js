var content;
//window.onload = init; 
$(document).ready(function(){
    trans();
    init();
    console.log("----");
});


function init() {
	
	content = $("#county").val() + $("#city").val() + $("#addr").val();
    delayedLoop();
	
    document.getElementById("county").onfocusout = trans;
    document.getElementById("city").onfocusout = trans;
    document.getElementById("addr").onfocusout = trans;
    console.log("1111");
}

function trans() {
    content = $("#county").val() + $("#city").val() + $("#addr").val();
    delayedLoop();
    console.log("12222");
}

function delayedLoop() {
    addressToLatLng(content);
    
    console.log("13333");
}

function addressToLatLng(addr) {
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({"address": addr}, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var lat = $("#lat").val();
            var lng = $("#lng").val();
            $("#lat").val(results[0].geometry.location.lat());
            $("#lng").val(results[0].geometry.location.lng());
        } 
    });
    console.log("444");
}

