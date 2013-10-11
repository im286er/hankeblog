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
<<<<<<< HEAD
	res.render('share', { title: '分享 - Hankewins的工作站' });
=======
	res.render('share', { title: '分享 - Hankewins的个人空间，忆前端、忆生活' });
>>>>>>> 059dad95db00b977bb8b10978e2e95c1060f8cb8
};