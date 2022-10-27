const express = require('express');
const app = express();
const port = 5555;


app.use(express.json());


app.get('/wid', (req, res) => {
	res.send('routing from the node express space');
});


app.listen(port, () => {
	console.log(`node2py server at port:${port}`);
});

