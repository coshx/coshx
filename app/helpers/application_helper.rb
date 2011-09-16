module ApplicationHelper

  def google_analytics_js
    if ENV['GOOGLE_ANALYTICS']
      <<EndOfGA

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', '#{ENV['GOOGLE_ANALYTICS']}']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
EndOfGA

    end
  end

end
