$(document).ready(function() {
    ideaCreation();
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
            }
        });
    });
};

function renderIdea(idea) {
    $("#all-ideas").append(
    "<tr data-id=" + idea.id + ">"
        + "<td class='mdl-data-table__cell--non-numeric'>" + idea.title + "</td>"
        + "<td class='mdl-data-table__cell--non-numeric'>" + idea.body  + "</td>"
        + "<td class='mdl-data-table__cell--non-numeric'>" + idea.quality + "</td>"
        + "<td class='mdl-data-table__cell--non-numeric'><button class='mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored'><i class='material-icons'>add</i></button></td>"
        + "<td class='mdl-data-table__cell--non-numeric'><button class='mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored'><i class='material-icons'>minus</i></button></td>"
        + "<td class='mdl-data-table__cell--non-numeric'><button class='mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored'><i class='material-icons'>edit</i></button></td>"
        + "<td class='mdl-data-table__cell--non-numeric'><button class='mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored'><i class='material-icons'>X</i></button></td>"
        + "</tr>"
    )
};


