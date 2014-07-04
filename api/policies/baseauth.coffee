


baseauth=(req,res,next)->
  sails.log('baseauthdd' ,req.target.controller,req.target.action);

  next()
module.exports=baseauth