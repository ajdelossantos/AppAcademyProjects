const View = require("./ttt-view");
const Game = require("./game");

$( () => {
  const game = new Game();
  const $figure = $(".ttt");
  const view = new View(game, $figure);
  view.bindEvents();
});
