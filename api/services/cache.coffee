cache_manager = require 'cache-manager'
redis_store = require('./redis_store');
local=require('../../config/local')
class cache

  cache::mcache=->
    cache_manager.caching({store: 'memory', max: 100, ttl: 10});
  cache::rcache=->
    cache_manager.caching({store: redis_store,host:local.caches.redis.host,pass:local.caches.redis.pass, db: 0, ttl: 1000,prefix: 'autocache:'});
module.exports=new cache()

