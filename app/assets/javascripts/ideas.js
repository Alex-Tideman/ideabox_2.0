$(document).ready(function() {
    ideaCreation();
    editIdea();
});

function ideaCreation() {
    $("#idea-create").on('click', function (event) {

        event.preventDefault();
        var ideaParams = {
            idea: {
                title: $('#idea-title').val(), body: $('#idea-body').val()
            }
        };

        $.ajax({
            type: "POST",
            url: "/ideas",
            dataType: "json",
            data: ideaParams,
            success: function(idea) {
                renderIdea(idea);
                clearIdea();
            }
        });
    });
};

function editIdea() {
    $(".edit").on('click', function (event) {
        event.preventDefault();

        var idea_id = $(this).parent().parent().attr("data-id");

        $.ajax({
            type: "GET",
            url: "/ideas/" + idea_id + "/edit",
            success: function() {
                console.log('go to edit page for #' + idea_id)
            }
        });
    });
};

function renderIdea(idea) {
    $("#all-ideas").prepend(
    "<tr" + " data-id=" + idea.id + ">"
        + "<td class='mdl-data-table__cell--non-numeric'>" + idea.title + "</td>"
        + "<td class='mdl-data-table__cell--non-numeric'>" + trimBody(idea.body)  + "</td>"
        + "<td class='mdl-data-table__cell--non-numeric'>Swill</td>"
        + "<td class='mdl-data-table__cell--non-numeric'><button class='mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored thumbs_up'><i class='material-icons'>thumb_up</i></button></td>"
        + "<td class='mdl-data-table__cell--non-numeric'><button class='mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored thumbs_down'><i class='material-icons'>thumb_down</i></button></td>"
        + "<td class='mdl-data-table__cell--non-numeric'><button class='mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored edit'><i class='material-icons'>mode_edit</i></button></td>"
        + "<td class='mdl-data-table__cell--non-numeric'><button class='mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored delete'><i class='material-icons'>delete</i></button></td>"
        + "</tr>"
    )
};

function clearIdea() {
    $('#idea-title').val('');
    $('#idea-body').val('');
};

function trimBody(text) {
    var maxLength = 100;
    var trimmedString = text.substr(0, maxLength);
    return trimmedString.substr(0, Math.min(trimmedString.length, trimmedString.lastIndexOf(" "))) + "..."
};
