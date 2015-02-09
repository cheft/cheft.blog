data = require './data'
App = require './app'

handles =
    notFound: (req, res) ->
        res.html '404'

    get: (req, res) ->
        console.log res.header('Content-Type')
        res.header 'Content-Type', 'text/html'
        console.log res.header('Content-Type')
        res.header 'Content-Type', false
        res.send 'get'

    list: (req, res) ->
        console.log req.params.a, 111
        res.html data.bigData

    create: (req, res) ->
        res.html 'create' + req.params.a

    update: (req, res) ->
        res.html 'update'

    remove: (req, res) ->
        res.json result: 'remove'

app = new App handles: handles
app.start()
