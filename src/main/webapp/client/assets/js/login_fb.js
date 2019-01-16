var contextUrl;
var fbUser = "fb_user";

(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id))
		return;
	js = d.createElement(s);
	js.id = id;
	js.src = 'https://connect.facebook.net/vi_VN/sdk.js';
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

window.fbAsyncInit = function() {
	FB.init({
		appId : '1915386325151905',
		cookie : true,
		xfbml : true,
		version : 'v3.2'
	});

	FB.AppEvents.logPageView();

	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});

};

function checkLoginState() {
	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});
}

function statusChangeCallback(response, event) {
	if (response.status === "connected") {
		$.ajax({
			type : "POST",
			url : "facebook/login",
			data : {
				"access_token" : response.authResponse.accessToken,
			},
			success : function(res) {
				if (res.status === "success") {
					window.location.href = contextUrl;
				}
			}
		});
	}
}

function getCookie(cname) {
	var name = cname + "=";
	var decodedCookie = decodeURIComponent(document.cookie);
	var ca = decodedCookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') {
			c = c.substring(1);
		}
		if (c.indexOf(name) == 0) {
			return c.substring(name.length, c.length);
		}
	}
	return "";
}

function setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
	var expires = "expires=" + d.toUTCString();
	document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function deleteCookie(cname) {
	document.cookie = cname + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;path=/';
}

function handleSessionResponse(response) {
	if (!response.session) {
		deleteCookie(fbUser);
		window.location.href = contextUrl + "security_logout";
		return;
	}
}

$("#logout").click(function() {
	FB.getLoginStatus(function(response) {
		if (response.status === "connected") {
			FB.logout(handleSessionResponse);
		} else {
			window.location.href = contextUrl + "security_logout";
		}
	});
});

$(document).ready(function() {
	contextUrl = $("#contextUrl").val();
});