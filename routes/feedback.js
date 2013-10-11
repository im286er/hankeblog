/*
 * Created with Sublime Text 2.
 * User: Hankewins
 * Date: 2013-09-12
 * Time: 15:57:26
 * Contact: hankewins@gmail.com
 */

/**
 * feedback module
 */

exports.index = function(req, res){
	res.locals.curnav = '';
	res.render('feedback', { title: '留言 - Hankewins的工作站' });
};