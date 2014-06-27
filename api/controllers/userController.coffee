crud = require '../services/crud'
cblogic = require '../services/cb'


userController = {
  find: (req, res)->
    user_code = req.param('id')
    sails.log user_code
    portal_user.findOne({user_code: user_code}).done((err, usr)->
      res.json usr if usr
    )
  save: (req, res)->
    crud.save(portal_user, req, (err, usr)->
      cblogic.cbres(err,usr,res)
    )


  page_ok: (req, res)->

    filter = {'user_code': {'like': 'wei%'}}
    dm = portal_user

    crud.grid(dm, filter, req, (err, ru)->
      sails.log err if err?
      if err? then res.send 'err' else res.send ru
    )

  page:(req,res)->
    filter = {'user_code': {'like': 'w%'}}
    dm = portal_user



    crud.grid_cache(dm, filter, req,
      (err,ru)->
        sails.log err if err?
        if err? then res.send 'err' else res.send ru
      )













}
module.exports = userController
