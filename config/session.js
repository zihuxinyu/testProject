/**
 * Session
 * 
 * Sails session integration leans heavily on the great work already done by Express, but also unifies 
 * Socket.io with the Connect session store. It uses Connect's cookie parser to normalize configuration
 * differences between Express and Socket.io and hooks into Sails' middleware interpreter to allow you
 * to access and auto-save to `req.session` with Socket.io the same way you would with Express.
 *
 * For more information on configuring the session, check out:
 * http://sailsjs.org/#documentation
 */

module.exports.session = {

  // Session secret is automatically generated when your new app is created
  // Replace at your own risk in production-- you will invalidate the cookies of your users,
  // forcing them to log in again. 
  secret: 'd430f5a0f2e01f946ee31d71319e56bb',

    // Set the session cookie expire time
    // The maxAge is set by milliseconds, the example below is for 24 hours
    //
    cookie: {
    maxAge: 24 * 60 * 60 * 1000
    },

  // In production, uncomment the following lines to set up a shared redis session store
  // that can be shared across multiple Sails.js servers
  adapter: 'redis',
  //
  // The following values are optional, if no options are set a redis instance running
  // on localhost is expected.
  // Read more about options at: https://github.com/visionmedia/connect-redis
  //
  host: '134.44.36.125',
  port: 6379,
  ttl: 24 * 60 * 60 * 1000,/*保存时间一天*/
  db: 0,
  pass: '%$s%dd$%d#s^df#$a^fd%sf*^&(d*d&^)gh*^jk*e(*&e*s#%',
  prefix: 'sessions:'


  // Uncomment the following lines to use your Mongo adapter as a session store
  //adapter:'mongo',
//
//  host: 'localhost',
//  port: 27017,
//  db: 'sails',
//  collection: 'sessions',
  //
  // Optional Values:
  //
  // # Note: url will override other connection settings
  // url: 'mongodb://user:pass@host:port/database/collection',
  //
//  username: 'sa',
//  password: 'sa',
//  auto_reconnect: true,
//  ssl: false,
//  stringify: true

};
