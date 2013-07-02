/*jslint eqeqeq: true, undef: true */
/*global $, window, console, alert */

var BLC = BLC || {};

BLC.app = (function() {
	// PRIVATE VARIABLES

	// PRIVATE FUNCTIONS

	// PUBLIC METHODS
	return {
		init: function() {
			// DOM ready

			// open social links in a new window
			$(".social-links").find("ul").on("click", "a", function(e) {
				e.preventDefault();

				window.open($(this).attr("href"));
			});
		},
		pageInit: function() {
			// page load
		}
	};
}());

// ON DOM READY
$(function() {
	BLC.app.init();
});

// ON PAGE LOAD
$(window).load(function() {
	BLC.app.pageInit();
});