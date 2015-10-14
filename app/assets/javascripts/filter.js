$(document).ready(function() {
    tableFilter();
});

function tableFilter() {
    $("#ideas_search input").keyup(function () {
        $.get($("#ideas_search").attr("action"), $("#ideas_search").serialize(), null, "script");
        return false;
    });
};