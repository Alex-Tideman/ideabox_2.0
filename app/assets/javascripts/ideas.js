$(document).ready(function() {
    ideaCreation();
    ideaDestroy();
    thumbsUp();
    thumbsDown();
    $('.best_in_place').best_in_place();
});

function ideaCreation() {
    $("#idea-create").on('click', function (event) {

        event.preventDefault();
        var ideaParams = {
            idea: {
                title: $('#new-idea-title').val(), body: $('#new-idea-body').val()
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


function ideaDestroy() {
    $(".delete").on('click', function () {

        var ideaId = $(this).parent().parent().attr("data-id");
        var ideaRow = $(this).parent().closest('tr');

        $.ajax({
            url: "/ideas/" + ideaId,
            type: "DELETE",
            dataType: "json",
            data: { id: ideaId},
            success: function(idea) {
                ideaRow.remove();
            }
        });
    });
};

function thumbsUp(){
    $('.thumbs_up').on('click', function () {

        var ideaId = $(this).parent().parent().attr("data-id");
        var quality = $(this).parent().parent().find('.quality');

        $.ajax({
            url: "/quality/" + ideaId + "/up",
            type: "PUT",
            dataType: "json",
            data: { id: ideaId },
            success: function() {
            }
        });
    })
}

function thumbsDown(){


    $('.thumbs_down').on('click', function () {

        var ideaId = $(this).parent().parent().attr("data-id");
        var quality = $(this).parent().parent().find('.quality');

        $.ajax({
            url: "/quality/" + ideaId + "/down",
            type: "PUT",
            dataType: "json",
            data: { id: ideaId },
            success: function() {
            }
        });
    });
}


function renderIdea(idea) {
    $("#all-ideas").prepend(
    "<tr" + " data-id=" + idea.id + ">"
        + "<td class='title'>" + idea.title + "</td>"
        + "<td class='body'>" + trimBody(idea.body)  + "</td>"
        + "<td class='quality'>Swill</td>"
        + "<td class='button-col'><button class='btn-floating btn-large waves-effect waves-light green thumbs_up'><i class='material-icons'>thumb_up</i></button></td>"
        + "<td class='button-col'><button class='btn-floating btn-large waves-effect waves-light red thumbs_down'><i class='material-icons'>thumb_down</i></button></td>"
        + "<td class='button-col'><button class='btn-floating btn-large waves-effect waves-light black delete'><i class='material-icons'>delete</i></button></td>"
        + "</tr>"
    )
};

function clearIdea() {
    $('#idea-title').val('');
    $('#idea-body').val('');
};

function trimBody(text) {
    var maxLength = 100;
    if(text.length > 100) {
        var trimmedString = text.substr(0, maxLength);
        return trimmedString.substr(0, Math.min(trimmedString.length, trimmedString.lastIndexOf(" "))) + "..."
    }
    else {
        return text
    }
};

