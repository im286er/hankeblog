/*
 * Created with Sublime Text 2.
 * User: Hankewins
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