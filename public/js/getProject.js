function getProject() {
	// this is the HTML select object

	var editForm = document.getElementById("editProject");
    var spinMe = document.querySelectorAll("div .content")[0];

	var spinner = new Spinner({
        lines: 13, // The number of lines to draw
        length: 20, // The length of each line
        width: 10, // The line thickness
        radius: 30, // The radius of the inner circle
        corners: 1, // Corner roundness (0..1)
        rotate: 0, // The rotation offset
        direction: 1, // 1: clockwise, -1: counterclockwise
        color: '#000', // #rgb or #rrggbb or array of colors
        speed: 1, // Rounds per second
        trail: 60, // Afterglow percentage
        shadow: false, // Whether to render a shadow
        hwaccel: false, // Whether to use hardware acceleration
        zIndex: 2e9, // The z-index (defaults to 2000000000)
        top: '50%', // Top position relative to parent
        left: '50%' // Left position relative to parent
    }).spin(spinMe);

    spinMe.classList.toggle("blur");

	$.ajax({
        type: 'POST',
        url: 'lib/controllers/admin/getProject.php',
        data: {
	        projectName: $(this).val()
	    },
        dataType: 'json',
        success: function(data) {
        	var githubURL = editForm.elements["githubURL"],
				category = editForm.elements["category"],
				brief = editForm.elements["brief"],
				description = editForm.elements["description"];

        	githubURL.value = data.githubURL;
        	category.value = data.category;
        	brief.value = data.brief;
        	description.value = data.description;

        	githubURL.disabled = false;
			category.disabled = false;
			brief.disabled = false;
			description.disabled = false;

            spinMe.classList.toggle("blur");
        	spinner.stop();
       	},
       	error: function(res) {
       		spinMe.classList.toggle("blur");
            spinner.stop();
       		toastr.error(res.responseText, 'Error!');
       	}
    });
};