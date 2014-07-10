#用户与角色组关系
user_role = {
  adapter: 'mongo'
  attributes:
    user_code: 'string'
    groupid: 'string'
    createdBy:'string'
    updatedBy:'string'
}
module.exports = user_role