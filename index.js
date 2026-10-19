const http = require('http')

const server = http.createServer((req, res) => {
	console.log('request received')
	res.end('hi lol', 'utf-8')
})

server.listen(3003, () => {
	console.log('server listening on port 3003')
})
