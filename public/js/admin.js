/* ******************************************
*  Admin Functions
* ******************************************/


(function() {
   // your page initialization code here
   // the DOM will be available here

   // Disabling autoDiscover, otherwise Dropzone will try to attach twice.
	Dropzone.autoDiscover = false;   

	var dz_addPics = new Dropzone("div#addPics", {
		url: "lib/upload.php",
		acceptedFiles: "image/*",
		autoProcessQueue: false,
		uploadMultiple: true,
		parallelUploads: 100,
		addRemoveLinks: true,
		maxFiles: 10,
		init: function() {
			 
			var myDropzone = this;
			var	addForm = document.getElementById("addProject");
			var	spinner = new Spinner({
			    lines: 9,
			    length: 0,
			    width: 12,
			    radius: 26,
			    corners: 1.0,
			    rotate: 0,
			    trail: 48,
			    speed: 0.9,
			    direction: 1
			});

			// First change the button to actually tell Dropzone to process the queue.
		    $("#addProject input[type=submit]").on("click", function(e) {
				// Make sure that the form isn't actually being sent.
				e.preventDefault();
				e.stopPropagation();

				// validate form data
				if(checkform(addForm)) {
					if(! myDropzone.getQueuedFiles().length > 0) {
						toastr.warning('Please select an image.', 'Warning');
					} else {
						spinner.spin(addForm);
						myDropzone.processQueue();
					}
				};
				
		    });

		    // Once images have been uploaded successfully
		    this.on("successmultiple", function(file, res) {

		    	var	addForm = document.getElementById("addProject");
		    	var projectName = $('#addProject input[name=projectName]').val();

		    	$.ajax({
		            type: 'POST',
		            url: 'lib/controllers/admin/addProject.php',
		            data: ($("#addProject").serialize()+'&'+$.param({ 'fileIDs': res })),
		            dataType: 'json',
		            success: function(response) {
		            	updateSelects("add", projectName);
		            	myDropzone.removeAllFiles();
		            	addForm.reset.click();
		            	spinner.stop();
		           		toastr.success(response, 'Success');
		           	},
		           	error: function(res) {
		           		myDropzone.removeAllFiles();
		           		spinner.stop();
		           		console.log(res);
		           		toastr.error(res.responseText, 'Error!');
		           	}
		        });
	            
	        });

			// Setup the observer for the button.
			document.querySelector("#addProject input[name=reset]").addEventListener("click", function() {
				myDropzone.removeAllFiles();
			});

	    }
	});

	$('#deleteProject').submit(function(event) {
	    event.preventDefault();
	    event.stopPropagation();
	    var deleteForm = document.getElementById("deleteProject");
	    // var projectName = $('#deleteProject select :selected');
	    var projectName = $('#deleteProject select :selected').val();

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
        }).spin(deleteForm);

        $.ajax({
            type: 'POST',
            url: 'lib/controllers/admin/deleteProject.php',
            data: $(this).serialize(),
            dataType: 'json',
            success: function(response) {
            	// projectName.remove();
            	updateSelects("remove", projectName);
            	spinner.stop();
           		toastr.success(response, 'Success');
           	},
           	error: function(res) {
           		spinner.stop();
           		toastr.error(res.responseText, 'Error!');
           	}
        });
	});

	$('#editProject').submit(function(event) {
	    event.preventDefault();
	    event.stopPropagation();
	    var editForm = document.getElementById("#editProject");

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
            url: 'lib/controllers/admin/editProject.php',
            data: $(this).serialize(),
            dataType: 'json',
            success: function(response) {
            	spinner.stop();
           		toastr.success(response, 'Success');
           	},
           	error: function(res) {
           		spinner.stop();
           		toastr.error(res.responseText, 'Error!');
           	}
        });

	});

	// Utility Functions
	function checkform(form) {
	    // get all the inputs within the submitted form
	    var inputs = form.getElementsByTagName('input');
	    for (var i = 0; i < inputs.length; i++) {
	        // only validate the inputs that have the required attribute
	        if(inputs[i].hasAttribute("required")){
	            if(inputs[i].value == ""){
	                // found an empty field that is required
	                toastr.warning('Please fill all required fields.', 'Warning');
	                return false;
	            }
	        }
	    }
	    return true;
	};

	function updateSelects(action, projectName) {
		var selects = $("select[name=projectName]");

		if(action === "add") {
			$.each(selects, function(index, item) {
				// add to top of select lists & select it
				var newOptEl = document.createElement("OPTION");
				newOptEl.text = projectName;
				item.appendChild(newOptEl);
				item.value = projectName;
			});

		} else if (action === "remove") {
			// remove <option>projectName</option> from array of selects
			$.each(selects, function(index, item) {
				var options = $(item).find("option");

				$.each(options, function(index, item) {
					if(item.innerText == projectName) item.remove();
				});

			});

		};
	};

   
})();