window.onload = function () {
  getAnimalCount().then(count => {
    animalCounter(count, 20);
    // (count * 20) / count
  });
};

// animal count get
const animalCounter = (count, sec) => {
  const animalCount = document.querySelector('.animal__hero__title-count');
  let i = 0;
  const counter = setInterval(() => {
    if (i <= count) {
      animalCount.innerHTML = i++;
    } else {
      clearInterval(counter);
    }
  }, sec);
};

const getAnimalCount = async () => {
  const res = await fetch('/animal/counter');
  return await res.json();
};
