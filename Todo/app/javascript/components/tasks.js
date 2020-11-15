const TASK_ITEM = '.js-task';

class Tasks {
  constructor($el) {
    this.taskItems = $el.querySelectorAll(TASK_ITEM);

    this.bindEvents();
  }

  bindEvents() {
    Array.from(this.taskItems).forEach((item) => {
      item.addEventListener('mouseover', this.addClass);
    });

    Array.from(this.taskItems).forEach((item) => {
      item.addEventListener('mouseleave', this.removeClass);
    });
  }

  addClass = event => {
    event.target.classList.add('hovered');
  }

  removeClass = event => {
    event.target.classList.remove('hovered');
  }
}

export default Tasks;
