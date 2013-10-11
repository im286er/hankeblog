/*
 * Created with Sublime Text 2.
 * User: Hankewins
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

