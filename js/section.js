document.addEventListener("DOMContentLoaded", function() {
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('is-visible');
            } else {
                entry.target.classList.remove('is-visible');
            }
        });
    }, {
        threshold: 0.5 // Adjust if necessary to trigger the animation earlier or later
    });

    // Observe all sections
    document.querySelectorAll("section").forEach(section => {
        observer.observe(section);
    });
});
