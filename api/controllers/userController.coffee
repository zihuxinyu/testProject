q=require 'async'

userController = {
  find: (req, res)->
    user_code = req.param('id')
    console.log user_code
    portal_user.findOne({user_code: user_code}).done((err, usr)->
      res.json usr if usr
    )
  test: (req, res)->
    portal_user.create
     user_name:'test'
     user_code:'weibbbbbb'
    .done (err,usr)=>
      console.log usr
  page: (req, res)->

    filter = {user_code: {'like': 'wei%'}}
    dm=portal_user
    result=(dm,filter,req)=>
      pageindex = req.param('pageIndex')
      pagesize = req.param('pageSize')
      q.parallel
        data:(cb)->
          dm.find(filter).paginate(page:parseInt(pageindex)+1,limit:pagesize).exec (err,usr)->
                cb(null,usr)
        total:(cb)->
          dm.count(filter).exec (err,count)->
                cb(null,count)
        (err,results)->
          console.log err if err
          res.json results if not err?
    result(dm,filter,req)













}
module.exports = userController
