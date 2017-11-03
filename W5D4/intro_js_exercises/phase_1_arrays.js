// Uniq
Array.prototype.uniq = function () {
  const result = [];

  this.forEach(function(el) {
    if (!result.includes(el)) {
      result.push(el);
    }
  });

  return result;
};

Array.prototype.twoSum = function () {
  const result = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        result.push([i, j]);
      }
    }
  }

  return result;
};


Array.prototype.twoSum2 = function() {
  let pairs = [];
  const indexHash = {};

  this.forEach((el, idx) => {
    if (indexHash[el * -1]) {
      const newPairs = indexHash[el * -1].map((prevIdx) => [prevIdx, idx]);

      // remember, concat doesn't mutate the original object
      pairs = pairs.concat(newPairs);
    }

    // since we can't set a default attribute value in JavaScript,
    // we will need to check for existence first
    indexHash[el] ? indexHash[el].push(idx) : indexHash[el] = [idx];
  });

  return pairs;
};



Array.prototype.transpose = function() {
  const result = [];
  let times = this[0].length;
  for (let i = 0; i < times; i++){
    result.push([]);
  }
  this.forEach((el, idx) => {
    el.forEach((innerEl, innerIdx) => {
      result[innerIdx][idx] = innerEl;
    });

  });

  return result;
};
