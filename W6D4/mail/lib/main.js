// console.log("It's working");

import Router from './router';
import Inbox from './inbox';

document.addEventListener("DOMContentLoaded", () => {
  // document.querySelector("ul.sidebar-nav").addEventListener("click", (event) =>{
  const hashLinker = (el) => {
    el.addEventListener("click", (event) =>{
      event.preventDefault();
      const newLocation = event.target.innerText;
      window.location.hash = newLocation.toLowerCase();
    });
  };

  document.querySelectorAll(".sidebar-nav li").forEach(hashLinker);

  const contentNode = new Router(document.querySelector('.content'));
  contentNode.start();

});

const routes = {
  inbox: Inbox
};
