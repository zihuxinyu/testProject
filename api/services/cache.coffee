cache_manager = require 'cache-manager'
redis_store = require './redis_store'
local=require '../../config/local'
crypto = require 'crypto'
Serializer = require("mousse").Serializer
hash = require('object-hash')

class cache

  uureq :(req)->
    #存放除了req以外的参数，req作为第一个参数
    yy=[]
    for x of arguments
      if x!='0'
        yy.push(arguments[x])
    #单独处理req，取共性的东西
    ss=JSON.stringify(req.route)+
      JSON.stringify(req.body)+
      JSON.stringify(req.query)
    serializationString = new Serializer().serialize(yy)+ss
    crypto.createHash('md5').update(serializationString).digest('hex')
  mcache: ->
    cache_manager.caching({store: 'memory', max: 100, ttl: 10});
  rcache:->
    cache_manager.caching({store: redis_store,host:local.caches.redis.host,pass:local.caches.redis.pass, db: 0, ttl: 1000,prefix: 'autocache:'});


module.exports=new cache()

