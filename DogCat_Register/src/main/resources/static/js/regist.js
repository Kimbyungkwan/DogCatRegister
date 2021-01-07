// tab  view
const tabBox = document.querySelector('.tab__box');

tabBox.addEventListener('click', e => {
  Array.prototype.forEach.call(tabBox.children, li => {
    console.log(li.innerHTML === e.target.innerHTML);
    if (li.innerHTML === e.target.innerHTML) {
      li.classList.add('tab__active');
    } else {
      li.classList.remove('tab__active');
    }
  });
});
