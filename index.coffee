fs = require 'fs'
watch = require 'watch-project'
App = require './cheft/app'

markdPath = './markd'

blogs = []
fetchBlogs = ->
    blogs = []
    fs.readdirSync(markdPath).forEach (file) ->
        suffix = file.substr file.lastIndexOf('.'), file.length
        if suffix is '.md'
            stat = fs.statSync markdPath + '/' + file
            content = fs.readFileSync(markdPath + '/' + file).toString()
            blogs.push time: stat.ctime, id: Math.round(stat.ctime.getTime()/1000),
            title: file.replace('.md', ''), content: content
    blogs

watch markdPath, stable: true, (e) -> fetchBlogs()

fetchBlogs()


sortTime = (a,b) -> a.time < b.time

handles =
    get: (req, res) ->
        res.send 'get' + req.params.id

    list: (req, res) ->
        res.json blogs.sort(sortTime)

app = new App handles: handles
app.start()
