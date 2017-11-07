const Game = function () {
  this.DIM_X = 900;
  this.DIM_Y = 900;
  this.NUM_ASTEROIDS = 5;
};

Game.prototype.addAsteroids = function () {
  
};

Game.prototype.randomPosition = function () {
  return [this.DIM_X * Math.random(), this.DIM_Y * Math.random()];
};
