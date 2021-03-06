stringifyDate = require '../services/jsondate'


class cblogic
  ###
    回调函数逻辑处理
    用在逻辑处理内部，需要继续执行下一个子逻辑的地方
  ###
  nextcb:(err,result,cb)->
    if err? then sails.log err
    if err? then cb err else cb(null,result)

  ###
  回调函数需要返回值
  用在最外层处理req，res，需要响应的时候
  ###
  cbres:(err,result,res)->
    #记录错误
    sails.log 'error',err if err?
    #如果出错就返回err，无错误然后result
    #stringifyDate处理时间问题

    if err? then res.json  {result:'error'} else res.send stringifyDate.stringify(result)
    #if err? then res.send 'err' else res.json (result)

module.exports=new cblogic()



