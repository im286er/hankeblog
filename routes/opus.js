/*
 * Created with Sublime Text 2.
 * User: Hankewins
 * Date: 2013-09-12
 * Time: 15:57:36
 * Contact: hankewins@gmail.com
 */

/**
 * opus module
 */

exports.index = function(req, res){
	res.locals.curnav = 'opus';
	res.render('opus', { title: '作品 - Hankewins的个人空间，忆前端、忆生活' });
};