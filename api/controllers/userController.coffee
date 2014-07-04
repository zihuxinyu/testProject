crud = require '../services/crud'
cbres = require('../services/cb').cbres
userController = {
  index:(req,res)->
    res.view('home/user')
  #用户登录
  login:(req,res)->

    data = JSON.parse(req.param('Data'))
    user_code=data.user_code

    portal_user.findOneByUser_code(user_code).exec (err,usr)->
      if usr?
        req.session.user_code=usr.user_code
        req.session.user_name=usr.user_name
        res.json {result:'ok'}

      else
        res.json {result:'无此用户'}

  save: (req, res)->
    crud.save portal_user, req, (err, usr)->
      cbres(err,usr,res)

  page:(req,res)->

    dm = portal_user
    filter = {'user_code': {'like': 'weibh%'}}

    crud.grid dm, filter, req,
      (err,results)->
        cbres(err,results,res)

}
module.exports = userController
