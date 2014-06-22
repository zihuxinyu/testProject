#回调函数逻辑处理

cblogic=(err,result,cb)->
  if err? then cb err else cb(null,result)
module.exports=cblogic