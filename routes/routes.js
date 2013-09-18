/*
 * Created with Sublime Text 2.
 * User: Hankewins
 * Date: 2013-09-13
 * Time: 11:51:10
 * Contact: hankewins@gmail.com
 */

var index = require('./index');
var user = require('./user');
var feedback = require('./feedback');
var opus = require('./opus');
var share = require('./share');
var blog = require('./blog');

module.exports = function(app){
	app.get('/', index.index);
	app.get('/blog', blog.detail);
	app.get('/share', share.index);
	app.get('/opus', opus.index);
	app.get('/users', user.list);
	app.get('/feedback', feedback.index);
	app.get('/detail', blog.detail);
	//app.get('/admin', admin.login);
};