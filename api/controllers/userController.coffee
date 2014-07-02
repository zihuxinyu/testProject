crud = require '../services/crud'
cbres = require('../services/cb').cbres
userController = {

  save: (req, res)->
    crud.save portal_user, req, (err, usr)->
      cbres(err,usr,res)

  page:(req,res)->
    dm = portal_user
    filter = {'user_code': {'like': req.cookies.user+'%'}}

    crud.grid dm, filter, req,
      (err,results)->
        cbres(err,results,res)

}
module.exports = userController
