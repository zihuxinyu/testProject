q=require 'async'
crud=require '../services/crud'
userController = {
  find: (req, res)->
    user_code = req.param('id')
    console.log user_code
    portal_user.findOne({user_code: user_code}).done((err, usr)->
      res.json usr if usr
    )
  create:(req,res)->
    data=JSON.parse(req.param('data'))

    portal_user.update({'id':'53a5172b4dee7db68fc00384'},{'user_code':'weibsahhhhh','user_name':'ds'}).exec (err,ru)->
      console.log ru

    getpk=(dm)->
      _data=dm.definition
      for d of _data
        for y of _data[d]
          if y=='primaryKey'
#           console.log y,d
            ret=d #找到含有主键定义的
      ret
    console.log getpk(portal_user1)

    res.json 'ok'
  test: (req, res)->
    portal_user.create
     user_name:'test'
     user_code:'weibbbbbb'
    .done (err,usr)=>
      console.log usr
  page: (req, res)->

    filter = {'user_code': {'like': 'weib%'}}
    dm=portal_user

    crud.grid(dm,filter,req,(err,ru)->

      console.log err if err?
      res.json ru
    )














}
module.exports = userController
