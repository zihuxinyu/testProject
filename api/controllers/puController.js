/**
 * Created by weibaohui on 14-6-18.
 */
var puController = {

    find:function(req,res){
        var user_code=req.param('id');

        console.log(user_code);
        //user_code='weibh';
        portal_user.findOne().where({user_code:user_code}).done(function (err,usr){
           console.log(usr);
            res.json(usr);

        });
    },
    like: function (req, res) {
        res.view('home/123');
    },
    test: function (req, res) {


        pageIndex=req.param('pageIndex');
        pageSize=req.param('pageSize');

        console.log(parseInt(pageIndex)+1);

        var filters={user_code:{'like':'wei%'}};
        var total=0;
        portal_user.count(filters).exec(function (err, usr) {

            if (err) {
                res.send(500, {error: 'db error'});
            } else if (usr) {
                console.log(usr,'dsdsd');
                console.log('dsdsd');
                total=usr;

                portal_user.find(filters).paginate({page:parseInt(pageIndex)+1,limit:pageSize}).exec(function (err, usr) {
                    if (err) {
                        res.send(500, {error: 'db error'});
                    } else if (usr) {
                        console.log(usr);
                        res.json({'total':total,'data':usr});
                    }
                })
            }

        });



    }
};
module.exports = puController;


//Users.findByUsername(username).done(function(err, usr){
//    if (err) {
//        res.send(500, { error: "DB Error" });
//    } else if (usr) {
//        res.send(400, {error: "Username already Taken"});
//    } else {
//        var hasher = require("password-hash");
//        password = hasher.generate(password);
//
//        Users.create({username: username, password: password}).done(function(error, user) {
//            if (error) {
//                res.send(500, {error: "DB Error"});
//            } else {
//                req.session.user = user;
//                res.send(user);
//            }
//        });
//    }
//});