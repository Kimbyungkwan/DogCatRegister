window.onload = function () {
  getAnimalCount().then(count => {
    animalCounter(count);
    // (count * 20) / count
  });
};

// animal count get
const animalCounter = count => {
  const animalCount = document.querySelector('.animal__hero__title-count');
  animalCount.innerHTML = count;
};

const getAnimalCount = async () => {
  const res = await fetch('/animal/counter');
  return await res.json();
};
