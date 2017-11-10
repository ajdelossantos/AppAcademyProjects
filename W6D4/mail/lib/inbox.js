class Inbox {
  // constructor() {}

  render () {
    const ul = document.createElement('ul');
    ul.className = "Spam";
    ul.innerHTML = "Try this weird trick to make your...";
    return ul;
  }
}

export default Inbox;
