/*
 * Created with Sublime Text 2.
 * User: Hankewins
 * Date: 2013-09-12
 * Time: 15:56:54
 * Contact: hankewins@gmail.com
 */

//blog module
exports.list = function(req, res){
	res.locals.curnav = 'blog';
	res.render('list', { title: 'Blog - Hankewins的个人空间，忆前端、忆生活' });
};

exports.detail = function(req, res){
	res.locals.curnav = 'blog';
	res.render('detail', { title: 'Blog - Hankewins的个人空间，忆前端、忆生活' });
};