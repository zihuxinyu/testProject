request = require('request')
indexController = {

  index: (req, res)->
    res.view('home/index')
  doit: (i)->

    request 'http://www.cnblogs.com', (err,response,body)->
      if !err and response.statusCode==200
        sails.log body
    sails.log i
  menu: (req, res)->
    list=[1...200]
    for x in list
      indexController.doit x

    s = [
      {id: "lists", text: "自动任务管理"},
      {id: "sqllist", text: "任务列表", pid: "lists", url: '/user/index'},
      {id: "datagrid", text: "DataGrid", pid: "lists"},
      {id: "tree", text: "Tree", pid: "datagrid"},
      {id: "treegrid", text: "TreeGrid ", pid: "datagrid"},
      {id: "layouts", text: "Layouts", pid: "user"},
      {id: "panel", text: "Panel", pid: "layouts"},
      {id: "splitter", text: "Splitter", pid: "layouts"},
      {id: "layout", text: "Layout ", pid: "layouts"},
      { id: "right", text: "权限管理"},
      {id: "base", text: "Base", pid: "right" },
      {id: "ajax", text: "Ajax", pid: "base"},
      {id: "json", text: "JSON", pid: "base"},
      {id: "date", text: "Date", pid: "base"},
      {id: "forms", text: "Forms", pid: "right"},
      {id: "button", text: "Button", pid: "forms"},
      {id: "listbox", text: "ListBox", pid: "forms"},
      {id: "checkboxlist", text: "CheckBoxList", pid: "forms"},
      {id: "radiolist", text: "RadioList", pid: "forms"},
      {id: "calendar", text: "Calendar", pid: "forms"}
    ]
    res.send s
}
module.exports = indexController
