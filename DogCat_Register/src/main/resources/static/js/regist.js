// tab  view
const tabBox = document.querySelector('.tab__box');

tabBox.addEventListener('click', e => {
  const registForm = document.querySelector('.regist__form');
  const petManagement = document.querySelector('.pet__management');
  const userNum = document.querySelector('.user_Num').value;
  const sectionList = document
    .querySelector('.container')
    .getElementsByTagName('section');
  Array.prototype.forEach.call(tabBox.children, li => {
    if (li.innerHTML === e.target.innerHTML) {
      li.classList.add('tab__active');
    } else {
      li.classList.remove('tab__active');
    }
  });
  Array.prototype.forEach.call(sectionList, section => {
    if (section.dataset.tab === e.target.innerHTML) {
      section.style.display = 'flex';
      if (section.dataset.tab === '동물 관리하기' && userNum) {
        myPetFetch(userNum);
      }
    } else {
      section.style.display = 'none';
    }
  });
});

// mypet Search
const petList = document.querySelector('.pet__list');
const petTable = document.querySelector('.pet__table__body');
const myPetFetch = async userNum => {
  petTable.innerHTML = '';
  const response = await fetch('regist/management', {
    method: 'post',
    headers: {
      'Content-Type': 'application/json',
    },
    body: userNum,
  });
  let result = await response.json();
  paintPet(result, petTable);
};

// search pet paint

const paintPet = (dataList, target) => {
  dataList.map((data, i) => {
    const petNum = dataList.length - i;
    const petTag = `
    <li data-img-src="${data.pet_photo}" style="cursor: pointer;" class="pet__data__view">
      <div data-pet-num="${data.pet_num}" class="pet__table__data">
        <p>${petNum}</p>
        <p>${data.pet_name}</p>
        <p>${data.pet_age}</p>
        <p>${data.pet_type}</p>
        <p>${data.pet_species}</p>
        <p>${data.pet_status}</p>
        <p>${data.pet_location}</p>
      </div>
      <div class="pet__table__data-form ">
        <input class="pet__data__set-btn" type="button" value="저장"></input>
        <input class="pet__data__set" type="text" value="${data.pet_name}">
        <input class="pet__data__set" type="text" value="${data.pet_age}">
        <input class="pet__data__set" type="text" value="${data.pet_type}">
        <input class="pet__data__set" type="text" value="${data.pet_species}">
        <input class="pet__data__set" type="text" value="${data.pet_status}">
        <input class="pet__data__set" type="text" value="${data.pet_location}">
      <div>
    </li>
    `;
    target.innerHTML += petTag;
  });
};

petTable.addEventListener('click', e => {
  if (!e.target.parentNode.classList.contains('pet__table__data')) return;
  e.target.parentNode.nextSibling.nextSibling.classList.toggle(
    'pet__table__data-form-showing'
  );
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
