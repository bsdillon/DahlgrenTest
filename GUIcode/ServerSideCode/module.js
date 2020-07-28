const solve = require('./build/Release/solve');
const greeting = require('./Addon2/build/release/hello');

exports.call = function () {
    return solve.calc();
};

exports.greet = function () {
    return greeting.hello();
};
