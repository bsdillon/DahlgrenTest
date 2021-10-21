const express = require('express');
const fs = require('fs');
const app = express();
const PORT = 8080;
const file = 'dataStore.json'

app.use(express.json());

//test function to make sure we don't request data that doesn't exist and crash program
//filepath string and cb callback value
function jsonRead(filepath, cb)
{
	fs.readFile(filepath, 'utf-8', (err, jsonString) => {
		if(err){ 
			return cb && cb(err);
		}
		try {
			const jsonFormat = JSON.parse(jsonString);
			return cb && cb(null, object);
		} catch (err) {
			return cb && cb(err);
		}
	});
}

app.listen(PORT, () => console.log(`alive on http://localhost:${PORT}`));
app.get('/sauce', (req, res) => {
	res.header("Content-Type", 'application-json');
	res.sendFile(file, { root: __dirname });
});

app.get('/sauce/:id', (req, res) => {
	//just sending back the id requested, no implementation
	res.send({output: req.params.id});
});

app.post('/sauce/:id', (req, res) => {
	//we get the information we need from the request (req)
	const {id} = req.params;
	const {price} = req.body;
	
	//response can be edited by changing res.status
	if(!price) { 
		res.status(418).send({ message: 'price required' })
	}

	res.send({
		//we would add this to file/db here
		sauce: `price of ${price} and ID of ${id}`,
	});
});
