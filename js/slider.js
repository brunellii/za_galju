let currentSlide = 0;

function moveSlide(direction) {
  const slides = document.querySelectorAll('.slider-item');
  const totalSlides = slides.length;

  currentSlide += direction;

  if (currentSlide >= totalSlides) {
    currentSlide = 0;
  } else if (currentSlide < 0) {
    currentSlide = totalSlides - 1;
  }

  const sliderWrapper = document.querySelector('.slider-wrapper');
  sliderWrapper.style.transform = `translateX(-${currentSlide * 100}%)`;
}
