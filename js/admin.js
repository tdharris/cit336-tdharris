/* ******************************************
*  Admin Functions
* ******************************************/

// function addProject() {

// };

$('#deleteProject').submit(function(event) {
    event.preventDefault();
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

$('#addProject').submit(function(event) {
    event.preventDefault();
    var addForm = document.getElementById("addProject");
    // var projectName = document.querySelectorAll("#addProject input[name=projectName]");
    var projectName = $('#addProject input[name=projectName]').val();

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
        }).spin(addForm);

        $.ajax({
            type: 'POST',
            url: 'controllers/admin/addProject.php',
            data: $(this).serialize(),
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

// function deleteProject() {
	

// 	console.log('deleting...');
// 	console.log(this);
// 	console.log('done');
// };

// function editProject() {

// };

// Utility Functions
function validateInput(str) {
	return str.length > 0;
};