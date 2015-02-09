http = require 'http'
req = require './req'
res = require './res'

conf =
    host: '127.0.0.1'
    port: 3333

routes =
    'r/id': 'get'
    'r/': 'list'
    'c/': 'create'
    'u/': 'update'
    'd/': 'remove'

notFound = (req, res) ->
    res.send '404'

class App

    constructor: (options) ->
        @server = http.createServer (request, response) ->
            requ = req request
            handle = options.handles[routes[requ.method + requ.path]] || notFound
            handle.apply handle, [requ, res(response) ]

    start: ->
        @server.listen conf.port, conf.host
        console.log "Cheft running at http://#{conf.host}:#{conf.port}"

module.exports = App
