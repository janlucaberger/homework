// window.setTimeout(() => console.log("Hammertime"), 5000);

const hammerTime = (time) => {
  window.setTimeout( () => {
    alert(`${time} is hammertime`);
  }, time);
}


const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function teaAndBiscuits (callback) {
  let first, second;

  reader.question('Would you like some tea?', (res1) => {
    reader.question('Would you like some biscuits?', (res2) => {
      first = res1;
      second = res2;
      console.log(`You replied ${res1}.`);
      console.log(`You replied ${res2}.`);
      callback(res1, res2)
    });
  });

}

teaAndBiscuits( (reply1, reply2) => {
  const firstRes = (reply1 === 'yes') ? 'do' : 'don\'t';
  const secondRes = (reply2 === 'yes') ? 'do' : 'don\'t';
  console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
  reader.close();
})


function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();

// Noodles.chase.call(Markov, Noodles)
// Noodles.chase.apply(Markov, [Noodles])
