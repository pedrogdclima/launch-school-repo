var _ = function(element) {

  _.range = function(start, end) {
    if (end === undefined) {
      end = start;
      start = 0;
    }
    let outputArray = [];
    for (; start < end; start += 1) {
      outputArray.push(start);
    }
    return outputArray;
  };

  _.extend = function(finalObject, ...objects) {
    for (let index = objects.length - 1; index >= 0; index -= 1) {
      let lastObject = objects[index]
      for (let prop in lastObject) {
        finalObject[prop] = lastObject[prop];
      }
    }
    return finalObject;
  };

  _.isArray = function(object) {
    return object instanceof Array;
  }

  // const methodNames = [
  //   "isElement", "isArray", "isObject", "isFunction",
  //   "isBoolean", "isString", "isNumber"
  // ]
  // for (const method of methodNames) {
  //   _[method] = u[method];
  // }

  var u = {

    // Array methods

    last: function() {
      return element[element.length - 1];
    },

    first: function() {
      return element[0];
    },

    lastIndexOf: function(targetValue) {
      let reversedElement = element.reverse();
      for (let prop in reversedElement) {
        if (targetValue === reversedElement[prop]) return element.length - Number(prop) - 1;
      }
      return null;
    },

    sample: function(quantity) {
      const outputArray = [];
      const sourceArray = [...element];
      const getValue = function(array) {
        const randomIndex = Math.floor(Math.random() * array.length + 1) - 1;
        return array.splice(randomIndex, 1)[0];
      };
      if (!quantity) return getValue(sourceArray);
      while (outputArray.length < quantity) {
        outputArray.push(getValue(sourceArray));
      }
      return outputArray;
    },

    without: function(...inputValues) {
      return element.filter( value => {
        return !inputValues.some( input => input === value);
      });
    },

    // Object methods

    findWhere: function(target) {
      const targetProperties = Object.getOwnPropertyNames(target);
      for (let obj of element) {
        if (targetProperties.every(prop => target[prop] === obj[prop] )) {
          return obj;
        }
      }
      return undefined;
    },

    where: function(target) {
      const targetProperties = Object.getOwnPropertyNames(target);
      const outputArray = [];
      for (let obj of element) {
        if (targetProperties.every(prop => target[prop] === obj[prop] )) {
          outputArray.push(obj);
        }
      }
      return outputArray;
    },

    pluck: function(key) {
      const outputArray = [];
      for (const obj of element) {
        const value = obj[key];
        if (value) outputArray.push(value);
      }
      return outputArray;
    },

    keys: function() {
      const outputArray = [];
      for (const prop in element) {
        outputArray.push(prop);
      }
      return outputArray;
    },

    values: function() {
      const outputArray = [];
      for (let prop in element) {
        outputArray.push(element[prop]);
      }
      return outputArray;
    },

    pick: function(...properties) {
      const newObject = {};
      for (const prop of properties) {
        if (element[prop]) {
          newObject[prop] = element[prop];
        }
      }
      return newObject;
    },

    omit: function(...properties) {
      const newObject = {};
      for (const prop in element) {
        if (properties.includes(prop)) continue;
        newObject[prop] = element[prop];
      }
      return newObject;
    },

    has: function(property) {
      return !!element[property];
    },

    // Utility methods

    isArray: function() {
      _.isArray.call(this, element);
    }
  };
  return u;
};

// Utility methods. These should work with either syntax (i.e. _.isElement(obj) or _(obj).isElement()).

// [optional, feel free to check out the video for the answer] isElement, return true if argument is a DOM element.
// isArray, return true if argument is an array.
// isObject, return true if argument is an object or a function.
// isFunction, return true if argument is a function.
// isString, return true if argument is a string.
// isNumber, return true if argument is a number. Also returns true for objects created with the Number constructor.
// isBoolean, return true if argument is a boolean. Also returns true for objects created with the Boolean constructor.