q=require 'q'
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
    console.log __filename, __dirname
    pageindex = req.param('pageIndex')
    pagesize = req.param('pageSize')
    filter = {user_code: {'like': 'wei%'}}


    q.when [getcount,getdata], (total,data) =>
      console.log totla,data
      res.json {total: total, data: data}

    getdata=portal_user.find(filter).exec (err, usr)->
      console.log 'getdata'
      usr
    
    getcount=portal_user.count(filter).exec (err, count)->
        console.log 'getcount'
        count







}
module.exports = userController
