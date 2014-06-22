q=require 'async'
crud=require '../services/crud'
_ = require("underscore");
_.str = require('underscore.string');
userController = {
  find: (req, res)->
    user_code = req.param('id')
    console.log user_code
    portal_user.findOne({user_code: user_code}).done((err, usr)->
      res.json usr if usr
    )
  save:(req,res)->
    crud.save(portal_user,req,(err,usr)->
      console.log err if err?
      res.json "ok" if !err?
    )


    res.json 'ok'
  test: (req, res)->
    portal_user.create
     user_name:'test'
     user_code:'weibbbbbb'
    .done (err,usr)=>
      console.log usr
  page: (req, res)->

    filter = {'user_code': {'like': 'weiwei%'}}
    dm=portal_user

    crud.grid(dm,filter,req,(err,ru)->

      console.log err if err?
      res.json ru
    )














}
module.exports = userController
