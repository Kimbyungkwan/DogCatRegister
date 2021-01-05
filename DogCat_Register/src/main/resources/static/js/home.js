/**
 *
 */

console.log('asd');

const menuToggle = document.querySelector('.menu__toggle');
const navMenu = document.querySelector('.navbar__menu');

menuToggle.addEventListener('click', () => {
  navMenu.classList.toggle('navbar__showing');
});
