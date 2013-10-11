/*
 * Created with Sublime Text 2.
 * User: Hankewins
 * Date: 2013-09-12
 * Time: 15:57:43
 * Contact: hankewins@gmail.com
 */

/**
 * share module
 */

exports.index = function(req, res){
	res.locals.curnav = 'share';
	res.render('share', { title: '分享 - Hankewins的工作站' });
};