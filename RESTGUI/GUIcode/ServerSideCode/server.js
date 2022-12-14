const express = require('express');
const app = express();
var md = require('./module');
var cors = require('cors');

app.use(cors());

app.get('/', (req, res) => {
    if (req.headers.math) {
        res.send('The solution to a complicated math problem: ' + md.call());
    }

    if (req.headers.hello) {
        res.send('Most common example of all time: hello ' + md.greet() + '!');
    }
});

app.listen(1337);
