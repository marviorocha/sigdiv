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
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/libs/direct_uploads.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/libs/direct_uploads.js":
/*!*****************************************************!*\
  !*** ./app/javascript/packs/libs/direct_uploads.js ***!
  \*****************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

// direct_uploads.js
addEventListener("direct-upload:initialize", function (event) {
  var target = event.target,
      detail = event.detail;
  var id = detail.id,
      file = detail.file;
  target.insertAdjacentHTML("beforebegin", "\n      <div id=\"direct-upload-".concat(id, "\" class=\"direct-upload direct-upload--pending\">\n        <div id=\"direct-upload-progress-").concat(id, "\" class=\"direct-upload__progress\" style=\"width: 0%\"></div>\n        <span class=\"direct-upload__filename\"></span>\n      </div>\n    "));
  target.previousElementSibling.querySelector(".direct-upload__filename").textContent = file.name;
});
addEventListener("direct-upload:start", function (event) {
  var id = event.detail.id;
  var element = document.getElementById("direct-upload-".concat(id));
  element.classList.remove("direct-upload--pending");
});
addEventListener("direct-upload:progress", function (event) {
  var _event$detail = event.detail,
      id = _event$detail.id,
      progress = _event$detail.progress;
  var progressElement = document.getElementById("direct-upload-progress-".concat(id));
  progressElement.style.width = "".concat(progress, "%");
});
addEventListener("direct-upload:error", function (event) {
  event.preventDefault();
  var _event$detail2 = event.detail,
      id = _event$detail2.id,
      error = _event$detail2.error;
  var element = document.getElementById("direct-upload-".concat(id));
  element.classList.add("direct-upload--error");
  element.setAttribute("title", error);
});
addEventListener("direct-upload:end", function (event) {
  var id = event.detail.id;
  var element = document.getElementById("direct-upload-".concat(id));
  element.classList.add("direct-upload--complete");
});

/***/ })

/******/ });
//# sourceMappingURL=direct_uploads-9b5ac027f9d9e872bf27.js.map