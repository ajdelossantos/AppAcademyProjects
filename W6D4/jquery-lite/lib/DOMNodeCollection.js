class DOMNodeCollection {
  constructor(arrHTMLElements) {
    this.arrHTMLElements = arrHTMLElements;
  }
}

export default DOMNodeCollection;

DOMNodeCollection.prototype.html = function(arg) {
  switch (arg) {
    case arg:
    this.arrHTMLElements.forEach(el => {
      el.innerHTML = arg;
    });
    break;

    default:
    return this.arrHTMLElements[0].innerHTML;
  }
};

DOMNodeCollection.prototype.empty = function () {
  this.arrHTMLElements.forEach(el => {
    el.innerHTML = "";
  });
};

DOMNodeCollection.prototype.append = function (...args) {
  args.forEach(arg => {
    this.arrHTMLElements.forEach(el => {
      el.innerHTML = el.innerHTML.concat(arg);
    });
  });
};

DOMNodeCollection.prototype.attr = function(cssField, value){
  //getting
  if (value === undefined) {
    return this.arrHTMLElements[0].attributes[cssField].value;

  } else {
  //setting
  console.log("coming soon!");
  this.arrHTMLElements[0][cssField] = value;
  }
};

DOMNodeCollection.prototype.addClass = function(className) {
  this.arrHTMLElements.forEach( el => {
    el.classList.add(className);
  });
  return className;
};

DOMNodeCollection.prototype.removeClass = function(className) {
  this.arrHTMLElements.forEach( el => {
    el.classList.remove(className);
  });
  return className;
};
