document.addEventListener("DOMContentLoaded", function () {
	const canvas = document.getElementById('mycanvas');
	const ctx = canvas.getContext('2d');

	// ctx.fillStyle = 'rgb(200,0,0)';
	// ctx.fillRect(0, 0, 500, 50);
	// ctx.beginPath();
	// ctx.arc(240, 200, 50, 0, 2 * Math.PI);
	// ctx.strokeStyle = "#FF0000";
	// ctx.lineWidth = 300
	// ctx.stroke()
	// ctx.fillStyle = "blue"
	// ctx.fill();
	// ctx.shadowColor = 'black';
	// ctx.shadowOffsetY = 10;
	// ctx.shadowOffsetX = 10;
	let j = 255;
	let x = 0;

	const times = Math.random() * (5 - 2) + 2;
	// setInterval(() => {
	// 	for (var i = 0; i < 1; i++) {
	// 		const num1 = Math.random() * (600 - 300) + 300;
	// 		const num2 = Math.random() * (600 - 300) + 300;
	// 		const num3 = Math.random() * (300 - 20) + 20;
	// 		ctx.beginPath();
	// 		ctx.arc(num1, num2, num3, 0, 2 * Math.PI);
	// 		ctx.strokeStyle = `rgba(0,${j}, ${x},1)`
	// 		// ctx.strokeStyle = "rgb(255), 0, 0)"
	// 		// ctx.strokeStyle = "red";
	// 		ctx.lineWidth = 10;
	// 		ctx.stroke();
	// 		j -= 10;
	// 		x += 10;
	// 		if (j < 0) {
	// 			j = 255;
	// 		}
	// 		if (x > 255) {
	// 			x = 0;
	// 		}
	// 	}
	// }, 50)

	setInterval(() => {
		for (var i = 0; i < 1; i++) {
			const num1 = Math.random() * (600 - 300) + 300;
			const num2 = Math.random() * (600 - 300) + 300;
			const num3 = Math.random() * (3000 - 20) + 20;
			const num5 = Math.random() * (3000 - 20) + 20;
			const num4 = Math.random() * (50 - 1) + 1;
			ctx.beginPath();
			ctx.bezierCurveTo(num3, num5, num4, num2, num5, num5);
			ctx.strokeStyle = `rgb(0,${j}, ${x})`
			// ctx.strokeStyle = "rgb(255), 0, 0)"
			// ctx.strokeStyle = "red";
			ctx.lineWidth = num4;
			ctx.stroke();
			j -= 10;
			x += 10;
			if (j < 0) {
				j = 255
			}
			if (x > 255) {
				x = 0
			}
			// ctx.stroke()
		}
	}, 100)

});
