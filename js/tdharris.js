$(function(){

    $('#Portfolio').mixItUp({
		load: {
			sort: 'myorder:asc'
		}
	});

	$('.slicky').slick({
	  dots: true,
	  speed: 500
	});
	
	var dz_addPics = new Dropzone("div#addPics", { url: "upload.php"});
	var dz_editPics = new Dropzone("div#editPics", { url: "upload.php"});

});