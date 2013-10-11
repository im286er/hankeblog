/*
 * Created with Sublime Text 2.
 * User: Hankewins
 * Date: 2013-09-23
 * Time: 15:20:54
 * Contact: hankewins@gmail.com
 */

exports.index = function(req, res){
	res.locals.curnav = 'fonts';
	res.render('fonts', { title: 'Hankewins的工作站' });
};