//plz halp

Array.prototype.myEach = function (cb) {
  for (let i = 0; i < this.length; i++) {
    cb(this[i]);
  }
};

const callback = function callback(el) {
  return el+1;
};

Array.prototype.myMap = function (cb) {
  const result = [];

  this.myEach(el => result.push(cb(el)));

  return result;
};

const accumCallback = function(acc, el) {
  return acc + el;
};

Array.prototype.myReduce = function (cb, initialValue) {
  let arr = this;
  let accum = initialValue;
  if (!initialValue) {
    arr = arr.slice(1);
    accum = this[0];
  }

  arr.myEach((el) => accum + cb(accum, el));

  return accum;
};
