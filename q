commit 13217ec2acfd77a870ca5cb4a3a436b30f3db669
Author: Hankewins <hankewins@ubuntu.(none)>
Date:   Tue Sep 17 11:32:06 2013 +0800

    upload my node blog

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..3c3629e
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1 @@
+node_modules
diff --git a/app.js b/app.js
new file mode 100644
index 0000000..281d9c4
--- /dev/null
+++ b/app.js
@@ -0,0 +1,39 @@
+
+/**
+ * Module dependencies.
+ */
+var config = require('./config');
+var express = require('express');
+var http = require('http');
+var path = require('path');
+
+var app = express();
+
+// all environments
+app.set('port', process.env.PORT || 3000);
+app.set('views', __dirname + '/views');
+app.set('view engine', 'html');
+app.engine('html', require('ejs').renderFile);
+app.use(express.favicon(__dirname + '/favicon.ico', {
+    maxAge: 2592000000
+}));
+app.use(express.logger('dev'));
+app.use(express.bodyParser());
+app.use(express.methodOverride());
+app.use(app.router);
+app.use(require('stylus').middleware(__dirname + '/public'));
+app.use(express.static(path.join(__dirname, 'public')));
+
+// development only
+if ('development' == app.get('env')) {
+  app.use(express.errorHandler());
+}
+
+require('./routes/routes')(app); // Front routes
+require('./routes/admin/routes')(app); // Backend routes
+
+//app.locals.curnav = '';
+
+http.createServer(app).listen(app.get('port'), function(){
+  console.log('Express server listening on port ' + app.get('port'));
+});
diff --git a/config.js b/config.js
new file mode 100644
index 0000000..0ddae86
--- /dev/null
+++ b/config.js
@@ -0,0 +1,43 @@
+/*
+ * Created with Sublime Text 2.
+ * User: Hankewins
+ * Date: 2013-09-13
+ * Time: 11:19:07
+ * Contact: hankewins@gmail.com
+ */
+
+var mongoose = require('mongoose');
+
+mongoose.connect('mongodb://localhost/test');
+
+var db = mongoose.connection;
+
+db.on('error', console.error.bind(console, 'connection error.'));
+db.once('open', function callback(){
+	//yay!
+	console.log('success!');
+});
+
+var kittySchema = mongoose.Schema({
+    name: String
+});
+
+// var Kitten = mongoose.model('Kitten', kittySchema);
+
+// var silence = new Kitten({ name: 'aa' });
+// console.log(silence.name);// 'Silence'
+
+kittySchema.methods.speak = function () {
+  var greeting = this.name ? "Meow name is " + this.name : "I don't have a name";
+  console.log(greeting);
+};
+
+var Kitten = mongoose.model('Kitten', kittySchema);
+
+var fluffy = new Kitten({ name: 'fluffy' });
+//fluffy.speak(); // "Meow name is fluffy"
+
+fluffy.save(function (err, fluffy) {
+  if (err) // TODO handle the error
+  fluffy.speak();
+});
\ No newline at end of file
diff --git a/favicon.bak.ico b/favicon.bak.ico
new file mode 100755
index 0000000..03eaff0
Binary files /dev/null and b/favicon.bak.ico differ
diff --git a/favicon.ico b/favicon.ico
new file mode 100644
index 0000000..a343950
Binary files /dev/null and b/favicon.ico differ
diff --git a/md/about-me.md b/md/about-me.md
new file mode 100644
index 0000000..f13d620
--- /dev/null
+++ b/md/about-me.md
@@ -0,0 +1,28 @@
+#关于hankewins
+
+Hankewins Yi 热爱设计，目前以写前端代码谋生， 现供职于(金立)[http://www.gionee.com/]。
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+ 
diff --git a/package.json b/package.json
new file mode 100644
index 0000000..f01b42e
--- /dev/null
+++ b/package.json
@@ -0,0 +1,15 @@
+{
+  "name": "application-name",
+  "version": "0.0.1",
+  "private": true,
+  "scripts": {
+    "start": "node app.js"
+  },
+  "dependencies": {
+    "mongoose": "3.6.19",
+    "express": "3.3.8",
+    "ejs": "*",
+    "stylus": "*",
+    "markdown":"*"
+  }
+}
\ No newline at end of file
diff --git a/public/images/banner.png b/public/images/banner.png
new file mode 100644
index 0000000..a72a133
Binary files /dev/null and b/public/images/banner.png differ
diff --git a/public/images/bg01.jpg b/public/images/bg01.jpg
new file mode 100644
index 0000000..b25beaa
Binary files /dev/null and b/public/images/bg01.jpg differ
diff --git a/public/images/bg02.jpg b/public/images/bg02.jpg
new file mode 100644
index 0000000..91086ce
Binary files /dev/null and b/public/images/bg02.jpg differ
diff --git a/public/images/logo-small.png b/public/images/logo-small.png
new file mode 100644
index 0000000..deaad55
Binary files /dev/null and b/public/images/logo-small.png differ
diff --git a/public/images/logo.png b/public/images/logo.png
new file mode 100644
index 0000000..8195374
Binary files /dev/null and b/public/images/logo.png differ
diff --git a/public/images/mask.old.png b/public/images/mask.old.png
new file mode 100644
index 0000000..ff29a98
Binary files /dev/null and b/public/images/mask.old.png differ
diff --git a/public/images/mask.png b/public/images/mask.png
new file mode 100644
index 0000000..5341cca
Binary files /dev/null and b/public/images/mask.png differ
diff --git a/public/images/pic01.jpg b/public/images/pic01.jpg
new file mode 100644
index 0000000..4600fad
Binary files /dev/null and b/public/images/pic01.jpg differ
diff --git a/public/images/pic01.png b/public/images/pic01.png
new file mode 100644
index 0000000..bc83253
Binary files /dev/null and b/public/images/pic01.png differ
diff --git a/public/images/pic02.jpg b/public/images/pic02.jpg
new file mode 100644
index 0000000..ee4dd3c
Binary files /dev/null and b/public/images/pic02.jpg differ
diff --git a/public/images/pic02.png b/public/images/pic02.png
new file mode 100644
index 0000000..605eedd
Binary files /dev/null and b/public/images/pic02.png differ
diff --git a/public/images/pic03.jpg b/public/images/pic03.jpg
new file mode 100644
index 0000000..61a5e0b
Binary files /dev/null and b/public/images/pic03.jpg differ
diff --git a/public/images/pic03.png b/public/images/pic03.png
new file mode 100644
index 0000000..31447dd
Binary files /dev/null and b/public/images/pic03.png differ
diff --git a/public/images/pic04.jpg b/public/images/pic04.jpg
new file mode 100644
index 0000000..d20b3fd
Binary files /dev/null and b/public/images/pic04.jpg differ
diff --git a/public/images/pic04.png b/public/images/pic04.png
new file mode 100644
index 0000000..f4a32f5
Binary files /dev/null and b/public/images/pic04.png differ
diff --git a/public/images/pic05.jpg b/public/images/pic05.jpg
new file mode 100644
index 0000000..fc2061b
Binary files /dev/null and b/public/images/pic05.jpg differ
diff --git a/public/images/pic06.jpg b/public/images/pic06.jpg
new file mode 100644
index 0000000..6e34151
Binary files /dev/null and b/public/images/pic06.jpg differ
diff --git a/public/images/pic07.jpg b/public/images/pic07.jpg
new file mode 100644
index 0000000..7a6bce6
Binary files /dev/null and b/public/images/pic07.jpg differ
diff --git a/public/images/pic08.jpg b/public/images/pic08.jpg
new file mode 100644
index 0000000..a20a836
Binary files /dev/null and b/public/images/pic08.jpg differ
diff --git a/public/images/pic09.jpg b/public/images/pic09.jpg
new file mode 100644
index 0000000..6ce3d45
Binary files /dev/null and b/public/images/pic09.jpg differ
diff --git a/public/images/pic10.jpg b/public/images/pic10.jpg
new file mode 100644
index 0000000..e4a0723
Binary files /dev/null and b/public/images/pic10.jpg differ
diff --git a/public/images/sns_skin.png b/public/images/sns_skin.png
new file mode 100644
index 0000000..c103d40
Binary files /dev/null and b/public/images/sns_skin.png differ
diff --git a/public/javascripts/main.js b/public/javascripts/main.js
new file mode 100644
index 0000000..fa577a4
--- /dev/null
+++ b/public/javascripts/main.js
@@ -0,0 +1,13 @@
+/*
+ * Created with Sublime Text 2.
+ * User: Hankewins
+ * Date: 2013-09-11
+ * Time: 16:46:13
+ * Contact: hankewins@gmail.com
+ */
+
+define(function(require, exports, modules){
+	//var $ = require('jquery');
+	require('/lightbox/css/lightbox.css');
+	require('/lightbox/js/lightbox-2.6.min.js');
+});
\ No newline at end of file
diff --git a/public/lightbox/README.markdown b/public/lightbox/README.markdown
new file mode 100644
index 0000000..a6372e9
--- /dev/null
+++ b/public/lightbox/README.markdown
@@ -0,0 +1,15 @@
+## Lightbox2
+by Lokesh Dhakar | [lokeshdhakar.com](http://www.lokeshdhakar.com) | [twitter.com/lokesh](http://twitter.com/lokesh)
+
+### Information and support
+For examples, downloads, and information on using Lightbox, visit the Lightbox2 homepage:
+[http://lokeshdhakar.com/projects/lightbox2/](http://lokeshdhakar.com/projects/lightbox2/)
+
+For personal support issues and feature requests, visit the Lightbox forums:
+[http://lokeshdhakar.com/forums/](http://lokeshdhakar.com/forums/)
+
+### License
+Licensed under the Creative Commons Attribution 2.5 License - http://creativecommons.org/licenses/by/2.5/
+
+* Free for use in both personal and commercial projects.
+* Attribution requires leaving author name, author homepage link, and the license info intact.
diff --git a/public/lightbox/css/lightbox.css b/public/lightbox/css/lightbox.css
new file mode 100644
index 0000000..9778718
--- /dev/null
+++ b/public/lightbox/css/lightbox.css
@@ -0,0 +1,202 @@
+/* line 7, ../sass/lightbox.sass */
+body:after {
+  content: url(../img/close.png) url(../img/loading.gif) url(../img/prev.png) url(../img/next.png);
+  display: none;
+}
+
+/* line 11, ../sass/lightbox.sass */
+.lightboxOverlay {
+  position: absolute;
+  top: 0;
+  left: 0;
+  z-index: 9999;
+  background-color: black;
+  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
+  opacity: 0.8;
+  display: none;
+}
+
+/* line 20, ../sass/lightbox.sass */
+.lightbox {
+  position: absolute;
+  left: 0;
+  width: 100%;
+  z-index: 10000;
+  text-align: center;
+  line-height: 0;
+  font-weight: normal;
+}
+/* line 28, ../sass/lightbox.sass */
+.lightbox .lb-image {
+  display: block;
+  height: auto;
+  -webkit-border-radius: 3px;
+  -moz-border-radius: 3px;
+  -ms-border-radius: 3px;
+  -o-border-radius: 3px;
+  border-radius: 3px;
+}
+/* line 32, ../sass/lightbox.sass */
+.lightbox a img {
+  border: none;
+}
+
+/* line 35, ../sass/lightbox.sass */
+.lb-outerContainer {
+  position: relative;
+  background-color: white;
+  *zoom: 1;
+  width: 250px;
+  height: 250px;
+  margin: 0 auto;
+  -webkit-border-radius: 4px;
+  -moz-border-radius: 4px;
+  -ms-border-radius: 4px;
+  -o-border-radius: 4px;
+  border-radius: 4px;
+}
+/* line 38, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/utilities/general/_clearfix.scss */
+.lb-outerContainer:after {
+  content: "";
+  display: table;
+  clear: both;
+}
+
+/* line 44, ../sass/lightbox.sass */
+.lb-container {
+  padding: 4px;
+}
+
+/* line 47, ../sass/lightbox.sass */
+.lb-loader {
+  position: absolute;
+  top: 43%;
+  left: 0%;
+  height: 25%;
+  width: 100%;
+  text-align: center;
+  line-height: 0;
+}
+
+/* line 56, ../sass/lightbox.sass */
+.lb-cancel {
+  display: block;
+  width: 32px;
+  height: 32px;
+  margin: 0 auto;
+  background: url(../img/loading.gif) no-repeat;
+}
+
+/* line 63, ../sass/lightbox.sass */
+.lb-nav {
+  position: absolute;
+  top: 0;
+  left: 0;
+  height: 100%;
+  width: 100%;
+  z-index: 10;
+}
+
+/* line 71, ../sass/lightbox.sass */
+.lb-container > .nav {
+  left: 0;
+}
+
+/* line 74, ../sass/lightbox.sass */
+.lb-nav a {
+  outline: none;
+}
+
+/* line 77, ../sass/lightbox.sass */
+.lb-prev, .lb-next {
+  width: 49%;
+  height: 100%;
+  cursor: pointer;
+  /* Trick IE into showing hover */
+  display: block;
+}
+
+/* line 84, ../sass/lightbox.sass */
+.lb-prev {
+  left: 0;
+  float: left;
+}
+/* line 87, ../sass/lightbox.sass */
+.lb-prev:hover {
+  background: url(../img/prev.png) left 48% no-repeat;
+}
+
+/* line 90, ../sass/lightbox.sass */
+.lb-next {
+  right: 0;
+  float: right;
+}
+/* line 93, ../sass/lightbox.sass */
+.lb-next:hover {
+  background: url(../img/next.png) right 48% no-repeat;
+}
+
+/* line 96, ../sass/lightbox.sass */
+.lb-dataContainer {
+  margin: 0 auto;
+  padding-top: 5px;
+  *zoom: 1;
+  width: 100%;
+  -moz-border-radius-bottomleft: 4px;
+  -webkit-border-bottom-left-radius: 4px;
+  border-bottom-left-radius: 4px;
+  -moz-border-radius-bottomright: 4px;
+  -webkit-border-bottom-right-radius: 4px;
+  border-bottom-right-radius: 4px;
+}
+/* line 38, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/utilities/general/_clearfix.scss */
+.lb-dataContainer:after {
+  content: "";
+  display: table;
+  clear: both;
+}
+
+/* line 103, ../sass/lightbox.sass */
+.lb-data {
+  padding: 0 4px;
+  color: #bbbbbb;
+}
+/* line 106, ../sass/lightbox.sass */
+.lb-data .lb-details {
+  width: 85%;
+  float: left;
+  text-align: left;
+  line-height: 1.1em;
+}
+/* line 111, ../sass/lightbox.sass */
+.lb-data .lb-caption {
+  font-size: 13px;
+  font-weight: bold;
+  line-height: 1em;
+}
+/* line 115, ../sass/lightbox.sass */
+.lb-data .lb-number {
+  display: block;
+  clear: left;
+  padding-bottom: 1em;
+  font-size: 12px;
+  color: #999999;
+}
+/* line 121, ../sass/lightbox.sass */
+.lb-data .lb-close {
+  display: block;
+  float: right;
+  width: 30px;
+  height: 30px;
+  background: url(../img/close.png) top right no-repeat;
+  text-align: right;
+  outline: none;
+  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=70);
+  opacity: 0.7;
+}
+/* line 130, ../sass/lightbox.sass */
+.lb-data .lb-close:hover {
+  cursor: pointer;
+  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=100);
+  opacity: 1;
+}
diff --git a/public/lightbox/css/screen.css b/public/lightbox/css/screen.css
new file mode 100644
index 0000000..17bfddb
--- /dev/null
+++ b/public/lightbox/css/screen.css
@@ -0,0 +1,522 @@
+/* line 17, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
+html, body, div, span, applet, object, iframe,
+h1, h2, h3, h4, h5, h6, p, blockquote, pre,
+a, abbr, acronym, address, big, cite, code,
+del, dfn, em, img, ins, kbd, q, s, samp,
+small, strike, strong, sub, sup, tt, var,
+b, u, i, center,
+dl, dt, dd, ol, ul, li,
+fieldset, form, label, legend,
+table, caption, tbody, tfoot, thead, tr, th, td,
+article, aside, canvas, details, embed,
+figure, figcaption, footer, header, hgroup,
+menu, nav, output, ruby, section, summary,
+time, mark, audio, video {
+  margin: 0;
+  padding: 0;
+  border: 0;
+  font: inherit;
+  font-size: 100%;
+  vertical-align: baseline;
+}
+
+/* line 22, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
+html {
+  line-height: 1;
+}
+
+/* line 24, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
+ol, ul {
+  list-style: none;
+}
+
+/* line 26, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
+table {
+  border-collapse: collapse;
+  border-spacing: 0;
+}
+
+/* line 28, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
+caption, th, td {
+  text-align: left;
+  font-weight: normal;
+  vertical-align: middle;
+}
+
+/* line 30, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
+q, blockquote {
+  quotes: none;
+}
+/* line 103, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
+q:before, q:after, blockquote:before, blockquote:after {
+  content: "";
+  content: none;
+}
+
+/* line 32, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
+a img {
+  border: none;
+}
+
+/* line 116, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
+article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary {
+  display: block;
+}
+
+/* Typography
+ *----------------------------------------------- */
+/* line 10, ../sass/screen.sass */
+body,
+input,
+textarea {
+  color: #cccccc;
+  font-size: 18px;
+  font-family: "Karla", "lucida grande", sans-serif;
+}
+
+/* line 17, ../sass/screen.sass */
+h1,
+h2,
+h3,
+h4,
+h5,
+h6 {
+  line-height: 1.2em;
+  color: #fdf485;
+}
+
+/* line 26, ../sass/screen.sass */
+h1 {
+  font-size: 72px;
+  line-height: 1em;
+}
+
+/* line 30, ../sass/screen.sass */
+h2 {
+  font-size: 48px;
+  line-height: 1.2em;
+  margin-bottom: 0.3em;
+}
+
+/* line 35, ../sass/screen.sass */
+h3 {
+  font-size: 18px;
+  text-transform: uppercase;
+  letter-spacing: 0.1em;
+  color: #e5d404;
+  margin-bottom: 0.3em;
+}
+
+/* line 42, ../sass/screen.sass */
+h4 {
+  font-size: 18px;
+}
+
+/* line 45, ../sass/screen.sass */
+p {
+  line-height: 1.4em;
+  margin-bottom: 1em;
+}
+
+/* line 49, ../sass/screen.sass */
+ol {
+  list-style-type: decimal;
+}
+
+/* line 52, ../sass/screen.sass */
+ul, ol {
+  margin: 0 0 1.25em 0;
+}
+
+/* line 55, ../sass/screen.sass */
+li {
+  padding-bottom: 0.8em;
+  margin-bottom: 0.8em;
+  border-bottom: 2px solid #515151;
+  line-height: 1.3em;
+}
+/* line 60, ../sass/screen.sass */
+li.last-list-item {
+  border-bottom: none;
+}
+
+/* line 63, ../sass/screen.sass */
+dt {
+  font-weight: bold;
+}
+
+/* line 66, ../sass/screen.sass */
+dd {
+  margin-bottom: 1.625em;
+}
+
+/* line 69, ../sass/screen.sass */
+strong {
+  font-weight: bold;
+}
+
+/* line 72, ../sass/screen.sass */
+i {
+  font-style: italic;
+}
+
+/* line 75, ../sass/screen.sass */
+pre {
+  padding: 10px;
+  margin-top: 5px;
+  margin-bottom: 10px;
+  background-color: #2b2b2b;
+  font: 13px "Andale Mono", "DejaVu Sans Mono", monospace;
+  line-height: 1.5em;
+  -webkit-border-radius: 4px;
+  -moz-border-radius: 4px;
+  -ms-border-radius: 4px;
+  -o-border-radius: 4px;
+  border-radius: 4px;
+  overflow-x: auto;
+}
+
+/* line 85, ../sass/screen.sass */
+code, kbd {
+  padding: 4px;
+  color: #ac8053;
+  background-color: #2b2b2b;
+  font: 13px "Andale Mono", "DejaVu Sans Mono", monospace;
+  -webkit-border-radius: 4px;
+  -moz-border-radius: 4px;
+  -ms-border-radius: 4px;
+  -o-border-radius: 4px;
+  border-radius: 4px;
+}
+
+/* line 92, ../sass/screen.sass */
+code {
+  position: relative;
+  top: -1px;
+}
+
+/* line 96, ../sass/screen.sass */
+pre code {
+  top: 0;
+  padding: 0;
+  background: transparent;
+  -webkit-box-shadow: none;
+  -moz-box-shadow: none;
+  box-shadow: none;
+  font-size: 13px;
+}
+
+/* line 103, ../sass/screen.sass */
+a {
+  color: #00bfa8;
+  text-decoration: none;
+}
+/* line 106, ../sass/screen.sass */
+a:hover {
+  color: #59ffeb;
+}
+
+/* line 109, ../sass/screen.sass */
+::-moz-selection,
+::selection {
+  background: #ff8000;
+  color: white;
+}
+
+/* line 114, ../sass/screen.sass */
+.sub-point {
+  display: block;
+  font-size: 14px;
+}
+/* line 117, ../sass/screen.sass */
+.sub-point code {
+  font-size: 12px;
+  padding: 2px;
+}
+
+/* -- Layout ------------------------------------------------------------------ */
+/* line 124, ../sass/screen.sass */
+body {
+  margin: 40px 40px 80px 40px;
+  background: #444444;
+}
+
+/* line 128, ../sass/screen.sass */
+.wrapper {
+  max-width: 740px;
+  margin: 0 auto;
+}
+
+/* line 132, ../sass/screen.sass */
+.section {
+  padding: 0 0 40px 0;
+  margin-bottom: 40px;
+  *zoom: 1;
+  border-bottom: 4px solid #373737;
+}
+/* line 38, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/utilities/general/_clearfix.scss */
+.section:after {
+  content: "";
+  display: table;
+  clear: both;
+}
+/* line 137, ../sass/screen.sass */
+.section.last {
+  border-bottom: none;
+}
+
+/* line 140, ../sass/screen.sass */
+.section-header {
+  text-align: center;
+}
+
+/* line 143, ../sass/screen.sass */
+.section-subheader {
+  margin-top: -0.6em;
+  margin-bottom: 1em;
+  text-align: center;
+  font-size: 24px;
+}
+
+/* line 149, ../sass/screen.sass */
+.row {
+  *zoom: 1;
+}
+/* line 38, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/utilities/general/_clearfix.scss */
+.row:after {
+  content: "";
+  display: table;
+  clear: both;
+}
+
+/* -- Sections ------------------------------------------------------------------ */
+/* -- Intro -- */
+/* line 156, ../sass/screen.sass */
+.intro-section {
+  text-align: center;
+}
+
+/* line 159, ../sass/screen.sass */
+.logo {
+  color: white;
+  margin-bottom: 0.05em;
+}
+/* line 162, ../sass/screen.sass */
+.logo .version {
+  color: #fdf485;
+}
+
+/* line 165, ../sass/screen.sass */
+.author {
+  margin-top: -9px;
+  padding-left: 23px;
+  line-height: 1.2em;
+}
+
+/* line 170, ../sass/screen.sass */
+.author-links {
+  font-size: 16px;
+}
+
+/* line 173, ../sass/screen.sass */
+.lead {
+  font-size: 22px;
+}
+
+/* -- Examples -- */
+/* line 177, ../sass/screen.sass */
+.examples-section {
+  text-align: center;
+}
+
+/* line 180, ../sass/screen.sass */
+.image-row {
+  *zoom: 1;
+  margin-bottom: 20px;
+}
+/* line 38, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/utilities/general/_clearfix.scss */
+.image-row:after {
+  content: "";
+  display: table;
+  clear: both;
+}
+
+/* line 184, ../sass/screen.sass */
+.example-image-link {
+  display: inline-block;
+  margin: 0 10px 20px 10px;
+  line-height: 0;
+  -webkit-border-radius: 4px;
+  -moz-border-radius: 4px;
+  -ms-border-radius: 4px;
+  -o-border-radius: 4px;
+  border-radius: 4px;
+  border: 4px solid #5e5e5e;
+  -webkit-transition: all 0.1s ease-out;
+  -moz-transition: all 0.1s ease-out;
+  -o-transition: all 0.1s ease-out;
+  transition: all 0.1s ease-out;
+}
+/* line 191, ../sass/screen.sass */
+.example-image-link:hover {
+  border: 4px solid #00bfa8;
+}
+
+/* line 194, ../sass/screen.sass */
+.example-image {
+  -webkit-border-radius: 2px;
+  -moz-border-radius: 2px;
+  -ms-border-radius: 2px;
+  -o-border-radius: 2px;
+  border-radius: 2px;
+}
+
+/* -- Download -- */
+/* line 199, ../sass/screen.sass */
+.download-section {
+  text-align: center;
+}
+
+/* line 202, ../sass/screen.sass */
+.download-button {
+  display: block;
+  max-width: 300px;
+  margin: 0 auto 20px auto;
+  padding-top: 20px;
+  padding-bottom: 10px;
+  background-color: #2b2b2b;
+  border: 4px solid #444444;
+  -webkit-border-radius: 4px;
+  -moz-border-radius: 4px;
+  -ms-border-radius: 4px;
+  -o-border-radius: 4px;
+  border-radius: 4px;
+  -webkit-transition: all 0.1s ease-out;
+  -moz-transition: all 0.1s ease-out;
+  -o-transition: all 0.1s ease-out;
+  transition: all 0.1s ease-out;
+  *zoom: 1;
+}
+/* line 38, ../../../../.rvm/gems/ruby-1.9.3-p392/gems/compass-0.12.2/frameworks/compass/stylesheets/compass/utilities/general/_clearfix.scss */
+.download-button:after {
+  content: "";
+  display: table;
+  clear: both;
+}
+/* line 213, ../sass/screen.sass */
+.download-button:hover {
+  border-color: #00bfa8;
+  background-color: #444444;
+}
+/* line 216, ../sass/screen.sass */
+.download-button .file {
+  font-size: 36px;
+  color: white;
+  line-height: 1em;
+}
+/* line 220, ../sass/screen.sass */
+.download-button .version {
+  font-size: 24px;
+  color: #00bfa8;
+}
+
+/* -- Sharing -- */
+/* line 226, ../sass/screen.sass */
+.sharing {
+  position: fixed;
+  top: 20px;
+  right: 0;
+}
+
+/* -- Donate -- */
+/* line 233, ../sass/screen.sass */
+.donate-button-form {
+  text-align: center;
+}
+
+/* line 235, ../sass/screen.sass */
+.donate-button {
+  border: 4px solid rgba(0, 0, 0, 0);
+  -webkit-border-radius: 4px;
+  -moz-border-radius: 4px;
+  -ms-border-radius: 4px;
+  -o-border-radius: 4px;
+  border-radius: 4px;
+  -webkit-transition: all 0.1s ease-out;
+  -moz-transition: all 0.1s ease-out;
+  -o-transition: all 0.1s ease-out;
+  transition: all 0.1s ease-out;
+}
+/* line 239, ../sass/screen.sass */
+.donate-button:hover {
+  background-color: #444444;
+  border-color: #00bfa8;
+}
+
+/* -- Responsive design -------------------------------------------------------------- */
+@media only screen and (max-width: 640px) {
+  /* line 247, ../sass/screen.sass */
+  body {
+    margin: 80px 10px 40px 10px;
+    font-size: 14px;
+  }
+
+  /* line 250, ../sass/screen.sass */
+  h1 {
+    font-size: 48px;
+  }
+
+  /* line 252, ../sass/screen.sass */
+  h2 {
+    font-size: 26px;
+  }
+
+  /* line 254, ../sass/screen.sass */
+  h3 {
+    font-size: 16px;
+  }
+
+  /* line 256, ../sass/screen.sass */
+  ol {
+    list-style-position: inside;
+  }
+
+  /* line 258, ../sass/screen.sass */
+  code,
+  kbd,
+  pre,
+  pre code {
+    font-size: 11px;
+  }
+
+  /* line 263, ../sass/screen.sass */
+  .sub-point {
+    font-size: 12px;
+  }
+  /* line 265, ../sass/screen.sass */
+  .sub-point code {
+    font-size: 9px;
+  }
+
+  /* line 267, ../sass/screen.sass */
+  .lead {
+    font-size: 16px;
+  }
+
+  /* line 269, ../sass/screen.sass */
+  .section {
+    padding-bottom: 20px;
+    margin-bottom: 20px;
+  }
+
+  /* line 272, ../sass/screen.sass */
+  .author {
+    margin-top: -5px;
+    padding-left: 30px;
+  }
+
+  /* line 275, ../sass/screen.sass */
+  .author-links {
+    font-size: 12px;
+  }
+}
diff --git a/public/lightbox/img/close.png b/public/lightbox/img/close.png
new file mode 100644
index 0000000..20baa1d
Binary files /dev/null and b/public/lightbox/img/close.png differ
diff --git a/public/lightbox/img/demopage/donate.png b/public/lightbox/img/demopage/donate.png
new file mode 100644
index 0000000..187ec5c
Binary files /dev/null and b/public/lightbox/img/demopage/donate.png differ
diff --git a/public/lightbox/img/demopage/favicon.ico b/public/lightbox/img/demopage/favicon.ico
new file mode 100644
index 0000000..6dec42e
Binary files /dev/null and b/public/lightbox/img/demopage/favicon.ico differ
diff --git a/public/lightbox/img/demopage/image-1.jpg b/public/lightbox/img/demopage/image-1.jpg
new file mode 100644
index 0000000..fe2e1cb
Binary files /dev/null and b/public/lightbox/img/demopage/image-1.jpg differ
diff --git a/public/lightbox/img/demopage/image-2.jpg b/public/lightbox/img/demopage/image-2.jpg
new file mode 100644
index 0000000..1f4f5df
Binary files /dev/null and b/public/lightbox/img/demopage/image-2.jpg differ
diff --git a/public/lightbox/img/demopage/image-3.jpg b/public/lightbox/img/demopage/image-3.jpg
new file mode 100644
index 0000000..b6d5798
Binary files /dev/null and b/public/lightbox/img/demopage/image-3.jpg differ
diff --git a/public/lightbox/img/demopage/image-4.jpg b/public/lightbox/img/demopage/image-4.jpg
new file mode 100644
index 0000000..a7e9dba
Binary files /dev/null and b/public/lightbox/img/demopage/image-4.jpg differ
diff --git a/public/lightbox/img/demopage/image-5.jpg b/public/lightbox/img/demopage/image-5.jpg
new file mode 100644
index 0000000..c75fba5
Binary files /dev/null and b/public/lightbox/img/demopage/image-5.jpg differ
diff --git a/public/lightbox/img/demopage/image-6.jpg b/public/lightbox/img/demopage/image-6.jpg
new file mode 100644
index 0000000..95b3523
Binary files /dev/null and b/public/lightbox/img/demopage/image-6.jpg differ
diff --git a/public/lightbox/img/demopage/thumb-1.jpg b/public/lightbox/img/demopage/thumb-1.jpg
new file mode 100644
index 0000000..0d2c4b6
Binary files /dev/null and b/public/lightbox/img/demopage/thumb-1.jpg differ
diff --git a/public/lightbox/img/demopage/thumb-2.jpg b/public/lightbox/img/demopage/thumb-2.jpg
new file mode 100644
index 0000000..39de856
Binary files /dev/null and b/public/lightbox/img/demopage/thumb-2.jpg differ
diff --git a/public/lightbox/img/demopage/thumb-3.jpg b/public/lightbox/img/demopage/thumb-3.jpg
new file mode 100644
index 0000000..6acf4f9
Binary files /dev/null and b/public/lightbox/img/demopage/thumb-3.jpg differ
diff --git a/public/lightbox/img/demopage/thumb-4.jpg b/public/lightbox/img/demopage/thumb-4.jpg
new file mode 100644
index 0000000..634e982
Binary files /dev/null and b/public/lightbox/img/demopage/thumb-4.jpg differ
diff --git a/public/lightbox/img/demopage/thumb-5.jpg b/public/lightbox/img/demopage/thumb-5.jpg
new file mode 100644
index 0000000..4bb7d48
Binary files /dev/null and b/public/lightbox/img/demopage/thumb-5.jpg differ
diff --git a/public/lightbox/img/demopage/thumb-6.jpg b/public/lightbox/img/demopage/thumb-6.jpg
new file mode 100644
index 0000000..9628f0b
Binary files /dev/null and b/public/lightbox/img/demopage/thumb-6.jpg differ
diff --git a/public/lightbox/img/loading.gif b/public/lightbox/img/loading.gif
new file mode 100644
index 0000000..5087c2a
Binary files /dev/null and b/public/lightbox/img/loading.gif differ
diff --git a/public/lightbox/img/next.png b/public/lightbox/img/next.png
new file mode 100644
index 0000000..08365ac
Binary files /dev/null and b/public/lightbox/img/next.png differ
diff --git a/public/lightbox/img/prev.png b/public/lightbox/img/prev.png
new file mode 100644
index 0000000..329fa98
Binary files /dev/null and b/public/lightbox/img/prev.png differ
diff --git a/public/lightbox/index.html b/public/lightbox/index.html
new file mode 100644
index 0000000..7b62126
--- /dev/null
+++ b/public/lightbox/index.html
@@ -0,0 +1,179 @@
+<!DOCTYPE html>
+<html lang="en-us">
+<head>
+	<meta charset="utf-8">
+
+	<title>Lightbox 2</title>
+
+	<meta name="description" lang="en" content="Lightbox 2 is a script used to overlay images on the current page. It's a snap to setup and works on all modern browsers."/>
+	<meta name="author" content="Lokesh Dhakar">
+	<meta name="viewport" content="width=device-width,initial-scale=1">
+
+	<script src="js/modernizr.custom.js"></script>
+
+	<link rel="shortcut icon" href="img/demopage/favicon.ico">
+	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Karla:400,700">
+	<link rel="stylesheet" href="css/screen.css" media="screen"/>
+	<link rel="stylesheet" href="css/lightbox.css" media="screen"/>
+</head>
+<body>
+
+<div class="wrapper">
+
+	<section id="intro" class="section intro-section">
+		<header>
+			<h1 class="logo">Lightbox<em class="version">2</em></h1>
+		</header>
+		<p class="author">
+			by Lokesh Dhakar<br />
+			<span class="author-links">
+				<a href="https://twitter.com/intent/user?screen_name=lokesh">Follow me on Twitter</a>
+			</span>
+		</p>
+		<p class="lead">
+			Lightbox is small javascript library used to overlay images on top of the current page. It's a <em>snap to setup</em> and works on <em>all modern browsers</em>.
+		</p>
+	</section>
+
+	<section id="examples" class="section examples-section">
+		<header>
+			<h2 class="section-header">Examples</h2>
+		</header>
+
+		<h3>Single images</h3>
+		<div class="image-row">
+			<a class="example-image-link" href="img/demopage/image-1.jpg" data-lightbox="example-1"><img class="example-image" src="img/demopage/thumb-1.jpg" alt="thumb-1" width="150" height="150"/></a>
+			<a class="example-image-link" href="img/demopage/image-2.jpg" data-lightbox="example-2" title="Optional caption."><img class="example-image" src="img/demopage/thumb-2.jpg" alt="thumb-1" width="150" height="150"/></a>
+		</div>
+
+		<h3 style="clear: both;">An image set</h3>
+
+		<div class="image-row">
+			<div class="image-set">
+				<a class="example-image-link" href="img/demopage/image-3.jpg" data-lightbox="example-set" title="Click on the right side of the image to move forward."><img class="example-image" src="img/demopage/thumb-3.jpg" alt="Plants: image 1 0f 4 thumb" width="150" height="150"/></a>
+				<a class="example-image-link" href="img/demopage/image-4.jpg" data-lightbox="example-set" title="Or press the right arrow on your keyboard."><img class="example-image" src="img/demopage/thumb-4.jpg" alt="Plants: image 2 0f 4 thumb" width="150" height="150"/></a>
+				<a class="example-image-link" href="img/demopage/image-5.jpg" data-lightbox="example-set" title="The script preloads the next image in the set as you're viewing."><img class="example-image" src="img/demopage/thumb-5.jpg" alt="Plants: image 3 0f 4 thumb" width="150" height="150"/></a>
+				<a class="example-image-link" href="img/demopage/image-6.jpg" data-lightbox="example-set" title="Click anywhere outside the image or the X to the right to close."><img class="example-image" src="img/demopage/thumb-6.jpg" alt="Plants: image 4 0f 4 thumb" width="150" height="150"/></a>
+			</div>
+		</div>
+	</section>
+
+	<section id="download" class="section download-section">
+		<header>
+			<h2 class="section-header">Download</h2>
+		</header>
+
+		<a href="releases/lightbox2.6.zip" class="download-button">
+			<div class="file">
+				Lightbox
+				<div class="version">
+					v2.6
+				</div>
+			</div>
+		</a>
+
+		<p>
+			Lightbox2 is open-source.<br/>View and fork the code on <a href="https://github.com/lokesh/lightbox2">Github</a>.
+		</p>
+	</section>
+
+	<section id="how-to-use" class="section how-to-use-section">
+		<header>
+			<h2 class="section-header">How to use</h2>
+			<h2 class="section-subheader">Step-by-step instructions</h2>
+		</header>
+		<h3>Part 1 - Get setup</h3>
+		<ol>
+			<li>Download and unzip the latest version of Lightbox from above.</li>
+			<li>Look inside the <code>js</code> folder to find <code>jquery-1.10.2.min.js</code> and <code>lightbox-2.6.min.js</code> and load both of these files from your html page. Load jQuery first:
+<pre><code>&lt;script src=&quot;js/jquery-1.10.2.min.js&quot;&gt;&lt;/script&gt;
+&lt;script src=&quot;js/lightbox-2.6.min.js&quot;&gt;&lt;/script&gt;
+</code></pre></li>
+			<li>Look inside the <code>css</code> folder to find <code>lightbox.css</code> and load it from your html page:
+<pre><code>&lt;link href=&quot;css/lightbox.css&quot; rel=&quot;stylesheet&quot; /&gt;
+</code></pre>
+			</li>
+			<li>Look inside the <code>img</code> folder to find <code>close.png</code>, <code>loading.gif</code>, <code>prev.png</code>, and <code>next.png</code>. These files are used in <code>lightbox.css</code>. By default, <code>lightbox.css</code> will look for these images in a folder called <code>img</code>.</li>
+		</ol>
+		<h3>Part 2 - Turn it on</h3>
+	<ul>
+			<li>Add a <code>data-lightbox</code> attribute to any image link to activate Lightbox. For the value of the attribute, use a unique name for each image. For example:
+<pre><code>&lt;a href=&quot;img/image-1.jpg&quot; data-lightbox=&quot;image-1&quot; title=&quot;My caption&quot;&gt;image #1&lt;/a&gt;
+</code></pre>
+			 <div class="sub-point"><em>Optional:</em> Set the <code>title</code> attribute if you want to show a caption.</div> </li>
+			<li>If you have a group of related images that you would like to combine into a set, use the same <code>data-lightbox</code> attribute value for all of the images. For example:
+<pre><code>&lt;a href=&quot;img/image-2.jpg&quot; data-lightbox=&quot;roadtrip&quot;&gt;image #2&lt;/a&gt;
+&lt;a href=&quot;img/image-3.jpg&quot; data-lightbox=&quot;roadtrip&quot;&gt;image #3&lt;/a&gt;
+&lt;a href=&quot;img/image-4.jpg&quot; data-lightbox=&quot;roadtrip&quot;&gt;image #4&lt;/a&gt;
+</code></pre></li>
+<li class="last-list-item"><div class="sub-point">For you long time Lightbox users, don't fret, you can still enable Lightbox by using <code>rel="lightbox"</code>. The new <code>data-lightbox</code> approach is preferred though as it is valid html.</div></li>
+	</li>
+		</ul>
+	</section>
+
+
+	<section id="questions" class="section questions-section">
+		<header>
+			<h2 class="section-header">Help</h2>
+		</header>
+		<h3>Bugs</h3>
+		<p>If you find a bug, create an <a href="https://github.com/lokesh/lightbox2/issues">issue on Github</a>. Include your operating system and browser version along with detailed steps to reproduce the bug.</p>
+
+		<h3>Feature requests</h3>
+		<p>If you want a feature added, please create an <a href="https://github.com/lokesh/lightbox2/issues">issue on Github</a>. Someone else or I might be able to help out. No guarantees.</p>
+
+		<h3>Support questions</h3>
+		<p>If you have a question that is not a bug or a feature request, your best chance of getting an answer is by following these steps:</p>
+		<ol class="simple-list">
+			<li><a href="http://lokeshdhakar.com/forums">Search the Lightbox forums</a>. <br /><span class="sub-point">You will not be able to post new questions in the forum as posting has been disabled. The forum is having spam problems and the forum will eventually be phased out.</span></li>
+			<li><a href="http://stackoverflow.com/">Search Stackoverflow</a>.</li>
+			<li><a href="http://stackoverflow.com/questions/ask">Create a new question on Stackoverflow</a>.</li>
+		</ol>
+	</section>
+
+	<section id="doante" class="section donate-section last">
+		<header>
+			<h2 class="section-header">Donate</h2>
+		</header>
+		<p>
+			Lightbox is completely free to use. If you're using Lightbox on a commercial project and are feeling generous, consider a donation. Thanks!
+		</p>
+		<form class="donate-button-form" name="_xclick" action="https://www.paypal.com/cgi-bin/webscr" method="post">
+			<fieldset>
+				<input type="hidden" name="cmd" value="_xclick">
+				<input type="hidden" name="business" value="lokesh.dhakar@gmail.com">
+				<input type="hidden" name="item_name" value="Donation for Lightbox">
+				<input type="hidden" name="no_note" value="1">
+				<input type="hidden" name="currency_code" value="USD">
+				<input type="hidden" name="tax" value="0">
+				<input type="hidden" name="bn" value="PP-DonationsBF">
+				<input type="image" src="img/demopage/donate.png" name="submit" class="donate-button" alt="Make payments with PayPal - it's fast, free and secure!">
+			</fieldset>
+		</form>
+	</section>
+
+	<section id="sharing" class="sharing">
+		<a href="https://twitter.com/share" class="twitter-share-button" data-via="lokesh" data-size="large">Tweet</a>
+		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
+	</section>
+
+
+	<script src="js/jquery-1.10.2.min.js"></script>
+	<script src="js/lightbox-2.6.min.js"></script>
+
+	<script>
+	var _gaq = _gaq || [];
+	_gaq.push(['_setAccount', 'UA-2196019-1']);
+	_gaq.push(['_trackPageview']);
+
+	(function() {
+		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
+		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
+		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
+	})();
+	</script>
+
+</div>
+
+</body>
+</html>
diff --git a/public/lightbox/js/jquery-1.10.2.min.js b/public/lightbox/js/jquery-1.10.2.min.js
new file mode 100644
index 0000000..da41706
--- /dev/null
+++ b/public/lightbox/js/jquery-1.10.2.min.js
@@ -0,0 +1,6 @@
+/*! jQuery v1.10.2 | (c) 2005, 2013 jQuery Foundation, Inc. | jquery.org/license
+//@ sourceMappingURL=jquery-1.10.2.min.map
+*/
+(function(e,t){var n,r,i=typeof t,o=e.location,a=e.document,s=a.documentElement,l=e.jQuery,u=e.$,c={},p=[],f="1.10.2",d=p.concat,h=p.push,g=p.slice,m=p.indexOf,y=c.toString,v=c.hasOwnProperty,b=f.trim,x=function(e,t){return new x.fn.init(e,t,r)},w=/[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,T=/\S+/g,C=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,N=/^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/,k=/^<(\w+)\s*\/?>(?:<\/\1>|)$/,E=/^[\],:{}\s]*$/,S=/(?:^|:|,)(?:\s*\[)+/g,A=/\\(?:["\\\/bfnrt]|u[\da-fA-F]{4})/g,j=/"[^"\\\r\n]*"|true|false|null|-?(?:\d+\.|)\d+(?:[eE][+-]?\d+|)/g,D=/^-ms-/,L=/-([\da-z])/gi,H=function(e,t){return t.toUpperCase()},q=function(e){(a.addEventListener||"load"===e.type||"complete"===a.readyState)&&(_(),x.ready())},_=function(){a.addEventListener?(a.removeEventListener("DOMContentLoaded",q,!1),e.removeEventListener("load",q,!1)):(a.detachEvent("onreadystatechange",q),e.detachEvent("onload",q))};x.fn=x.prototype={jquery:f,constructor:x,init:function(e,n,r){var i,o;if(!e)return this;if("string"==typeof e){if(i="<"===e.charAt(0)&&">"===e.charAt(e.length-1)&&e.length>=3?[null,e,null]:N.exec(e),!i||!i[1]&&n)return!n||n.jquery?(n||r).find(e):this.constructor(n).find(e);if(i[1]){if(n=n instanceof x?n[0]:n,x.merge(this,x.parseHTML(i[1],n&&n.nodeType?n.ownerDocument||n:a,!0)),k.test(i[1])&&x.isPlainObject(n))for(i in n)x.isFunction(this[i])?this[i](n[i]):this.attr(i,n[i]);return this}if(o=a.getElementById(i[2]),o&&o.parentNode){if(o.id!==i[2])return r.find(e);this.length=1,this[0]=o}return this.context=a,this.selector=e,this}return e.nodeType?(this.context=this[0]=e,this.length=1,this):x.isFunction(e)?r.ready(e):(e.selector!==t&&(this.selector=e.selector,this.context=e.context),x.makeArray(e,this))},selector:"",length:0,toArray:function(){return g.call(this)},get:function(e){return null==e?this.toArray():0>e?this[this.length+e]:this[e]},pushStack:function(e){var t=x.merge(this.constructor(),e);return t.prevObject=this,t.context=this.context,t},each:function(e,t){return x.each(this,e,t)},ready:function(e){return x.ready.promise().done(e),this},slice:function(){return this.pushStack(g.apply(this,arguments))},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},eq:function(e){var t=this.length,n=+e+(0>e?t:0);return this.pushStack(n>=0&&t>n?[this[n]]:[])},map:function(e){return this.pushStack(x.map(this,function(t,n){return e.call(t,n,t)}))},end:function(){return this.prevObject||this.constructor(null)},push:h,sort:[].sort,splice:[].splice},x.fn.init.prototype=x.fn,x.extend=x.fn.extend=function(){var e,n,r,i,o,a,s=arguments[0]||{},l=1,u=arguments.length,c=!1;for("boolean"==typeof s&&(c=s,s=arguments[1]||{},l=2),"object"==typeof s||x.isFunction(s)||(s={}),u===l&&(s=this,--l);u>l;l++)if(null!=(o=arguments[l]))for(i in o)e=s[i],r=o[i],s!==r&&(c&&r&&(x.isPlainObject(r)||(n=x.isArray(r)))?(n?(n=!1,a=e&&x.isArray(e)?e:[]):a=e&&x.isPlainObject(e)?e:{},s[i]=x.extend(c,a,r)):r!==t&&(s[i]=r));return s},x.extend({expando:"jQuery"+(f+Math.random()).replace(/\D/g,""),noConflict:function(t){return e.$===x&&(e.$=u),t&&e.jQuery===x&&(e.jQuery=l),x},isReady:!1,readyWait:1,holdReady:function(e){e?x.readyWait++:x.ready(!0)},ready:function(e){if(e===!0?!--x.readyWait:!x.isReady){if(!a.body)return setTimeout(x.ready);x.isReady=!0,e!==!0&&--x.readyWait>0||(n.resolveWith(a,[x]),x.fn.trigger&&x(a).trigger("ready").off("ready"))}},isFunction:function(e){return"function"===x.type(e)},isArray:Array.isArray||function(e){return"array"===x.type(e)},isWindow:function(e){return null!=e&&e==e.window},isNumeric:function(e){return!isNaN(parseFloat(e))&&isFinite(e)},type:function(e){return null==e?e+"":"object"==typeof e||"function"==typeof e?c[y.call(e)]||"object":typeof e},isPlainObject:function(e){var n;if(!e||"object"!==x.type(e)||e.nodeType||x.isWindow(e))return!1;try{if(e.constructor&&!v.call(e,"constructor")&&!v.call(e.constructor.prototype,"isPrototypeOf"))return!1}catch(r){return!1}if(x.support.ownLast)for(n in e)return v.call(e,n);for(n in e);return n===t||v.call(e,n)},isEmptyObject:function(e){var t;for(t in e)return!1;return!0},error:function(e){throw Error(e)},parseHTML:function(e,t,n){if(!e||"string"!=typeof e)return null;"boolean"==typeof t&&(n=t,t=!1),t=t||a;var r=k.exec(e),i=!n&&[];return r?[t.createElement(r[1])]:(r=x.buildFragment([e],t,i),i&&x(i).remove(),x.merge([],r.childNodes))},parseJSON:function(n){return e.JSON&&e.JSON.parse?e.JSON.parse(n):null===n?n:"string"==typeof n&&(n=x.trim(n),n&&E.test(n.replace(A,"@").replace(j,"]").replace(S,"")))?Function("return "+n)():(x.error("Invalid JSON: "+n),t)},parseXML:function(n){var r,i;if(!n||"string"!=typeof n)return null;try{e.DOMParser?(i=new DOMParser,r=i.parseFromString(n,"text/xml")):(r=new ActiveXObject("Microsoft.XMLDOM"),r.async="false",r.loadXML(n))}catch(o){r=t}return r&&r.documentElement&&!r.getElementsByTagName("parsererror").length||x.error("Invalid XML: "+n),r},noop:function(){},globalEval:function(t){t&&x.trim(t)&&(e.execScript||function(t){e.eval.call(e,t)})(t)},camelCase:function(e){return e.replace(D,"ms-").replace(L,H)},nodeName:function(e,t){return e.nodeName&&e.nodeName.toLowerCase()===t.toLowerCase()},each:function(e,t,n){var r,i=0,o=e.length,a=M(e);if(n){if(a){for(;o>i;i++)if(r=t.apply(e[i],n),r===!1)break}else for(i in e)if(r=t.apply(e[i],n),r===!1)break}else if(a){for(;o>i;i++)if(r=t.call(e[i],i,e[i]),r===!1)break}else for(i in e)if(r=t.call(e[i],i,e[i]),r===!1)break;return e},trim:b&&!b.call("\ufeff\u00a0")?function(e){return null==e?"":b.call(e)}:function(e){return null==e?"":(e+"").replace(C,"")},makeArray:function(e,t){var n=t||[];return null!=e&&(M(Object(e))?x.merge(n,"string"==typeof e?[e]:e):h.call(n,e)),n},inArray:function(e,t,n){var r;if(t){if(m)return m.call(t,e,n);for(r=t.length,n=n?0>n?Math.max(0,r+n):n:0;r>n;n++)if(n in t&&t[n]===e)return n}return-1},merge:function(e,n){var r=n.length,i=e.length,o=0;if("number"==typeof r)for(;r>o;o++)e[i++]=n[o];else while(n[o]!==t)e[i++]=n[o++];return e.length=i,e},grep:function(e,t,n){var r,i=[],o=0,a=e.length;for(n=!!n;a>o;o++)r=!!t(e[o],o),n!==r&&i.push(e[o]);return i},map:function(e,t,n){var r,i=0,o=e.length,a=M(e),s=[];if(a)for(;o>i;i++)r=t(e[i],i,n),null!=r&&(s[s.length]=r);else for(i in e)r=t(e[i],i,n),null!=r&&(s[s.length]=r);return d.apply([],s)},guid:1,proxy:function(e,n){var r,i,o;return"string"==typeof n&&(o=e[n],n=e,e=o),x.isFunction(e)?(r=g.call(arguments,2),i=function(){return e.apply(n||this,r.concat(g.call(arguments)))},i.guid=e.guid=e.guid||x.guid++,i):t},access:function(e,n,r,i,o,a,s){var l=0,u=e.length,c=null==r;if("object"===x.type(r)){o=!0;for(l in r)x.access(e,n,l,r[l],!0,a,s)}else if(i!==t&&(o=!0,x.isFunction(i)||(s=!0),c&&(s?(n.call(e,i),n=null):(c=n,n=function(e,t,n){return c.call(x(e),n)})),n))for(;u>l;l++)n(e[l],r,s?i:i.call(e[l],l,n(e[l],r)));return o?e:c?n.call(e):u?n(e[0],r):a},now:function(){return(new Date).getTime()},swap:function(e,t,n,r){var i,o,a={};for(o in t)a[o]=e.style[o],e.style[o]=t[o];i=n.apply(e,r||[]);for(o in t)e.style[o]=a[o];return i}}),x.ready.promise=function(t){if(!n)if(n=x.Deferred(),"complete"===a.readyState)setTimeout(x.ready);else if(a.addEventListener)a.addEventListener("DOMContentLoaded",q,!1),e.addEventListener("load",q,!1);else{a.attachEvent("onreadystatechange",q),e.attachEvent("onload",q);var r=!1;try{r=null==e.frameElement&&a.documentElement}catch(i){}r&&r.doScroll&&function o(){if(!x.isReady){try{r.doScroll("left")}catch(e){return setTimeout(o,50)}_(),x.ready()}}()}return n.promise(t)},x.each("Boolean Number String Function Array Date RegExp Object Error".split(" "),function(e,t){c["[object "+t+"]"]=t.toLowerCase()});function M(e){var t=e.length,n=x.type(e);return x.isWindow(e)?!1:1===e.nodeType&&t?!0:"array"===n||"function"!==n&&(0===t||"number"==typeof t&&t>0&&t-1 in e)}r=x(a),function(e,t){var n,r,i,o,a,s,l,u,c,p,f,d,h,g,m,y,v,b="sizzle"+-new Date,w=e.document,T=0,C=0,N=st(),k=st(),E=st(),S=!1,A=function(e,t){return e===t?(S=!0,0):0},j=typeof t,D=1<<31,L={}.hasOwnProperty,H=[],q=H.pop,_=H.push,M=H.push,O=H.slice,F=H.indexOf||function(e){var t=0,n=this.length;for(;n>t;t++)if(this[t]===e)return t;return-1},B="checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",P="[\\x20\\t\\r\\n\\f]",R="(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+",W=R.replace("w","w#"),$="\\["+P+"*("+R+")"+P+"*(?:([*^$|!~]?=)"+P+"*(?:(['\"])((?:\\\\.|[^\\\\])*?)\\3|("+W+")|)|)"+P+"*\\]",I=":("+R+")(?:\\(((['\"])((?:\\\\.|[^\\\\])*?)\\3|((?:\\\\.|[^\\\\()[\\]]|"+$.replace(3,8)+")*)|.*)\\)|)",z=RegExp("^"+P+"+|((?:^|[^\\\\])(?:\\\\.)*)"+P+"+$","g"),X=RegExp("^"+P+"*,"+P+"*"),U=RegExp("^"+P+"*([>+~]|"+P+")"+P+"*"),V=RegExp(P+"*[+~]"),Y=RegExp("="+P+"*([^\\]'\"]*)"+P+"*\\]","g"),J=RegExp(I),G=RegExp("^"+W+"$"),Q={ID:RegExp("^#("+R+")"),CLASS:RegExp("^\\.("+R+")"),TAG:RegExp("^("+R.replace("w","w*")+")"),ATTR:RegExp("^"+$),PSEUDO:RegExp("^"+I),CHILD:RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\("+P+"*(even|odd|(([+-]|)(\\d*)n|)"+P+"*(?:([+-]|)"+P+"*(\\d+)|))"+P+"*\\)|)","i"),bool:RegExp("^(?:"+B+")$","i"),needsContext:RegExp("^"+P+"*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\("+P+"*((?:-\\d)?\\d*)"+P+"*\\)|)(?=[^-]|$)","i")},K=/^[^{]+\{\s*\[native \w/,Z=/^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,et=/^(?:input|select|textarea|button)$/i,tt=/^h\d$/i,nt=/'|\\/g,rt=RegExp("\\\\([\\da-f]{1,6}"+P+"?|("+P+")|.)","ig"),it=function(e,t,n){var r="0x"+t-65536;return r!==r||n?t:0>r?String.fromCharCode(r+65536):String.fromCharCode(55296|r>>10,56320|1023&r)};try{M.apply(H=O.call(w.childNodes),w.childNodes),H[w.childNodes.length].nodeType}catch(ot){M={apply:H.length?function(e,t){_.apply(e,O.call(t))}:function(e,t){var n=e.length,r=0;while(e[n++]=t[r++]);e.length=n-1}}}function at(e,t,n,i){var o,a,s,l,u,c,d,m,y,x;if((t?t.ownerDocument||t:w)!==f&&p(t),t=t||f,n=n||[],!e||"string"!=typeof e)return n;if(1!==(l=t.nodeType)&&9!==l)return[];if(h&&!i){if(o=Z.exec(e))if(s=o[1]){if(9===l){if(a=t.getElementById(s),!a||!a.parentNode)return n;if(a.id===s)return n.push(a),n}else if(t.ownerDocument&&(a=t.ownerDocument.getElementById(s))&&v(t,a)&&a.id===s)return n.push(a),n}else{if(o[2])return M.apply(n,t.getElementsByTagName(e)),n;if((s=o[3])&&r.getElementsByClassName&&t.getElementsByClassName)return M.apply(n,t.getElementsByClassName(s)),n}if(r.qsa&&(!g||!g.test(e))){if(m=d=b,y=t,x=9===l&&e,1===l&&"object"!==t.nodeName.toLowerCase()){c=mt(e),(d=t.getAttribute("id"))?m=d.replace(nt,"\\$&"):t.setAttribute("id",m),m="[id='"+m+"'] ",u=c.length;while(u--)c[u]=m+yt(c[u]);y=V.test(e)&&t.parentNode||t,x=c.join(",")}if(x)try{return M.apply(n,y.querySelectorAll(x)),n}catch(T){}finally{d||t.removeAttribute("id")}}}return kt(e.replace(z,"$1"),t,n,i)}function st(){var e=[];function t(n,r){return e.push(n+=" ")>o.cacheLength&&delete t[e.shift()],t[n]=r}return t}function lt(e){return e[b]=!0,e}function ut(e){var t=f.createElement("div");try{return!!e(t)}catch(n){return!1}finally{t.parentNode&&t.parentNode.removeChild(t),t=null}}function ct(e,t){var n=e.split("|"),r=e.length;while(r--)o.attrHandle[n[r]]=t}function pt(e,t){var n=t&&e,r=n&&1===e.nodeType&&1===t.nodeType&&(~t.sourceIndex||D)-(~e.sourceIndex||D);if(r)return r;if(n)while(n=n.nextSibling)if(n===t)return-1;return e?1:-1}function ft(e){return function(t){var n=t.nodeName.toLowerCase();return"input"===n&&t.type===e}}function dt(e){return function(t){var n=t.nodeName.toLowerCase();return("input"===n||"button"===n)&&t.type===e}}function ht(e){return lt(function(t){return t=+t,lt(function(n,r){var i,o=e([],n.length,t),a=o.length;while(a--)n[i=o[a]]&&(n[i]=!(r[i]=n[i]))})})}s=at.isXML=function(e){var t=e&&(e.ownerDocument||e).documentElement;return t?"HTML"!==t.nodeName:!1},r=at.support={},p=at.setDocument=function(e){var n=e?e.ownerDocument||e:w,i=n.defaultView;return n!==f&&9===n.nodeType&&n.documentElement?(f=n,d=n.documentElement,h=!s(n),i&&i.attachEvent&&i!==i.top&&i.attachEvent("onbeforeunload",function(){p()}),r.attributes=ut(function(e){return e.className="i",!e.getAttribute("className")}),r.getElementsByTagName=ut(function(e){return e.appendChild(n.createComment("")),!e.getElementsByTagName("*").length}),r.getElementsByClassName=ut(function(e){return e.innerHTML="<div class='a'></div><div class='a i'></div>",e.firstChild.className="i",2===e.getElementsByClassName("i").length}),r.getById=ut(function(e){return d.appendChild(e).id=b,!n.getElementsByName||!n.getElementsByName(b).length}),r.getById?(o.find.ID=function(e,t){if(typeof t.getElementById!==j&&h){var n=t.getElementById(e);return n&&n.parentNode?[n]:[]}},o.filter.ID=function(e){var t=e.replace(rt,it);return function(e){return e.getAttribute("id")===t}}):(delete o.find.ID,o.filter.ID=function(e){var t=e.replace(rt,it);return function(e){var n=typeof e.getAttributeNode!==j&&e.getAttributeNode("id");return n&&n.value===t}}),o.find.TAG=r.getElementsByTagName?function(e,n){return typeof n.getElementsByTagName!==j?n.getElementsByTagName(e):t}:function(e,t){var n,r=[],i=0,o=t.getElementsByTagName(e);if("*"===e){while(n=o[i++])1===n.nodeType&&r.push(n);return r}return o},o.find.CLASS=r.getElementsByClassName&&function(e,n){return typeof n.getElementsByClassName!==j&&h?n.getElementsByClassName(e):t},m=[],g=[],(r.qsa=K.test(n.querySelectorAll))&&(ut(function(e){e.innerHTML="<select><option selected=''></option></select>",e.querySelectorAll("[selected]").length||g.push("\\["+P+"*(?:value|"+B+")"),e.querySelectorAll(":checked").length||g.push(":checked")}),ut(function(e){var t=n.createElement("input");t.setAttribute("type","hidden"),e.appendChild(t).setAttribute("t",""),e.querySelectorAll("[t^='']").length&&g.push("[*^$]="+P+"*(?:''|\"\")"),e.querySelectorAll(":enabled").length||g.push(":enabled",":disabled"),e.querySelectorAll("*,:x"),g.push(",.*:")})),(r.matchesSelector=K.test(y=d.webkitMatchesSelector||d.mozMatchesSelector||d.oMatchesSelector||d.msMatchesSelector))&&ut(function(e){r.disconnectedMatch=y.call(e,"div"),y.call(e,"[s!='']:x"),m.push("!=",I)}),g=g.length&&RegExp(g.join("|")),m=m.length&&RegExp(m.join("|")),v=K.test(d.contains)||d.compareDocumentPosition?function(e,t){var n=9===e.nodeType?e.documentElement:e,r=t&&t.parentNode;return e===r||!(!r||1!==r.nodeType||!(n.contains?n.contains(r):e.compareDocumentPosition&&16&e.compareDocumentPosition(r)))}:function(e,t){if(t)while(t=t.parentNode)if(t===e)return!0;return!1},A=d.compareDocumentPosition?function(e,t){if(e===t)return S=!0,0;var i=t.compareDocumentPosition&&e.compareDocumentPosition&&e.compareDocumentPosition(t);return i?1&i||!r.sortDetached&&t.compareDocumentPosition(e)===i?e===n||v(w,e)?-1:t===n||v(w,t)?1:c?F.call(c,e)-F.call(c,t):0:4&i?-1:1:e.compareDocumentPosition?-1:1}:function(e,t){var r,i=0,o=e.parentNode,a=t.parentNode,s=[e],l=[t];if(e===t)return S=!0,0;if(!o||!a)return e===n?-1:t===n?1:o?-1:a?1:c?F.call(c,e)-F.call(c,t):0;if(o===a)return pt(e,t);r=e;while(r=r.parentNode)s.unshift(r);r=t;while(r=r.parentNode)l.unshift(r);while(s[i]===l[i])i++;return i?pt(s[i],l[i]):s[i]===w?-1:l[i]===w?1:0},n):f},at.matches=function(e,t){return at(e,null,null,t)},at.matchesSelector=function(e,t){if((e.ownerDocument||e)!==f&&p(e),t=t.replace(Y,"='$1']"),!(!r.matchesSelector||!h||m&&m.test(t)||g&&g.test(t)))try{var n=y.call(e,t);if(n||r.disconnectedMatch||e.document&&11!==e.document.nodeType)return n}catch(i){}return at(t,f,null,[e]).length>0},at.contains=function(e,t){return(e.ownerDocument||e)!==f&&p(e),v(e,t)},at.attr=function(e,n){(e.ownerDocument||e)!==f&&p(e);var i=o.attrHandle[n.toLowerCase()],a=i&&L.call(o.attrHandle,n.toLowerCase())?i(e,n,!h):t;return a===t?r.attributes||!h?e.getAttribute(n):(a=e.getAttributeNode(n))&&a.specified?a.value:null:a},at.error=function(e){throw Error("Syntax error, unrecognized expression: "+e)},at.uniqueSort=function(e){var t,n=[],i=0,o=0;if(S=!r.detectDuplicates,c=!r.sortStable&&e.slice(0),e.sort(A),S){while(t=e[o++])t===e[o]&&(i=n.push(o));while(i--)e.splice(n[i],1)}return e},a=at.getText=function(e){var t,n="",r=0,i=e.nodeType;if(i){if(1===i||9===i||11===i){if("string"==typeof e.textContent)return e.textContent;for(e=e.firstChild;e;e=e.nextSibling)n+=a(e)}else if(3===i||4===i)return e.nodeValue}else for(;t=e[r];r++)n+=a(t);return n},o=at.selectors={cacheLength:50,createPseudo:lt,match:Q,attrHandle:{},find:{},relative:{">":{dir:"parentNode",first:!0}," ":{dir:"parentNode"},"+":{dir:"previousSibling",first:!0},"~":{dir:"previousSibling"}},preFilter:{ATTR:function(e){return e[1]=e[1].replace(rt,it),e[3]=(e[4]||e[5]||"").replace(rt,it),"~="===e[2]&&(e[3]=" "+e[3]+" "),e.slice(0,4)},CHILD:function(e){return e[1]=e[1].toLowerCase(),"nth"===e[1].slice(0,3)?(e[3]||at.error(e[0]),e[4]=+(e[4]?e[5]+(e[6]||1):2*("even"===e[3]||"odd"===e[3])),e[5]=+(e[7]+e[8]||"odd"===e[3])):e[3]&&at.error(e[0]),e},PSEUDO:function(e){var n,r=!e[5]&&e[2];return Q.CHILD.test(e[0])?null:(e[3]&&e[4]!==t?e[2]=e[4]:r&&J.test(r)&&(n=mt(r,!0))&&(n=r.indexOf(")",r.length-n)-r.length)&&(e[0]=e[0].slice(0,n),e[2]=r.slice(0,n)),e.slice(0,3))}},filter:{TAG:function(e){var t=e.replace(rt,it).toLowerCase();return"*"===e?function(){return!0}:function(e){return e.nodeName&&e.nodeName.toLowerCase()===t}},CLASS:function(e){var t=N[e+" "];return t||(t=RegExp("(^|"+P+")"+e+"("+P+"|$)"))&&N(e,function(e){return t.test("string"==typeof e.className&&e.className||typeof e.getAttribute!==j&&e.getAttribute("class")||"")})},ATTR:function(e,t,n){return function(r){var i=at.attr(r,e);return null==i?"!="===t:t?(i+="","="===t?i===n:"!="===t?i!==n:"^="===t?n&&0===i.indexOf(n):"*="===t?n&&i.indexOf(n)>-1:"$="===t?n&&i.slice(-n.length)===n:"~="===t?(" "+i+" ").indexOf(n)>-1:"|="===t?i===n||i.slice(0,n.length+1)===n+"-":!1):!0}},CHILD:function(e,t,n,r,i){var o="nth"!==e.slice(0,3),a="last"!==e.slice(-4),s="of-type"===t;return 1===r&&0===i?function(e){return!!e.parentNode}:function(t,n,l){var u,c,p,f,d,h,g=o!==a?"nextSibling":"previousSibling",m=t.parentNode,y=s&&t.nodeName.toLowerCase(),v=!l&&!s;if(m){if(o){while(g){p=t;while(p=p[g])if(s?p.nodeName.toLowerCase()===y:1===p.nodeType)return!1;h=g="only"===e&&!h&&"nextSibling"}return!0}if(h=[a?m.firstChild:m.lastChild],a&&v){c=m[b]||(m[b]={}),u=c[e]||[],d=u[0]===T&&u[1],f=u[0]===T&&u[2],p=d&&m.childNodes[d];while(p=++d&&p&&p[g]||(f=d=0)||h.pop())if(1===p.nodeType&&++f&&p===t){c[e]=[T,d,f];break}}else if(v&&(u=(t[b]||(t[b]={}))[e])&&u[0]===T)f=u[1];else while(p=++d&&p&&p[g]||(f=d=0)||h.pop())if((s?p.nodeName.toLowerCase()===y:1===p.nodeType)&&++f&&(v&&((p[b]||(p[b]={}))[e]=[T,f]),p===t))break;return f-=i,f===r||0===f%r&&f/r>=0}}},PSEUDO:function(e,t){var n,r=o.pseudos[e]||o.setFilters[e.toLowerCase()]||at.error("unsupported pseudo: "+e);return r[b]?r(t):r.length>1?(n=[e,e,"",t],o.setFilters.hasOwnProperty(e.toLowerCase())?lt(function(e,n){var i,o=r(e,t),a=o.length;while(a--)i=F.call(e,o[a]),e[i]=!(n[i]=o[a])}):function(e){return r(e,0,n)}):r}},pseudos:{not:lt(function(e){var t=[],n=[],r=l(e.replace(z,"$1"));return r[b]?lt(function(e,t,n,i){var o,a=r(e,null,i,[]),s=e.length;while(s--)(o=a[s])&&(e[s]=!(t[s]=o))}):function(e,i,o){return t[0]=e,r(t,null,o,n),!n.pop()}}),has:lt(function(e){return function(t){return at(e,t).length>0}}),contains:lt(function(e){return function(t){return(t.textContent||t.innerText||a(t)).indexOf(e)>-1}}),lang:lt(function(e){return G.test(e||"")||at.error("unsupported lang: "+e),e=e.replace(rt,it).toLowerCase(),function(t){var n;do if(n=h?t.lang:t.getAttribute("xml:lang")||t.getAttribute("lang"))return n=n.toLowerCase(),n===e||0===n.indexOf(e+"-");while((t=t.parentNode)&&1===t.nodeType);return!1}}),target:function(t){var n=e.location&&e.location.hash;return n&&n.slice(1)===t.id},root:function(e){return e===d},focus:function(e){return e===f.activeElement&&(!f.hasFocus||f.hasFocus())&&!!(e.type||e.href||~e.tabIndex)},enabled:function(e){return e.disabled===!1},disabled:function(e){return e.disabled===!0},checked:function(e){var t=e.nodeName.toLowerCase();return"input"===t&&!!e.checked||"option"===t&&!!e.selected},selected:function(e){return e.parentNode&&e.parentNode.selectedIndex,e.selected===!0},empty:function(e){for(e=e.firstChild;e;e=e.nextSibling)if(e.nodeName>"@"||3===e.nodeType||4===e.nodeType)return!1;return!0},parent:function(e){return!o.pseudos.empty(e)},header:function(e){return tt.test(e.nodeName)},input:function(e){return et.test(e.nodeName)},button:function(e){var t=e.nodeName.toLowerCase();return"input"===t&&"button"===e.type||"button"===t},text:function(e){var t;return"input"===e.nodeName.toLowerCase()&&"text"===e.type&&(null==(t=e.getAttribute("type"))||t.toLowerCase()===e.type)},first:ht(function(){return[0]}),last:ht(function(e,t){return[t-1]}),eq:ht(function(e,t,n){return[0>n?n+t:n]}),even:ht(function(e,t){var n=0;for(;t>n;n+=2)e.push(n);return e}),odd:ht(function(e,t){var n=1;for(;t>n;n+=2)e.push(n);return e}),lt:ht(function(e,t,n){var r=0>n?n+t:n;for(;--r>=0;)e.push(r);return e}),gt:ht(function(e,t,n){var r=0>n?n+t:n;for(;t>++r;)e.push(r);return e})}},o.pseudos.nth=o.pseudos.eq;for(n in{radio:!0,checkbox:!0,file:!0,password:!0,image:!0})o.pseudos[n]=ft(n);for(n in{submit:!0,reset:!0})o.pseudos[n]=dt(n);function gt(){}gt.prototype=o.filters=o.pseudos,o.setFilters=new gt;function mt(e,t){var n,r,i,a,s,l,u,c=k[e+" "];if(c)return t?0:c.slice(0);s=e,l=[],u=o.preFilter;while(s){(!n||(r=X.exec(s)))&&(r&&(s=s.slice(r[0].length)||s),l.push(i=[])),n=!1,(r=U.exec(s))&&(n=r.shift(),i.push({value:n,type:r[0].replace(z," ")}),s=s.slice(n.length));for(a in o.filter)!(r=Q[a].exec(s))||u[a]&&!(r=u[a](r))||(n=r.shift(),i.push({value:n,type:a,matches:r}),s=s.slice(n.length));if(!n)break}return t?s.length:s?at.error(e):k(e,l).slice(0)}function yt(e){var t=0,n=e.length,r="";for(;n>t;t++)r+=e[t].value;return r}function vt(e,t,n){var r=t.dir,o=n&&"parentNode"===r,a=C++;return t.first?function(t,n,i){while(t=t[r])if(1===t.nodeType||o)return e(t,n,i)}:function(t,n,s){var l,u,c,p=T+" "+a;if(s){while(t=t[r])if((1===t.nodeType||o)&&e(t,n,s))return!0}else while(t=t[r])if(1===t.nodeType||o)if(c=t[b]||(t[b]={}),(u=c[r])&&u[0]===p){if((l=u[1])===!0||l===i)return l===!0}else if(u=c[r]=[p],u[1]=e(t,n,s)||i,u[1]===!0)return!0}}function bt(e){return e.length>1?function(t,n,r){var i=e.length;while(i--)if(!e[i](t,n,r))return!1;return!0}:e[0]}function xt(e,t,n,r,i){var o,a=[],s=0,l=e.length,u=null!=t;for(;l>s;s++)(o=e[s])&&(!n||n(o,r,i))&&(a.push(o),u&&t.push(s));return a}function wt(e,t,n,r,i,o){return r&&!r[b]&&(r=wt(r)),i&&!i[b]&&(i=wt(i,o)),lt(function(o,a,s,l){var u,c,p,f=[],d=[],h=a.length,g=o||Nt(t||"*",s.nodeType?[s]:s,[]),m=!e||!o&&t?g:xt(g,f,e,s,l),y=n?i||(o?e:h||r)?[]:a:m;if(n&&n(m,y,s,l),r){u=xt(y,d),r(u,[],s,l),c=u.length;while(c--)(p=u[c])&&(y[d[c]]=!(m[d[c]]=p))}if(o){if(i||e){if(i){u=[],c=y.length;while(c--)(p=y[c])&&u.push(m[c]=p);i(null,y=[],u,l)}c=y.length;while(c--)(p=y[c])&&(u=i?F.call(o,p):f[c])>-1&&(o[u]=!(a[u]=p))}}else y=xt(y===a?y.splice(h,y.length):y),i?i(null,a,y,l):M.apply(a,y)})}function Tt(e){var t,n,r,i=e.length,a=o.relative[e[0].type],s=a||o.relative[" "],l=a?1:0,c=vt(function(e){return e===t},s,!0),p=vt(function(e){return F.call(t,e)>-1},s,!0),f=[function(e,n,r){return!a&&(r||n!==u)||((t=n).nodeType?c(e,n,r):p(e,n,r))}];for(;i>l;l++)if(n=o.relative[e[l].type])f=[vt(bt(f),n)];else{if(n=o.filter[e[l].type].apply(null,e[l].matches),n[b]){for(r=++l;i>r;r++)if(o.relative[e[r].type])break;return wt(l>1&&bt(f),l>1&&yt(e.slice(0,l-1).concat({value:" "===e[l-2].type?"*":""})).replace(z,"$1"),n,r>l&&Tt(e.slice(l,r)),i>r&&Tt(e=e.slice(r)),i>r&&yt(e))}f.push(n)}return bt(f)}function Ct(e,t){var n=0,r=t.length>0,a=e.length>0,s=function(s,l,c,p,d){var h,g,m,y=[],v=0,b="0",x=s&&[],w=null!=d,C=u,N=s||a&&o.find.TAG("*",d&&l.parentNode||l),k=T+=null==C?1:Math.random()||.1;for(w&&(u=l!==f&&l,i=n);null!=(h=N[b]);b++){if(a&&h){g=0;while(m=e[g++])if(m(h,l,c)){p.push(h);break}w&&(T=k,i=++n)}r&&((h=!m&&h)&&v--,s&&x.push(h))}if(v+=b,r&&b!==v){g=0;while(m=t[g++])m(x,y,l,c);if(s){if(v>0)while(b--)x[b]||y[b]||(y[b]=q.call(p));y=xt(y)}M.apply(p,y),w&&!s&&y.length>0&&v+t.length>1&&at.uniqueSort(p)}return w&&(T=k,u=C),x};return r?lt(s):s}l=at.compile=function(e,t){var n,r=[],i=[],o=E[e+" "];if(!o){t||(t=mt(e)),n=t.length;while(n--)o=Tt(t[n]),o[b]?r.push(o):i.push(o);o=E(e,Ct(i,r))}return o};function Nt(e,t,n){var r=0,i=t.length;for(;i>r;r++)at(e,t[r],n);return n}function kt(e,t,n,i){var a,s,u,c,p,f=mt(e);if(!i&&1===f.length){if(s=f[0]=f[0].slice(0),s.length>2&&"ID"===(u=s[0]).type&&r.getById&&9===t.nodeType&&h&&o.relative[s[1].type]){if(t=(o.find.ID(u.matches[0].replace(rt,it),t)||[])[0],!t)return n;e=e.slice(s.shift().value.length)}a=Q.needsContext.test(e)?0:s.length;while(a--){if(u=s[a],o.relative[c=u.type])break;if((p=o.find[c])&&(i=p(u.matches[0].replace(rt,it),V.test(s[0].type)&&t.parentNode||t))){if(s.splice(a,1),e=i.length&&yt(s),!e)return M.apply(n,i),n;break}}}return l(e,f)(i,t,!h,n,V.test(e)),n}r.sortStable=b.split("").sort(A).join("")===b,r.detectDuplicates=S,p(),r.sortDetached=ut(function(e){return 1&e.compareDocumentPosition(f.createElement("div"))}),ut(function(e){return e.innerHTML="<a href='#'></a>","#"===e.firstChild.getAttribute("href")})||ct("type|href|height|width",function(e,n,r){return r?t:e.getAttribute(n,"type"===n.toLowerCase()?1:2)}),r.attributes&&ut(function(e){return e.innerHTML="<input/>",e.firstChild.setAttribute("value",""),""===e.firstChild.getAttribute("value")})||ct("value",function(e,n,r){return r||"input"!==e.nodeName.toLowerCase()?t:e.defaultValue}),ut(function(e){return null==e.getAttribute("disabled")})||ct(B,function(e,n,r){var i;return r?t:(i=e.getAttributeNode(n))&&i.specified?i.value:e[n]===!0?n.toLowerCase():null}),x.find=at,x.expr=at.selectors,x.expr[":"]=x.expr.pseudos,x.unique=at.uniqueSort,x.text=at.getText,x.isXMLDoc=at.isXML,x.contains=at.contains}(e);var O={};function F(e){var t=O[e]={};return x.each(e.match(T)||[],function(e,n){t[n]=!0}),t}x.Callbacks=function(e){e="string"==typeof e?O[e]||F(e):x.extend({},e);var n,r,i,o,a,s,l=[],u=!e.once&&[],c=function(t){for(r=e.memory&&t,i=!0,a=s||0,s=0,o=l.length,n=!0;l&&o>a;a++)if(l[a].apply(t[0],t[1])===!1&&e.stopOnFalse){r=!1;break}n=!1,l&&(u?u.length&&c(u.shift()):r?l=[]:p.disable())},p={add:function(){if(l){var t=l.length;(function i(t){x.each(t,function(t,n){var r=x.type(n);"function"===r?e.unique&&p.has(n)||l.push(n):n&&n.length&&"string"!==r&&i(n)})})(arguments),n?o=l.length:r&&(s=t,c(r))}return this},remove:function(){return l&&x.each(arguments,function(e,t){var r;while((r=x.inArray(t,l,r))>-1)l.splice(r,1),n&&(o>=r&&o--,a>=r&&a--)}),this},has:function(e){return e?x.inArray(e,l)>-1:!(!l||!l.length)},empty:function(){return l=[],o=0,this},disable:function(){return l=u=r=t,this},disabled:function(){return!l},lock:function(){return u=t,r||p.disable(),this},locked:function(){return!u},fireWith:function(e,t){return!l||i&&!u||(t=t||[],t=[e,t.slice?t.slice():t],n?u.push(t):c(t)),this},fire:function(){return p.fireWith(this,arguments),this},fired:function(){return!!i}};return p},x.extend({Deferred:function(e){var t=[["resolve","done",x.Callbacks("once memory"),"resolved"],["reject","fail",x.Callbacks("once memory"),"rejected"],["notify","progress",x.Callbacks("memory")]],n="pending",r={state:function(){return n},always:function(){return i.done(arguments).fail(arguments),this},then:function(){var e=arguments;return x.Deferred(function(n){x.each(t,function(t,o){var a=o[0],s=x.isFunction(e[t])&&e[t];i[o[1]](function(){var e=s&&s.apply(this,arguments);e&&x.isFunction(e.promise)?e.promise().done(n.resolve).fail(n.reject).progress(n.notify):n[a+"With"](this===r?n.promise():this,s?[e]:arguments)})}),e=null}).promise()},promise:function(e){return null!=e?x.extend(e,r):r}},i={};return r.pipe=r.then,x.each(t,function(e,o){var a=o[2],s=o[3];r[o[1]]=a.add,s&&a.add(function(){n=s},t[1^e][2].disable,t[2][2].lock),i[o[0]]=function(){return i[o[0]+"With"](this===i?r:this,arguments),this},i[o[0]+"With"]=a.fireWith}),r.promise(i),e&&e.call(i,i),i},when:function(e){var t=0,n=g.call(arguments),r=n.length,i=1!==r||e&&x.isFunction(e.promise)?r:0,o=1===i?e:x.Deferred(),a=function(e,t,n){return function(r){t[e]=this,n[e]=arguments.length>1?g.call(arguments):r,n===s?o.notifyWith(t,n):--i||o.resolveWith(t,n)}},s,l,u;if(r>1)for(s=Array(r),l=Array(r),u=Array(r);r>t;t++)n[t]&&x.isFunction(n[t].promise)?n[t].promise().done(a(t,u,n)).fail(o.reject).progress(a(t,l,s)):--i;return i||o.resolveWith(u,n),o.promise()}}),x.support=function(t){var n,r,o,s,l,u,c,p,f,d=a.createElement("div");if(d.setAttribute("className","t"),d.innerHTML="  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>",n=d.getElementsByTagName("*")||[],r=d.getElementsByTagName("a")[0],!r||!r.style||!n.length)return t;s=a.createElement("select"),u=s.appendChild(a.createElement("option")),o=d.getElementsByTagName("input")[0],r.style.cssText="top:1px;float:left;opacity:.5",t.getSetAttribute="t"!==d.className,t.leadingWhitespace=3===d.firstChild.nodeType,t.tbody=!d.getElementsByTagName("tbody").length,t.htmlSerialize=!!d.getElementsByTagName("link").length,t.style=/top/.test(r.getAttribute("style")),t.hrefNormalized="/a"===r.getAttribute("href"),t.opacity=/^0.5/.test(r.style.opacity),t.cssFloat=!!r.style.cssFloat,t.checkOn=!!o.value,t.optSelected=u.selected,t.enctype=!!a.createElement("form").enctype,t.html5Clone="<:nav></:nav>"!==a.createElement("nav").cloneNode(!0).outerHTML,t.inlineBlockNeedsLayout=!1,t.shrinkWrapBlocks=!1,t.pixelPosition=!1,t.deleteExpando=!0,t.noCloneEvent=!0,t.reliableMarginRight=!0,t.boxSizingReliable=!0,o.checked=!0,t.noCloneChecked=o.cloneNode(!0).checked,s.disabled=!0,t.optDisabled=!u.disabled;try{delete d.test}catch(h){t.deleteExpando=!1}o=a.createElement("input"),o.setAttribute("value",""),t.input=""===o.getAttribute("value"),o.value="t",o.setAttribute("type","radio"),t.radioValue="t"===o.value,o.setAttribute("checked","t"),o.setAttribute("name","t"),l=a.createDocumentFragment(),l.appendChild(o),t.appendChecked=o.checked,t.checkClone=l.cloneNode(!0).cloneNode(!0).lastChild.checked,d.attachEvent&&(d.attachEvent("onclick",function(){t.noCloneEvent=!1}),d.cloneNode(!0).click());for(f in{submit:!0,change:!0,focusin:!0})d.setAttribute(c="on"+f,"t"),t[f+"Bubbles"]=c in e||d.attributes[c].expando===!1;d.style.backgroundClip="content-box",d.cloneNode(!0).style.backgroundClip="",t.clearCloneStyle="content-box"===d.style.backgroundClip;for(f in x(t))break;return t.ownLast="0"!==f,x(function(){var n,r,o,s="padding:0;margin:0;border:0;display:block;box-sizing:content-box;-moz-box-sizing:content-box;-webkit-box-sizing:content-box;",l=a.getElementsByTagName("body")[0];l&&(n=a.createElement("div"),n.style.cssText="border:0;width:0;height:0;position:absolute;top:0;left:-9999px;margin-top:1px",l.appendChild(n).appendChild(d),d.innerHTML="<table><tr><td></td><td>t</td></tr></table>",o=d.getElementsByTagName("td"),o[0].style.cssText="padding:0;margin:0;border:0;display:none",p=0===o[0].offsetHeight,o[0].style.display="",o[1].style.display="none",t.reliableHiddenOffsets=p&&0===o[0].offsetHeight,d.innerHTML="",d.style.cssText="box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;padding:1px;border:1px;display:block;width:4px;margin-top:1%;position:absolute;top:1%;",x.swap(l,null!=l.style.zoom?{zoom:1}:{},function(){t.boxSizing=4===d.offsetWidth}),e.getComputedStyle&&(t.pixelPosition="1%"!==(e.getComputedStyle(d,null)||{}).top,t.boxSizingReliable="4px"===(e.getComputedStyle(d,null)||{width:"4px"}).width,r=d.appendChild(a.createElement("div")),r.style.cssText=d.style.cssText=s,r.style.marginRight=r.style.width="0",d.style.width="1px",t.reliableMarginRight=!parseFloat((e.getComputedStyle(r,null)||{}).marginRight)),typeof d.style.zoom!==i&&(d.innerHTML="",d.style.cssText=s+"width:1px;padding:1px;display:inline;zoom:1",t.inlineBlockNeedsLayout=3===d.offsetWidth,d.style.display="block",d.innerHTML="<div></div>",d.firstChild.style.width="5px",t.shrinkWrapBlocks=3!==d.offsetWidth,t.inlineBlockNeedsLayout&&(l.style.zoom=1)),l.removeChild(n),n=d=o=r=null)}),n=s=l=u=r=o=null,t
+}({});var B=/(?:\{[\s\S]*\}|\[[\s\S]*\])$/,P=/([A-Z])/g;function R(e,n,r,i){if(x.acceptData(e)){var o,a,s=x.expando,l=e.nodeType,u=l?x.cache:e,c=l?e[s]:e[s]&&s;if(c&&u[c]&&(i||u[c].data)||r!==t||"string"!=typeof n)return c||(c=l?e[s]=p.pop()||x.guid++:s),u[c]||(u[c]=l?{}:{toJSON:x.noop}),("object"==typeof n||"function"==typeof n)&&(i?u[c]=x.extend(u[c],n):u[c].data=x.extend(u[c].data,n)),a=u[c],i||(a.data||(a.data={}),a=a.data),r!==t&&(a[x.camelCase(n)]=r),"string"==typeof n?(o=a[n],null==o&&(o=a[x.camelCase(n)])):o=a,o}}function W(e,t,n){if(x.acceptData(e)){var r,i,o=e.nodeType,a=o?x.cache:e,s=o?e[x.expando]:x.expando;if(a[s]){if(t&&(r=n?a[s]:a[s].data)){x.isArray(t)?t=t.concat(x.map(t,x.camelCase)):t in r?t=[t]:(t=x.camelCase(t),t=t in r?[t]:t.split(" ")),i=t.length;while(i--)delete r[t[i]];if(n?!I(r):!x.isEmptyObject(r))return}(n||(delete a[s].data,I(a[s])))&&(o?x.cleanData([e],!0):x.support.deleteExpando||a!=a.window?delete a[s]:a[s]=null)}}}x.extend({cache:{},noData:{applet:!0,embed:!0,object:"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"},hasData:function(e){return e=e.nodeType?x.cache[e[x.expando]]:e[x.expando],!!e&&!I(e)},data:function(e,t,n){return R(e,t,n)},removeData:function(e,t){return W(e,t)},_data:function(e,t,n){return R(e,t,n,!0)},_removeData:function(e,t){return W(e,t,!0)},acceptData:function(e){if(e.nodeType&&1!==e.nodeType&&9!==e.nodeType)return!1;var t=e.nodeName&&x.noData[e.nodeName.toLowerCase()];return!t||t!==!0&&e.getAttribute("classid")===t}}),x.fn.extend({data:function(e,n){var r,i,o=null,a=0,s=this[0];if(e===t){if(this.length&&(o=x.data(s),1===s.nodeType&&!x._data(s,"parsedAttrs"))){for(r=s.attributes;r.length>a;a++)i=r[a].name,0===i.indexOf("data-")&&(i=x.camelCase(i.slice(5)),$(s,i,o[i]));x._data(s,"parsedAttrs",!0)}return o}return"object"==typeof e?this.each(function(){x.data(this,e)}):arguments.length>1?this.each(function(){x.data(this,e,n)}):s?$(s,e,x.data(s,e)):null},removeData:function(e){return this.each(function(){x.removeData(this,e)})}});function $(e,n,r){if(r===t&&1===e.nodeType){var i="data-"+n.replace(P,"-$1").toLowerCase();if(r=e.getAttribute(i),"string"==typeof r){try{r="true"===r?!0:"false"===r?!1:"null"===r?null:+r+""===r?+r:B.test(r)?x.parseJSON(r):r}catch(o){}x.data(e,n,r)}else r=t}return r}function I(e){var t;for(t in e)if(("data"!==t||!x.isEmptyObject(e[t]))&&"toJSON"!==t)return!1;return!0}x.extend({queue:function(e,n,r){var i;return e?(n=(n||"fx")+"queue",i=x._data(e,n),r&&(!i||x.isArray(r)?i=x._data(e,n,x.makeArray(r)):i.push(r)),i||[]):t},dequeue:function(e,t){t=t||"fx";var n=x.queue(e,t),r=n.length,i=n.shift(),o=x._queueHooks(e,t),a=function(){x.deque