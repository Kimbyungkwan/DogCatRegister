const animalCounter = sec => {
  const animalCount = document.querySelector('.animal__hero__title-count');
  let count = 0;
  const counter = setInterval(() => {
    if (count <= 100) {
      animalCount.innerHTML = count++;
    } else {
      clearInterval(counter);
    }
  }, sec);
};

animalCounter(10);
