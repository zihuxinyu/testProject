cache=require '../services/rediscache'


baseauth=(req,res,next)->
  cache.set('zhangan','lisi')
  sails.log('baseauth',req.target.controller,req.target.action);

  if req.session.user

    sails.debug action
    next()
  else
    next()
module.exports=baseauth