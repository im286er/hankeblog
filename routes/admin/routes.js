/*
 * Created with Sublime Text 2.
 * User: Hankewins
 * Date: 2013-09-13
 * Time: 14:23:35
 * Contact: hankewins@gmail.com
 */

var login = require('./login');

module.exports = function(app){
	app.get('/admin', login.signin);
};