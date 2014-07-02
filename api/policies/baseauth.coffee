


baseauth=(req,res,next)->
  #sails.log('baseauth',req.target.controller,req.target.action);
  req.cookies.user='zh'
  if req.cookies.user
    next()
  else
    req.cookies.user='wei'
    next()
module.exports=baseauth