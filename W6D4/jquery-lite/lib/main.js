import DOMNodeCollection from './DOMNodeCollection';

window.DOMNodeCollection = DOMNodeCollection;

window.$l = function (selector) {
  if (typeof selector === "string") {
    let nodes = document.querySelectorAll(selector);
    let selArray = Array.from(nodes);
    return new DOMNodeCollection(selArray);

  } else if (selector instanceof HTMLElement) {
    return new DOMNodeCollection([selector]);

  }

};

const list = window.$l('li');
