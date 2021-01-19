const findAnimalItems = document.querySelectorAll('.findAnimal__list__item');
const detailWindow = document.querySelector('.lost__pet__detail__container');

const closeBtn = document.querySelector('.close-btn');
const containerCloseBtn = document.querySelector(
  '.lost__pet__detail__container'
);
// detail창 닫기

detailWindow.addEventListener('click', e => {
  console.log(e.target);
  if (e.target == closeBtn || e.target == detailWindow) {
    detailWindow.style.display = 'none';
  }
});

// 데이터 불러서 detail창 오픈

findAnimalItems.forEach(item => {
  item.addEventListener('click', async e => {
    const data = await fetchPet(item.dataset.lostPetNum);
    dataPainting(data);
  });
});

const fetchPet = async petNum => {
  const response = await fetch(`/find/lostpet/${petNum}`, {
    method: 'post',
    headers: {
      'Content-Type': 'application/json',
    },
    body: petNum,
  });
  let result = await response.json();
  return result.test;
};

const dataPainting = obj => {
  const {
    lost_pet_admin: admin,
    lost_pet_name: name,
    lost_pet_age: age,
    lost_pet_content: content,
    lost_pet_location: location,
    lost_pet_photo: photo,
    lost_pet_sex: sex,
    lost_pet_species: species,
    lost_pet_date: lostDate,
  } = obj;

  const lostPetDetail = document.querySelector('.lost__pet__detail');
  detailWindow.style.display = 'flex';
  lostPetDetail.innerHTML = `
    <div class="lost__pet-left">
        <img class="lost__pet__image" src="/static/${photo}" alt="${admin}_${name}">
    </div>
    <div class="lost__pet-right">
        <dl class="detail__content-top">
            <dt>이름</dt>   
            <dd class="detail__lost__pet__name">${name}</dd>
            <dt>성별</dt>
            <dd class="detail__lost__pet__sex">${sex}</dd>
            <dt>나이</dt>
            <dd class="detail__lost__pet__age">${age}</dd>
            <dt>품종</dt>
            <dd class="detail__lost__pet__species">${species}</dd>
            <dt>거주지</dt>
            <dd class="detail__lost__pet__location">${location}</dd>
            <dt>잃어버린 날짜</dt>
            <dd class="detail__lost__pet__lostDate">${lostDate}</dd>
        </dl>
            <div class="detail__lost__pet__content">
                ${content}
            </div>
    </div>
  `;
};
