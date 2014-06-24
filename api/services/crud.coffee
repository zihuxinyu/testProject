q = require 'async'
cblogic = require './cb'
_ = require "underscore"

class crud
  ###
  获取数据模型的主键，目前只支持一个主键
  dm:dataModel
  ###
  getpk: (dm)->
    _data = dm.definition
    for d of _data
      for y of _data[d]
        if y == 'primaryKey'
#           console.log y,d
          ret = d #找到含有主键定义的
    ret

  ###
  得到模型含有的字段
  返回[ 'user_code',
  'user_name',
  'topdpt',
  'dpt_name',
  'id',
  'createdAt',
  'updatedAt' ]
  ###
  getcloumns: (dm)->
    _.keys(dm.definition)


  ###
  对模型的增删改保存
  ###
  save: (dm, req, cb)->
    data = JSON.parse(req.param('data'))
    if data.length == 0
      cblogic.cblogic('nodata', '', cb)
    else
      id = @getpk(dm)
      cc = @getcloumns(dm)

      for d in data
        columns = {} #记录反馈的字段及值{'user_name':'zhangsanfeng','user_code':'jhjh'}

        for _everycolumn of d
          #修改的字段排除_state字段,排除主键
          if  _everycolumn in cc and _everycolumn != id
            columns[_everycolumn] = d[_everycolumn]

        if d._state == 'modified'
          dm.update({id: d[id]}, columns).exec (err, usr)->
            cblogic.cblogic(err, usr, cb)
        if d._state == 'added'
          dm.create(columns).exec (err, usr)->
            cblogic.cblogic(err, usr, cb)
        if d._state == 'removed'
          dm.destroy({id: d[id]}).exec (err, usr)->
            cblogic.cblogic(err, usr, cb)

  ###
  专用生成miniuigrid数据
  dm:dataModel
  filter:过滤条件
  req:request，用来获取param
  cb:回调
  ###
  grid: (dm, filter, req, cb)->
    sails.log filter
    pageIndex = req.param('pageIndex')
    pageSize = req.param('pageSize')
    sortField = req.param('sortField') + ""
    sortOrder = req.param('sortOrder') + ""
    #预处理pageSize pageIndex
    if pageIndex then pageIndex = parseInt(pageIndex) + 1 else pageIndex = 1
    if pageSize then pageSize = parseInt(pageSize) else pageSize = 10

    q.parallel
    #data部分
      data: (cb)->
        #如果有排序字段
        if sortField
          dm.find(filter)
          .paginate(page: pageIndex, limit: pageSize)
          .sort("#{sortField} #{sortOrder} ")
          .exec (err, usr)->
            cblogic.cblogic(err, usr, cb)
        else
          dm.find(filter)
          .paginate(page: pageIndex, limit: pageSize)
          .exec (err, usr)->
            cblogic.cblogic(err, usr, cb)
    #计算总数部分
      total: (cb)->
        dm.count(filter).exec (err, count)->
          cblogic.cblogic(err, count, cb)

      (err, results)->
        cblogic.cblogic(err, results, cb)


#返回实例化的类，直接引用即可
module.exports = new crud()