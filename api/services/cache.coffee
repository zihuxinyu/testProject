cache_manager = require 'cache-manager'

class cache
  memory_cache: ()->
    cache_manager.caching({store: 'memory', max: 100, ttl: 10})
module.exports=cache