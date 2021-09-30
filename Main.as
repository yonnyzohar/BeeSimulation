package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Main extends MovieClip {
		var centerX: Number;
		var centerY: Number;
		var len: int = 100;
		var a: Array = [];

		public function Main() {
			centerX = stage.stageWidth / 2;
			centerY = stage.stageHeight / 2;


			for (var i: int = 0; i < len; i++) {
				var bee: Bob = new Bob();
				stage.addChild(bee);
				a[i] = bee;
				bee.xLen = (Math.random() * 100) + Math.random() * 50;
				bee.yLen = (Math.random() * 100) + Math.random() * 50;
				bee.xSpeed = 0.05;
				bee.ySPeed = 0.05;
				bee.xAngle = Math.PI * 2 * Math.random();
				bee.yAngle = Math.PI * 2 * Math.random();
			}



			stage.addEventListener(Event.ENTER_FRAME, update);
		}

		function update(e: Event): void {

			for (var i: int = 0; i < len; i++) {
				var bee: Bob = a[i];
				var cos: Number = Math.cos(bee.xAngle) * bee.xLen;
				var sin: Number = Math.sin(bee.yAngle) * bee.yLen;
				bee.rotation = bee.yAngle * 180 / Math.PI;
				bee.xAngle += bee.xSpeed;
				bee.yAngle += bee.ySPeed;
				bee.x = cos + centerX;
				bee.y = sin + centerY;
				centerX += (stage.mouseX - centerX) * 0.0001;
				centerY += (stage.mouseY - centerY) * 0.0001;

			}


		}

	}

}