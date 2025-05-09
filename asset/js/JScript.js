$(document).ready(function () {
    // Toggle dark mode
    $("#toggleDarkMode").click(function () {
        $(".wrapper, .sidebar, .content").toggleClass("dark-mode");
    });

    // Highlight active menu item
    $(".sidebar ul li a").click(function () {
        $(".sidebar ul li a").removeClass("active");
        $(this).addClass("active");
    });
});