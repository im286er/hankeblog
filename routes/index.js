/*
 * Created with Sublime Text 2.
 * User: Hankewins
 * Date: 2013-09-12
 * Time: 15:57:32
 * Contact: hankewins@gmail.com
 */

/*
 * GET home page.
 */

exports.index = function(req, res){
	res.locals.curnav = 'home';
	res.render('index', { title: 'Hankewins的个人空间，忆前端、忆生活' });
};