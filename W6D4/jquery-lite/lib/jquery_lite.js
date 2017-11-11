/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__DOMNodeCollection__ = __webpack_require__(1);


window.DOMNodeCollection = __WEBPACK_IMPORTED_MODULE_0__DOMNodeCollection__["a" /* default */];

window.$l = function (selector) {
  if (typeof selector === "string") {
    let nodes = document.querySelectorAll(selector);
    let selArray = Array.from(nodes);
    return new __WEBPACK_IMPORTED_MODULE_0__DOMNodeCollection__["a" /* default */](selArray);

  } else if (selector instanceof HTMLElement) {
    return new __WEBPACK_IMPORTED_MODULE_0__DOMNodeCollection__["a" /* default */]([selector]);

  }

};

const list = window.$l('li');


/***/ }),
/* 1 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
class DOMNodeCollection {
  constructor(arrHTMLElements) {
    this.arrHTMLElements = arrHTMLElements;
  }
}

/* harmony default export */ __webpack_exports__["a"] = (DOMNodeCollection);

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


/***/ })
/******/ ]);