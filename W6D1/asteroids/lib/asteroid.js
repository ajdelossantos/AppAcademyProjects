const util = require ('./utils.js');
const mo = require ('./moving_object.js');

util.inherits(Asteroid, mo);

const Asteroid = function (pos) {
  this.COLOR = 'brown';
  this.RADIUS = 30;
  this.pos = pos;
  this.vel = util.randomVec();

  mo.call(this, {
    pos: this.pos,
    vel: this.vel,
    radius: this.RADIUS,
    color: this.color
  });
};
