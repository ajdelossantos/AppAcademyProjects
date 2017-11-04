// add numbers
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output:process.stdout,
  terminal: false
});

function addNumbers(sum, numsLeft, completionCallback) {

  if (numsLeft > 0) {
    reader.question("May I have your, I mean, a number? ", function (num) {
      sum += parseInt(num);
      numsLeft--;
      console.log(`Current Sum: ${sum}`);
      addNumbers(sum, numsLeft, completionCallback);
    });
  } else {
    completionCallback(sum);
    reader.close();
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
