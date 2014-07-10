


baseauth=(req,res,next)->
#  sails.log('baseauthdd' ,req.target.controller,req.target.action);
#  if req.session.user_code? then next()
#  else
#    return res.redirect('/login')
  next()
module.exports=baseauth