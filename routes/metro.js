
exports.index = function(req, res){
	res.locals.curnav = 'home';
	res.render('metro/index', { title: 'Hankewins的工作站' });
};