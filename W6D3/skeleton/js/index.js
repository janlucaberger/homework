console.log("Hello from the JavaScript console!");
console.log("1", Date.now());
// Your AJAX request here
$.ajax({
	type: 'GET',
	url: 'http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b',
	success(data) {
		console.log("2", Date.now());
		console.log(`Today in ${data.name} the humidity is ${data.main.humidity}`);
	},
	error(data) {
		console.log("error");
	}
});
console.log("3", Date.now());
// Add another console log here, outside your AJAX request
