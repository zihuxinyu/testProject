userController = {
  find: (req, res)->
    user_code = req.param('id')
    console.log user_code
    portal_user.findOne({user_code: user_code}).done((err, usr)->
      res.json usr if usr
    )
  test: (req, res)->
    res.send 'lk'
    dsfdsfdsfdsfd d
  page: (req, res)->
    console.log __filename, __dirname
    pageindex = req.param('pageIndex')
    pagesize = req.param('pageSize')
    filter = {user_code: {'like': 'wei%'}}
    total = 0
    portal_user.count(filter).done(
      (err, count)->
        total = count if count?
        portal_user.find(filter)
        .paginate({page: parseInt(pageindex) + 1, limit: pagesize})
        .exec((err, usr)->
          res.json {total: total, data: usr} if usr?
        )
    )


}
module.exports = userController
