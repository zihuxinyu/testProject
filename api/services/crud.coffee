q=require 'async'
cblogic=require './cb'


class crud
  ###
  专用生成miniuigrid数据
  dm:dataModel
  filter:过滤条件
  req:request，用来获取param
  cb:回调
  ###
  grid:(dm,filter,req,cb)->
    pageIndex = req.param('pageIndex')
    pageSize = req.param('pageSize')
    sortField=req.param('sortField')+""
    sortOrder=req.param('sortOrder')+""
    #预处理pageSize pageIndex
    if pageIndex then pageIndex=parseInt(pageIndex)+1 else pageIndex=1
    if pageSize then pageSize=parseInt(pageSize) else pageSize=10

    q.parallel
      #data部分
      data:(cb)->
        #如果有排序字段
        if sortField
          dm.find(filter)
            .paginate(page:pageIndex,limit:pageSize)
          .sort("#{sortField} #{sortOrder} ")
            .exec (err,usr)->
             cblogic(err,usr,cb)
        else
          dm.find(filter)
          .paginate(page:pageIndex,limit:pageSize)
          .exec (err,usr)->
            cblogic(err,usr,cb)
      #计算总数部分
      total:(cb)->
        dm.count(filter).exec (err,count)->
          cblogic(err,count,cb)
      (err,results)->
        cblogic(err,results,cb)



#返回实例化的类，直接引用即可
module.exports =new crud()