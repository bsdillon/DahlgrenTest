const solve = require('./build/Release/solve');

exports.call = function () {

    return solve.calc();

};
