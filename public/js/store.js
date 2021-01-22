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
/******/ 	__webpack_require__.p = "/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 1);
/******/ })
/************************************************************************/
/******/ ({

/***/ "./resources/js/store.js":
/*!*******************************!*\
  !*** ./resources/js/store.js ***!
  \*******************************/
/*! no static exports found */
/***/ (function(module, exports) {

var shoppingCart = function () {
  cart = [];
  items = [];
  list = [];
  updateList();

  function Item(name, price, count) {
    this.name = name;
    this.price = price;
    this.count = count;
  }

  function saveCart() {
    sessionStorage.setItem('shoppingCart', JSON.stringify(cart));
  }

  function loadCart() {
    cart = JSON.parse(sessionStorage.getItem('shoppingCart'));
  }

  if (sessionStorage.getItem("shoppingCart") != null) {
    loadCart();
  }

  var obj = {};

  obj.addItemToCart = function (name, price, count) {
    for (var item in cart) {
      if (cart[item].name === name) {
        cart[item].count++;
        saveCart();
        return;
      }
    }

    var item = new Item(name, price, count);
    cart.push(item);
    saveCart();
  };

  obj.setCountForItem = function (name, count) {
    for (var i in cart) {
      if (cart[i].name === name) {
        cart[i].count = count;
        break;
      }
    }
  };

  obj.removeItemFromCart = function (name) {
    for (var item in cart) {
      if (cart[item].name === name) {
        cart[item].count--;

        if (cart[item].count === 0) {
          cart.splice(item, 1);
        }

        break;
      }
    }

    saveCart();
  };

  obj.removeItemFromCartAll = function (name) {
    for (var item in cart) {
      if (cart[item].name === name) {
        cart.splice(item, 1);
        break;
      }
    }

    saveCart();
  };

  obj.clearCart = function () {
    cart = [];
    saveCart();
  };

  obj.totalCount = function () {
    var totalCount = 0;

    for (var item in cart) {
      totalCount += cart[item].count;
    }

    return totalCount;
  };

  obj.totalCart = function () {
    var totalCart = 0;

    for (var item in cart) {
      totalCart += cart[item].price * cart[item].count;
    }

    return Number(totalCart.toFixed(2));
  };

  obj.listCart = function () {
    var cartCopy = [];

    for (i in cart) {
      item = cart[i];
      itemCopy = {};

      for (p in item) {
        itemCopy[p] = item[p];
      }

      itemCopy.total = Number(item.price * item.count).toFixed(2);
      cartCopy.push(itemCopy);
    }

    return cartCopy;
  };

  return obj;
}();

$('.clear-cart').click(function () {
  shoppingCart.clearCart();
  displayCart();
});

function updateList() {
  $('.add-to-cart').click(function (event) {
    event.preventDefault();
    var name = $(this).data('name');
    var price = Number($(this).data('price'));
    shoppingCart.addItemToCart(name, price, 1);
    displayCart();
  });
}

function displayCart() {
  var cartArray = shoppingCart.listCart();
  var output = "";

  for (var i in cartArray) {
    output += "<tr>" + "<td>" + cartArray[i].name + "</td>" + "<td>($" + cartArray[i].price + ")</td>" + "<td><div class='input-group'><button class='minus-item input-group-addon btn btn-primary' data-name=" + cartArray[i].name + ">-</button>" + "<input type='number' class='item-count form-control' data-name='" + cartArray[i].name + "' value='" + cartArray[i].count + "'>" + "<button class='plus-item btn btn-primary input-group-addon' data-name=" + cartArray[i].name + ">+</button></div></td>" + "<td><button class='delete-item btn btn-danger' data-name=" + cartArray[i].name + ">X</button></td>" + " = " + "<td>$" + cartArray[i].total + "</td>" + "</tr>";
  }

  $('.show-cart').html(output);
  $('.total-cart').html(shoppingCart.totalCart());
  $('.total-count').html(shoppingCart.totalCount());
}

$('.order-now').on("click", function (event) {
  axios.post("/comenzi", {
    'list': shoppingCart.listCart()
  }).then(function (response) {
    $(".thank-message").removeClass("d-none");
    setTimeout(function () {
      $(".thank-message").addClass("d-none");
      shoppingCart.clearCart();
      displayCart();
    }, 2500);
  });
});
$('.btn-recenzii').click(function () {
  this.innerHTML = this.innerHTML === 'Ascunde recenzii' ? 'Vezi recenzii' : 'Ascunde recenzii';
});
$('.show-cart').on("click", ".delete-item", function (event) {
  var name = $(this).data('name');
  shoppingCart.removeItemFromCartAll(name);
  displayCart();
});
$('.show-cart').on("click", ".minus-item", function (event) {
  var name = $(this).data('name');
  shoppingCart.removeItemFromCart(name);
  displayCart();
});
$('.show-cart').on("click", ".plus-item", function (event) {
  var name = $(this).data('name');
  shoppingCart.addItemToCart(name);
  displayCart();
});
$('.show-cart').on("change", ".item-count", function (event) {
  var name = $(this).data('name');
  var count = Number($(this).val());
  shoppingCart.setCountForItem(name, count);
  displayCart();
});
displayCart();

/***/ }),

/***/ 1:
/*!*************************************!*\
  !*** multi ./resources/js/store.js ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(/*! /Users/andrei/code/shop/resources/js/store.js */"./resources/js/store.js");


/***/ })

/******/ });