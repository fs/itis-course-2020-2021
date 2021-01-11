import _ from 'lodash';

class MyFunc {
  constructor($el) {
    this.$el = $el;
    this.list = $el.querySelector('.js-task-list');
    this.items = this.$el.querySelectorAll('.js-item');

    this.sortAscButton = this.$el.querySelector('.js-sort-by-title-asc');
    this.sortDescButton = this.$el.querySelector('.js-sort-by-title-desc');

    this.formattedItems = Array.from(this.items).map((item) => ({
      ...JSON.parse(item.getAttribute('data-id')),
      node: item,
    }));

    this.bindEvents();
  }

  bindEvents() {
    this.sortAscButton.addEventListener('click', this.onSortByTitleASC);
    this.sortDescButton.addEventListener('click', this.onSortByTitleDESC);
  }

  onSortByTitleASC = () => {
    const sorteItemsByTitle = _.orderBy(this.formattedItems, ['title'], ['asc']);

    sorteItemsByTitle.forEach((item) => this.list.appendChild(item.node));
    this.sortAscButton.classList.add('d-none');
    this.sortDescButton.classList.remove('d-none');
  }

  onSortByTitleDESC = () => {
    const sorteItemsByTitle = _.orderBy(this.formattedItems, ['title'], ['desc']);

    sorteItemsByTitle.forEach((item) => this.list.appendChild(item.node));

    this.sortDescButton.classList.add('d-none');
    this.sortAscButton.classList.remove('d-none');
  }
}

export default MyFunc;
