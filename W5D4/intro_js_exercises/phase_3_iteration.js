// Bubble Sort

Array.prototype.bubbleSort = function () {
  let sorted = false;

  while (!sorted) {
    sorted = true;

    for (let i = 0; i < this.length - 1; i++) {
      let j = i + 1;
      if( this[i] > this[j]) {
        sorted = false;
        let temp = this[i];
        this[i] = this[j];
        this[j] = temp;
      }
    }
  }
  return this;
};
