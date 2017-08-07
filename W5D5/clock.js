// class Clock {
//   constructor() {
//     this.date = new Date();
//     this.hour = this.date.getHours();
//     this.minute = this.date.getMinutes();
//     this.second = this.date.getSeconds();
//     setInterval( function(){
//       this.tick();
//     }.bind(this),1000);
//   }
//
//   render() {
//     console.log(this.hour)
//   }
//
//   printTime() {
//     console.log(`${this.hour}:${this.minute}:${this.second}`)
//   }
//
//   tick() {
//     // console.log("hello")
//     this.second += 1;
//     // debugger;
//     this.printTime();
//   }
// }

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function() {
   console.log("Turning on " + this.name);
}

const lamp = new Lamp();

// turnOn(); // should not work the way we want it to


Function.prototype.myBind = function(context){
  return () => {
    debugger
    this.apply(context);
  }
}


// const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);
myBoundTurnOn();
