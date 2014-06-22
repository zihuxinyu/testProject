portal_user1 = {
  adapter: 'mongo'
  attributes:
    user_code: 'STRING'
    user_name: 'STRING'
    topdpt: 'STRING'
    dpt_name: 'STRING'
    idss:
      type: 'integer'
      defaultsTo: 'AUTO_INCREMENT'
      primaryKey: true
      unique: true
      indexed: true
}
module.exports = portal_user1