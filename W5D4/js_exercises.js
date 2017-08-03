const madLib = (verb, adj, noun) => {
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`)
}

// madLib("make","best", "guac")


const isSubstring = (str, sub_str) => {
  console.log(str.includes(sub_str))
}


// isSubstring("time to program", "time")


const fizzBuzz = (arr) => {
  fizzy = []
  for (var i = 0; i < arr.length; i++) {
    debugger;
    if (arr[i] % 3 == 0 && arr[i] % 5 == 0) {
      continue;
    } else if (arr[i] % 3 == 0 || arr[i] % 5 == 0) {
      fizzy.push(arr[i]);
    }
  }
  console.log(fizzy)
}

// fizzBuzz([10,23,5,2,3,9,27,30,35,60,90,92,91])

const isPrime = (num) => {
  i = 2;
  while (i < num) {
    if (num % i == 0) {
      return false
    }
    i++;
  }
  return true;
}

// console.log(isPrime(2))
// console.log("Should return true")
// console.log("________")
//
// console.log(isPrime(10))
// console.log("Should return false")
// console.log("________")
//
// console.log(isPrime(15485863))
// console.log("Should return true")
// console.log("________")
//
// console.log(isPrime(3548563))
// console.log("Should return false")
// console.log("________")


const firstNPrimes = (num) => {
  primes = [];
  i = 1;
  while (primes.length < num) {
    i += 1;
    console.log(`value of i is : ${i}`)
    if (isPrime(i)) {
      primes.push(i);
    }
  }
  return primes;
}

const sumOfNPrimes = (num) => {
  prime_arr = firstNPrimes(num);
  console.log(prime_arr)
  return prime_arr.reduce( (sum, val) => {
      return sum + val;
  }, 0)

}

// console.log(firstNPrimes(4))

// console.log(sumOfNPrimes(4))


const titleize = (names, cb) => {
  let titleized = names.map((name) => `Mx. ${name} Jingleheimer Schmidt`)
  cb(titleized)
}


// titleize(["jane", "john", "bob"], (names) => {
//   names.forEach( (name) => console.log(name) )
// })



class Elephant {
  constructor(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
  }

   trumpet(){
     console.log(`${this.name} goes phrRRRRRRRRR`);
   };

   grow() {
     this.height += 12;
   };

   addTrick(trick) {
     this.tricks.push(trick);
     console.log(this.tricks);
   };

   play() {
     debugger;
     let trick = this.tricks[Math.floor(Math.random()*this.tricks.length)]
     console.log(trick);
   };



}

// Elephant.prototype.

let e = new Elephant("george", 200, ["trick"])

// console.log(e.name)
