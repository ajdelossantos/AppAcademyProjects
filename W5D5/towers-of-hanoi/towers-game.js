const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output:process.stdout,
  terminal: false
});

class TowersPseudo {
    run () {
      // ask user what pile to move from and to
      // validate move
      // move disc if valid, else reprompt
      // check if game over
    }
}

class Towers {
  constructor () {
    this.stacks = [[3, 2, 1], [], []]
  }

  renderStacks () {
    console.log(`${this.stacks}`);
  }

  askMove () {
    reader.question ('Move disk from which stack? ', function (ans1) {
      const startTowerIdx = parseInt(ans1);
      reader.question ('And move disk to which stack? ', function (ans2) {
        const endTowerIdx = parseInt(ans2);
    });
  }

  promptMove () {
    this.renderStacks();

  }



}
