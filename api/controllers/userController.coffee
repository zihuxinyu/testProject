crud = require '../services/crud'
cblogic = require '../services/cb'
cache= require '../services/cache'
crypto = require('crypto')



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
    filter = {'user_code': {'like': 'wei%'}}
    dm = portal_user


    ss=JSON.stringify(req.route)+JSON.stringify(req.body)+JSON.stringify(req.query)+JSON.stringify(req.cookie)
    etag = crypto.createHash('md5').update(ss).digest('hex')
    console.log etag,ss
    cache.memory_cache().wrap(etag,(cb)->
      crud.grid(dm, filter, req,cb)
    (err,ru)->
        sails.log err if err?
        if err? then res.send 'err' else res.send ru
    )













}
module.exports = userController
