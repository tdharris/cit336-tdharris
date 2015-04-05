/* ******************************************
*  Admin Functions
* ******************************************/


(function() {
   // your page initialization code here
   // the DOM will be available here

   // Disabling autoDiscover, otherwise Dropzone will try to attach twice.
	Dropzone.autoDiscover = false;   
	var spinMe = document.querySelectorAll("div .content")[0];
	var spinOptions = {
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
    };

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
			var	spinner = new Spinner(spinOptions);

			// First change the button to actually tell Dropzone to process the queue.
		    $("#addProject input[type=submit]").on("click", function(e) {
				// Make sure that the form isn't actually being sent.
				e.preventDefault();
				e.stopPropagation();

				spinner.spin(spinMe);
				spinMe.classList.toggle("blur");

				// validate form data
				if(checkform(addForm)) {
					if(! myDropzone.getQueuedFiles().length > 0) {
						toastr.warning('Please select an image.', 'Warning');
					} else {
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
		            	spinMe.classList.toggle("blur");
		            	spinner.stop();
		           		toastr.success(response, 'Success');
		           	},
		           	error: function(res) {
		           		myDropzone.removeAllFiles();
		           		spinMe.classList.toggle("blur");
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

	    var spinner = new Spinner(spinOptions).spin(spinMe);
	    spinMe.classList.toggle("blur");

        $.ajax({
            type: 'POST',
            url: 'lib/controllers/admin/deleteProject.php',
            data: $(this).serialize(),
            dataType: 'json',
            success: function(response) {
            	// projectName.remove();
            	updateSelects("remove", projectName);
            	spinMe.classList.toggle("blur");
            	spinner.stop();
           		toastr.success(response, 'Success');
           	},
           	error: function(res) {
           		spinMe.classList.toggle("blur");
           		spinner.stop();
           		toastr.error(res.responseText, 'Error!');
           	}
        });
	});

	$('#editProject').submit(function(event) {
	    event.preventDefault();
	    event.stopPropagation();
	    var editForm = document.getElementById("#editProject");

	    var spinner = new Spinner().spin(spinMe);
	    spinMe.classList.toggle("blur");

        $.ajax({
            type: 'POST',
            url: 'lib/controllers/admin/editProject.php',
            data: $(this).serialize(),
            dataType: 'json',
            success: function(response) {
            	spinMe.classList.toggle("blur");
            	spinner.stop();
           		toastr.success(response, 'Success');
           	},
           	error: function(res) {
           		spinMe.classList.toggle("blur");
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