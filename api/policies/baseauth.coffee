
baseauth=(req,res,next)->
  sails.log('baseauth',req.target.controller,req.target.action);

  if req.session.user
    action=req.param('action')
    sails.debug action
    next()
  else
    next()
module.exports=baseauth