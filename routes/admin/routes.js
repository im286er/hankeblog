/*
 * Created with Sublime Text 2.
 * User: Hankewins
 * Date: 2013-09-13
 * Time: 14:23:35
 * Contact: hankewins@gmail.com
 */

var login = require('./login');
var dashboard = require('./dashboard');

module.exports = function(app){
	app.get('/admin/login', login.signin);
	app.get('/admin/index', dashboard.index);
	//app.get('/admin/logout', login.signin);
};