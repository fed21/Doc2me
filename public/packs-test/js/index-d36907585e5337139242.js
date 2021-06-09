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
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
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
/******/ 	__webpack_require__.p = "/packs-test/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/index.js":
/*!***************************************!*\
  !*** ./app/javascript/packs/index.js ***!
  \***************************************/
/*! no static exports found */
/***/ (function(module, exports) {

//setting zoom default
document.body.style.zoom = "105%"; //navbar effects

var navSlide = function navSlide() {
  var burger = document.querySelector('.burger');
  var nav = document.querySelector('.ul-nav');
  var navLinks = document.querySelectorAll('.ul-nav li');
  navLinks.forEach(function (li, index) {
    li.addEventListener('mouseenter', function (e) {
      li.style.textShadow = '2px 2px  5px #4e4e64';
    });
    li.addEventListener('mouseleave', function (e) {
      li.style.textShadow = 'none';
    });
  });
  burger.addEventListener('click', function () {
    nav.classList.toggle('nav-active');
    navLinks.forEach(function (link, index) {
      if (link.style.animation) {
        link.style.animation = '';
      } else {
        link.style.animation = 'navLinkFade 0.5s ease forwards ${index / 7+1.5}s';
      }
    });
    burger.classList.toggle('toggle');
  });
};

navSlide();
var card = document.querySelectorAll('.card');
var cardHome = document.querySelectorAll('.card-home');
var cardPedi = document.querySelectorAll('.pedi');
card.forEach(function (c, index) {
  c.addEventListener('mouseenter', function (e) {
    c.style.boxShadow = '5px 5px  5px #78dbb5';
  });
  c.addEventListener('mouseleave', function (e) {
    c.style.boxShadow = '5px 5px 4px #4e4e64';
  });
});
cardHome.forEach(function (ch, index) {
  ch.addEventListener('mouseenter', function (e) {
    ch.style.boxShadow = '5px 5px  5px #78dbb5';
  });
  ch.addEventListener('mouseleave', function (e) {
    ch.style.boxShadow = '5px 5px 4px #4e4e64';
  });
});
cardPedi.forEach(function (p, index) {
  p.addEventListener('mouseenter', function (e) {
    p.style.boxShadow = '5px 5px  5px #78dbb5';
  });
  p.addEventListener('mouseleave', function (e) {
    p.style.boxShadow = '5px 5px 4px #4e4e64';
  });
});

/***/ })

/******/ });
//# sourceMappingURL=index-d36907585e5337139242.js.map