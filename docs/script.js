// Smart Assist AI Portfolio
// Jeremiah Lupton


console.log("Smart Assist AI Portfolio Loaded");


// Fade-in animation when sections enter viewport

const sections = document.querySelectorAll("section");


const observer = new IntersectionObserver(
(entries) => {

entries.forEach(entry => {

if(entry.isIntersecting){

entry.target.classList.add("show");

}

});

},
{
threshold:0.15
}
);



sections.forEach(section => {

section.classList.add("hidden");

observer.observe(section);

});