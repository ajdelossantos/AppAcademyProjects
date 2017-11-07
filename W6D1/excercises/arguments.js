function sum1() {
  const temp = Array.from(arguments);
  let sum = 0;
  for (let i = 0; i < temp.length; i++) {
    sum += temp[i];
  }
  return sum;
}

function sumRest(...nums) {
  let sum = 0;
  nums.forEach(function(num) {
    sum += num;
  });
  return sum;
}



Function.prototype.myBind = function(ctx) {
  const bindArgs = Array.from(arguments).slice(1); // [ctx, 'meow', 'Kush']
  const that = this;
  console.log(arguments);

  return function () {
    const callArgs = Array.from(arguments);
    console.log(arguments);
    return that.apply(ctx, bindArgs.concat(callArgs));
  };
};

Function.prototype.myBind2 = function (ctx, ...bindArgs) { // (breakfast, ['meow', 'Kush'])()
  return (...callArgs) => {
    return this.apply(ctx, bindArgs.concat(callArgs)); // this is says();
  };
};

function curriedSum(numArgs) {
  const numbers = [];

  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return numbers.reduce((sum, val) => sum + val);
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}

Function.prototype.curry = function (numArgs) {
  //  returns a fct
  let args = [];
  const that = this;

  function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return that(...args);
    } else {
      return _curry;
    }
  }
  return _curry;
};
