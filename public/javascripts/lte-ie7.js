/* Load this script using conditional IE comments if you need to support IE 7 and IE 6. */

window.onload = function() {
	function addIcon(el, entity) {
		var html = el.innerHTML;
		el.innerHTML = '<span style="font-family: \'icomoon\'">' + entity + '</span>' + html;
	}
	var icons = {
			'icon-pencil' : '&#xe000;',
			'icon-home' : '&#xe001;',
			'icon-image' : '&#xe002;',
			'icon-camera' : '&#xe003;',
			'icon-headphones' : '&#xe004;',
			'icon-film' : '&#xe005;',
			'icon-bullhorn' : '&#xe006;',
			'icon-connection' : '&#xe007;',
			'icon-tag' : '&#xe008;',
			'icon-cart' : '&#xe009;',
			'icon-phone' : '&#xe00a;',
			'icon-envelop' : '&#xe00b;',
			'icon-location' : '&#xe00c;',
			'icon-mobile' : '&#xe00d;',
			'icon-search' : '&#xe00e;',
			'icon-cog' : '&#xe00f;',
			'icon-rocket' : '&#xe010;',
			'icon-remove' : '&#xe011;',
			'icon-bubble' : '&#xe012;',
			'icon-spinner' : '&#xe013;',
			'icon-heart' : '&#xe014;',
			'icon-star' : '&#xe015;',
			'icon-html5' : '&#xe016;',
			'icon-undo' : '&#xe017;',
			'icon-google-plus' : '&#xe018;',
			'icon-facebook' : '&#xe019;',
			'icon-twitter' : '&#xe01a;',
			'icon-github' : '&#xe01b;',
			'icon-wordpress' : '&#xe01c;',
			'icon-android' : '&#xe01d;',
			'icon-windows8' : '&#xe01e;',
			'icon-linkedin' : '&#xe01f;',
			'icon-file-css' : '&#xe020;',
			'icon-chrome' : '&#xe021;',
			'icon-firefox' : '&#xe022;',
			'icon-IE' : '&#xe023;',
			'icon-opera' : '&#xe024;',
			'icon-safari' : '&#xe025;',
			'icon-github-2' : '&#xe026;',
			'icon-console' : '&#xe027;',
			'icon-loop' : '&#xe028;',
			'icon-user' : '&#xe029;',
			'icon-bell' : '&#xe02a;',
			'icon-qrcode' : '&#xe02b;',
			'icon-exit' : '&#xe02c;'
		},
		els = document.getElementsByTagName('*'),
		i, attr, c, el;
	for (i = 0; ; i += 1) {
		el = els[i];
		if(!el) {
			break;
		}
		attr = el.getAttribute('data-icon');
		if (attr) {
			addIcon(el, attr);
		}
		c = el.className;
		c = c.match(/icon-[^\s'"]+/);
		if (c && icons[c[0]]) {
			addIcon(el, icons[c[0]]);
		}
	}
};