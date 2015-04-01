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


	/* ******************************************
	*  Admin Functions
	* ******************************************/
	// Disabling autoDiscover, otherwise Dropzone will try to attach twice.
	Dropzone.autoDiscover = false;   

	var options = {
		paramName: "attachments", // The name that will be used to transfer the file
		url: "upload.php",
		acceptedFiles: "image/*",
		autoProcessQueue: false,
		uploadMultiple: true,
		parallelUploads: 100,
		addRemoveLinks: true,
		maxFiles: 10
		// ,
		// init: function() {
			 
		// 	var myDropzone = this;

		// 	// First change the button to actually tell Dropzone to process the queue.
		//     // this.element.querySelector("button[type=submit]").addEventListener("click", function(e) {
		//     //   // Make sure that the form isn't actually being sent.
		//     //   e.preventDefault();
		//     //   e.stopPropagation();
		//     //   myDropzone.processQueue();
		//     // });

		//     this.on("success", function(res) {
	 //            return res;
	 //        });

	 //    }
	};

	var dz_addPics = new Dropzone("div#addPics", {
		url: "upload.php",
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
						// var projectName = document.querySelectorAll("#addProject input[name=projectName]");
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
		            url: 'controllers/admin/addProject.php',
		            data: ($("#addProject").serialize()+'&'+$.param({ 'fileIDs': res })),
		            dataType: 'json',
		            success: function(response) {
		            	$('#deleteProject select').append($(document.createElement("option")).text(projectName).prop('selected', true));
		            	spinner.stop();
		           		toastr.success(response, 'Success');
		           	},
		           	error: function(res) {
		           		spinner.stop();
		           		console.log(res);
		           		toastr.error(res.responseText, 'Error!');
		           	}
		        });
	            
	        });

			// Setup the observer for the button.
			document.querySelector("#addProject input[name=reset]").addEventListener("click", function() {
				// Using "_this" here, because "this" doesn't point to the dropzone anymore
				myDropzone.removeAllFiles();
				// If you want to cancel uploads as well, you
				// could also call _this.removeAllFiles(true);
			});

	    }
	});

	var dz_editPics = new Dropzone("div#editPics", options);

	$('#deleteProject').submit(function(event) {
	    event.preventDefault();
	    event.stopPropagation();
	    var deleteForm = document.getElementById("deleteProject");
	    var projectName = $('#deleteProject select :selected');

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
            url: 'controllers/admin/deleteProject.php',
            data: $(this).serialize(),
            dataType: 'json',
            success: function(response) {
            	projectName.remove();
            	spinner.stop();
           		toastr.success(response, 'Success');
           	},
           	error: function(res) {
           		spinner.stop();
           		toastr.error(res.responseText, 'Error!');
           	}
        });
	});

	// function deleteProject() {
		

	// 	console.log('deleting...');
	// 	console.log(this);
	// 	console.log('done');
	// };

	// function editProject() {

	// };

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
});