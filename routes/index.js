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
<<<<<<< HEAD
	res.render('index', { title: 'Hankewins的工作站' });
=======
	res.render('index', { title: 'Hankewins的个人空间，忆前端、忆生活' });
>>>>>>> 059dad95db00b977bb8b10978e2e95c1060f8cb8
};