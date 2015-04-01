function getProject() {
	// this is the HTML select object

	var editForm = document.getElementById("editProject");

	var spinner = new Spinner({
        lines: 9,
        length: 0,
        width: 12,
        radius: 26,
        corners: 1.0,
        rotate: 0,
        trail: 48,
        speed: 0.9,
        direction: 1
    }).spin(editForm);

	$.ajax({
        type: 'POST',
        url: 'controllers/admin/getProject.php',
        data: {
	        projectName: $(this).val()
	    },
        dataType: 'json',
        success: function(data) {
        	var githubURL = editForm.elements["githubURL"],
				category = editForm.elements["category"],
				brief = editForm.elements["brief"],
				description = editForm.elements["description"];

        	switch(data.category) {
        		case 'webDev':
        			data.category = "WebDev";
        			break;
        		case 'bash':
        			data.category = "Bash";
        			break;
        		case 'java':
        			data.category = "Java";
        			break;
        	};

        	githubURL.value = data.githubURL;
        	category.value = data.category;
        	brief.value = data.brief;
        	description.value = data.description;

        	githubURL.disabled = false;
			category.disabled = false;
			brief.disabled = false;
			description.disabled = false;

        	spinner.stop();
       	},
       	error: function(res) {
       		spinner.stop();
       		toastr.error(res.responseText, 'Error!');
       	}
    });
};