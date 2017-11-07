Function.prototype.inheritsSurrogate = function (ParentClass) {
  const Surrogate = function () {};
  Surrogate.prototype = ParentClass.prototype;

  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

Function.prototype.inherits = function (ParentClass) {
  this.prototype = Object.create(ParentClass.prototype);
  this.prototype.constructor = this;
};

function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);

const m = new MovingObject;
const s = new Ship;
const a = new Asteroid;

MovingObject.prototype.move = function () { console.log('moved');};
Ship.prototype.laser = function () { console.log('pew pew');};
