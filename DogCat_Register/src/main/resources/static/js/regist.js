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
const myPetFetch = async userNum => {
  petList.innerHTML = `
  <tr>
    <th scope="col">#</th>
    <th scope="col">이름</th>
    <th scope="col">나이</th>
    <th scope="col">종류</th>
    <th scope="col">품종</th>
    <th scope="col">상태</th>
    <th scope="col">지역</th>
  </tr>`;
  const response = await fetch('regist/management', {
    method: 'post',
    headers: {
      'Content-Type': 'application/json',
    },
    body: userNum,
  });
  let result = await response.json();
  paintPet(result, petList);
};

// search pet paint

const paintPet = (dataList, target) => {
  target.innerHTML += `<tbody>`;
  dataList.map((data, i) => {
    const petNum = dataList.length - i;
    const petTag = `
    <tr data-pet-num="${data.pet_num}" data-img-src="${data.pet_photo}" style="cursor: pointer;" class="pet__data__view">
        <th scope="row">${petNum}</th>
        <td>${data.pet_name}</td>
        <td>${data.pet_age}</td>
        <td>${data.pet_type}</td>
        <td>${data.pet_species}</td>
        <td>${data.pet_status}</td>
        <td>${data.pet_location}</td>
    </tr>
    <tr data-pet-num="${data.pet_num}" data-img-src="${data.pet_photo}" class="pet__save__form pet__save__form__showing">
        <th scope="row" class="pet__save__btn">저장</th>
        <td><input type="text" value="${data.pet_name}"></td>
        <td><input type="text" value="${data.pet_age}"></td>
        <td><input type="text" value="${data.pet_type}"></td>
        <td><input type="text" value="${data.pet_species}"></td>
        <td><input type="text" value="${data.pet_status}"></td>
        <td><input type="text" value="${data.pet_location}"></td>
    </tr>
    `;
    target.innerHTML += petTag;
  });
  target.innerHTML += `</tbody>`;
};

petList.addEventListener('click', e => {
  const formTarget = e.target.parentNode.dataset.petNum;
  if (formTarget) {
    Array.prototype.forEach.call(petList.children, item => {
      if (formTarget === item.dataset.petNum) {
        if (item.matches('.pet__save__form')) {
          item.classList.toggle('pet__save__form__showing');
        }
      }
    });
  }
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
