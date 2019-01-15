$(document).ready(function() {
	var contextUrl = $("#contextUrl").val();
	tomtom.setProductInfo('Fenglish', 'Maps API');
	tomtom.L.map('map', {
		key : 'XdapoooqlcVYGWjDjDttS508DcgtaNcg',
		source : 'vector',
		basePath : contextUrl + 'client/assets/sdk'
	});
	tomtom.centerOn(
	        Locations.AMSTERDAM_LOCATION.getLatitude(),
	        Locations.AMSTERDAM_LOCATION.getLongitude(),
	        DEFAULT_ZOOM_LEVEL,
	        MapConstants.ORIENTATION_NORTH);
});