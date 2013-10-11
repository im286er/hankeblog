/*
 * Created with Sublime Text 2.
 * User: Hankewins
<<<<<<< HEAD
 * Date: 2013-09-23
 * Time: 14:22:53
 * Contact: hankewins@gmail.com
 */

var path = require('path');

exports.config = {
	debug: true,
	name: 'Node Blog',
	description: 'Node Blog use Nodejs developement.',
	version: '0.0.1',

	//site setting
	site_heads: [
		'<meta name="author" content="hankewins@gmail.com" />'
	],
	host: 'node.hankewins.com',
	site_logo: '', //default is 'name'
	site_navs: [
		// [ path, title, [target=''] ]
		[ '/about', '关于']
	],

	upload_dir: path.join(__dirname, 'public', 'uploads', 'images'),

	db: 'mongodb:127.0.0.1/node-blog-dev',
	session_secret: 'node-blog',
	auth_cookie_name: 'node-blog',
	port: 3000,

	site_links: [
		{
			'text': 'Node 官方网站',
			'url': 'http://nodejs.org/'
		}
	]
};

=======
 * Date: 2013-09-13
 * Time: 11:19:07
 * Contact: hankewins@gmail.com
 */

var mongoose = require('mongoose');

mongoose.connect('mongodb://localhost/test');

var db = mongoose.connection;

db.on('error', console.error.bind(console, 'connection error.'));
db.once('open', function callback(){
	//yay!
	console.log('success!');
});

var kittySchema = mongoose.Schema({
    name: String
});

// var Kitten = mongoose.model('Kitten', kittySchema);

// var silence = new Kitten({ name: 'aa' });
// console.log(silence.name);// 'Silence'

kittySchema.methods.speak = function () {
  var greeting = this.name ? "Meow name is " + this.name : "I don't have a name";
  console.log(greeting);
};

var Kitten = mongoose.model('Kitten', kittySchema);

var fluffy = new Kitten({ name: 'fluffy' });
//fluffy.speak(); // "Meow name is fluffy"

fluffy.save(function (err, fluffy) {
  if (err) // TODO handle the error
  fluffy.speak();
});
>>>>>>> 059dad95db00b977bb8b10978e2e95c1060f8cb8
