


baseauth=(req,res,next)->
  sails.log('baseauth',req.target.controller,req.target.action);

  if req.session.user

    sails.debug action
    next()
  else
    next()
module.exports=baseauth