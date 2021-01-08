// tab  view
const tabBox = document.querySelector('.tab__box');

tabBox.addEventListener('click', e => {
  const registForm = document.querySelector('.regist__form');
  const petManagement = document.querySelector('.pet__management');
  const sectionList = document
    .querySelector('.container')
    .getElementsByTagName('section');
  console.log(e.target.innerHTML);
  Array.prototype.forEach.call(tabBox.children, li => {
    if (li.innerHTML === e.target.innerHTML) {
      li.classList.add('tab__active');
    } else {
      li.classList.remove('tab__active');
    }
  });
  Array.prototype.forEach.call(sectionList, section => {
    if (section.dataset.tab === e.target.innerHTML) {
      console.log(section.dataset.tab);
      section.style.display = 'flex';
    } else {
      section.style.display = 'none';
    }
  });
});

// image upload
const fileForm = document.querySelector('.file__form');
const petPhoto = document.querySelector('.pet__photo');
const registImg = document.querySelector('.regist__img');

fileForm.addEventListener('change', e => {
  console.log(e.target.files[0]);
  fetchImg(e.target.files[0]);
});

// img fetch post
const fetchImg = async img => {
  const formData = new FormData();
  formData.append('imageFile', img);

  let response = await fetch('regist/fileUpload', {
    method: 'POST',
    body: formData,
  });
  let result = await response.json();
  console.log(result);
  petPhoto.value = result.src;
  registImg.src = result.src;
  fileForm.value = '';
};

// regist submit
const submitBtn = document.querySelector('.form__submit');
const petName = document.querySelector('.pet__name');
const petLocation = document.querySelector('.pet__location');
const needForm = document.querySelector('.need__form');

submitBtn.addEventListener('click', () => {
  if (!petName.value.length || !petLocation.value.length) {
    needForm.style.color = 'var(--color-red)';
    return;
  }
  needForm.style.color = '';
  const postForm = {};
  const inputList = document
    .querySelector('.upload__form')
    .getElementsByTagName('input');
  Array.prototype.forEach.call(inputList, input => {
    if (input.type === 'radio') {
      if (!input.checked) return;
    }
    postForm[input.name] = input.value;
  });
  console.log(postForm);
  petSubmit(postForm);
});

const petSubmit = async obj => {
  let response = await fetch('regist/pet', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8',
    },
    body: JSON.stringify(obj),
  });
  let result = await response.json();
  console.log(result);
};

// const imgObserver = new MutationObserver(e => {
//   console.log(registImg.width);
//   console.log(registImg.height);
// });
// const option = {
//   attributes: true,
//   characterData: true,
//   childList: true,
//   subtree: true,
//   attributeOldValue: true,
//   characterDataOldValue: true,
// };

// imgObserver.observe(registImg, option);
