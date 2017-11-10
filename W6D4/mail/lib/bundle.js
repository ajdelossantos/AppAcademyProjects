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
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__router__ = __webpack_require__(1);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__inbox__ = __webpack_require__(2);
// console.log("It's working");




document.addEventListener("DOMContentLoaded", () => {
  // document.querySelector("ul.sidebar-nav").addEventListener("click", (event) =>{
  const hashLinker = (el) => {
    el.addEventListener("click", (event) =>{
      event.preventDefault();
      const newLocation = event.target.innerText;
      window.location.hash = newLocation.toLowerCase();
    });
  };

  document.querySelectorAll(".sidebar-nav li").forEach(hashLinker);

  const contentNode = new __WEBPACK_IMPORTED_MODULE_0__router__["a" /* default */](document.querySelector('.content'));
  contentNode.start();

});

const routes = {
  inbox: __WEBPACK_IMPORTED_MODULE_1__inbox__["a" /* default */]
};


/***/ }),
/* 1 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
class Router {
  constructor(node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start() {
    this.render();
    window.addEventListener("hashchange", (event) => {
      this.render();

    });

  }

  activeRoute() {
    // return window.location.hash.slice(1);
    return this.routes.slice(1);
  }

  render() {
    this.node.innerHTML = "";
    const route = this.activeRoute();
    const htmlRoute = document.createElement("p");
    htmlRoute.innerHTML = route;
    this.node.appendChild(htmlRoute);

    let component = this.activeRoute();
    this.node.innerHTML = "";
    if (component !== undefined) {
      const node = component.render();
    }

  }
}


/* harmony default export */ __webpack_exports__["a"] = (Router);


/***/ }),
/* 2 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
class Inbox {
  // constructor() {}

  render () {
    const ul = document.createElement('ul');
    ul.className = "Spam";
    ul.innerHTML = "Try this weird trick to make your...";
    return ul;
  }
}

/* harmony default export */ __webpack_exports__["a"] = (Inbox);


/***/ })
/******/ ]);