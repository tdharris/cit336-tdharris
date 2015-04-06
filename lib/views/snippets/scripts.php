<!-- JS -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

	<!-- Dependencies -->
	<?php if ($_SERVER[REQUEST_URI] == '/?action=q&url=contact') {?>
		<script type="text/javascript" src="public/js/sendMail.min.js"></script>
	<?php };?>

	<?php if (strpos($_SERVER[REQUEST_URI], '/?action=q&project=') !== false || $_SERVER[REQUEST_URI] == '/?action=q&url=portfolio') {?>
		<script type="text/javascript" src="public/lib/rainbow/rainbow-custom.min.js"></script>
		<script type="text/javascript" src="public/lib/slickjs/slick.min.js"></script>
		<script type="text/javascript" src="public/lib/mixitup/mixitup.min.js"></script>
		<script type="text/javascript" src="public/js/tdharris.min.js"></script>
	<?php };?>

	<?php if ($_SERVER[REQUEST_URI] == '/?action=q&url=contact' || $_SERVER[REQUEST_URI] == '/?action=a&url=admin') {?>
		<script type="text/javascript" src="public/lib/spin/spin.min.js"></script>
		<script type="text/javascript" src="public/lib/toastr/toastr.min.js"></script>
	<?php };?>

	<?php if ($_SERVER[REQUEST_URI] == '/?action=a&url=admin') {?>
	  <script type="text/javascript" src="public/lib/dropzone/dropzone.js"></script>
	  <script type="text/javascript" src="public/js/admin.min.js"></script>
	<?php };?>

<script type="text/javascript" src="public/js/login.min.js"></script>
<script type="text/javascript" src="public/js/getProject.min.js"></script>


<!-- Google Analytics Tracking -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-54458905-2', 'auto');
  ga('send', 'pageview');

</script>