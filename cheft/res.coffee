module.exports = (res) ->
    html: (data) ->
        @header 'Content-Type', 'text/html'
        res.end data

    json: (data) ->
        @header 'Content-Type', 'text/json'
        res.end JSON.stringify(data)

    stream: (data) ->
        @header 'Content-Type', 'text/stream'
        res.end data

    send: (data) ->
        res.end data

    header: (name, value) ->
        if value
            return res.setHeader name, value
        else if value is false
            return res.removeHeader name
        res.getHeader name
