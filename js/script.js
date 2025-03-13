document.addEventListener("DOMContentLoaded", function () {
    const dropdownToggle = document.querySelector(".compte");
    const dropdownList = document.querySelector(".w-dropdown-list");

    dropdownToggle.addEventListener("click", function (event) {
        event.stopPropagation();
        console.log("Clic détecté sur .compte !");
        dropdownList.classList.toggle("active");
        console.log("Classe active : ", dropdownList.classList.contains("active"));
    });

    document.addEventListener("click", function () {
        dropdownList.classList.remove("active");
        console.log("Clic en dehors : fermeture du menu.");
    });

    dropdownList.addEventListener("click", function (event) {
        event.stopPropagation();
    });
});



/*
document.addEventListener("DOMContentLoaded", function () {
    const dropdownToggle = document.querySelector(".compte");
    const dropdownList = document.querySelector(".w-dropdown-list");
    
    dropdownToggle.addEventListener("click", function (event) {
        event.stopPropagation(); // Empêche la propagation de l'événement vers le document
        dropdownList.classList.toggle("active");
    });
    
    document.addEventListener("click", function () {
        dropdownList.classList.remove("active");
    });
    
    dropdownList.addEventListener("click", function (event) {
        event.stopPropagation(); // Empêche la fermeture lors d'un clic sur la liste
    });
});*/
