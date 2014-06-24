local=require('../../config/local')
Redis = require('redis')
Cacheable = require('cacheable')





class rediscache
  constructor: () ->
    client = Redis.createClient(local.caches.redis.port,local.caches.redis.host)
    client.auth(local.caches.redis.pass)
    @cached = Cacheable({
      client: client,
      ttl: local.caches.redis.ttl,
      prefix: local.caches.redis.prefix
    });
  set:(key,value,ttl)->
    if !ttl?
     ttl=local.caches.redis.ttl
    @cached.set(key,value,ttl)
  wrap:(fn)->
    @cached.wrap(fn,'ddd','300')
module.exports=new rediscache()