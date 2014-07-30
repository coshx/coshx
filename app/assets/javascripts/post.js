var ready;
var switchTo5x;
ready = function(e) {
	$('[src*="sharethis.com"], [href*="sharethis.com"]').remove();
	window.stLight = undefined;

	switchTo5x = true;
	$.getScript("http://w.sharethis.com/button/buttons.js", function() {
		stLight.options({publisher: "0a696786-6141-4757-805b-011d597ab233", doNotHash: false, doNotCopy: false, hashAddressBar: false});
	});
}
//$(document).on("page:load",ready);
$(document).on("ready page:change",ready);