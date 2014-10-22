$(document).on("page:load", commentCounts);

/* * * CONFIGURATION VARIABLES * * */
var disqus_shortname = 'coshxlabs';

/* * * DON'T EDIT BELOW THIS LINE * * */
function commentCounts() {
    var s = document.createElement('script'); s.async = true;
    s.type = 'text/javascript';
    s.src = '//' + disqus_shortname + '.disqus.com/count.js';
    (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
};
