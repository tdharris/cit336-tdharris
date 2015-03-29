/* ******************************************
*    Contact Me Form Submission & Validation
* ******************************************/

function validateName(str) {
    return str.length > 0;
};

function validateEmail(str) {
    var lastAtPos = str.lastIndexOf('@');
    var lastDotPos = str.lastIndexOf('.');
    return (lastAtPos < lastDotPos && lastAtPos > 0 && str.indexOf('@@') == -1 && lastDotPos > 2 && (str.length - lastDotPos) > 2);
};

function validateMessage(str) {
    return str.length > 0;
};

function validate() {
    // Establish variables from the DOM
    var name = document.getElementsByName("name")[0].value,
        email = document.getElementsByName("email")[0].value,
        message = document.getElementsByName("message")[0].value;

    return (validateName(name) && validateEmail(email) && validateMessage(message));
};

function spinner(action, target) {

    if(action == 'start') {
        var spinIt = new Spinner({
            lines: 9,
            length: 0,
            width: 12,
            radius: 26,
            corners: 1.0,
            rotate: 0,
            trail: 48,
            speed: 0.9,
            direction: 1
        }).spin(target);
    } else if(action == 'stop') {
        spinIt.stop();
    };
    
};

function sendMail() {
    // Prevent the page from refreshing onSubmit
    event.preventDefault();

    var submitButton = document.getElementsByName("submit")[0].value;
    var resetButton = document.getElementsByName("reset")[0];
    var contactForm = document.getElementById("contact");

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
        }).spin(contactForm);

    if(!validate()) {
        toastr.error('Oops! Something is wrong, please verify your inputs.', 'Error!');
        spinner.stop();

    } else {

        $.post('sendMail.php', $('#contact').serialize(), function(data){
            toastr.success(data);
            spinner.stop();
            resetButton.click();

        }).fail(function(data) {
            toastr.error(data.responseText, 'Error ' + data.status + ' ' + data.statusText);
            spinner.stop();

        });
    };

};