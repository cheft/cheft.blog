url = require 'url'

methods =
    'POST': 'c'
    'GET': 'r'
    'PUT': 'u'
    'DELETE': 'd'

module.exports = (req) ->
    obj = url.parse req.url
    result = method: methods[req.method], path: obj.pathname, params: {}
    return result unless obj.query
    arr = obj.query.split '&'
    for tmp in arr
        t = tmp.split '='
        result.params[t[0]] = t[1]
    result
