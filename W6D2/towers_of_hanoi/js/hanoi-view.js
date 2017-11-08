class HanoiView {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }


  setupBoard(){
    const $board = $('.hanoi').css({'display':'flex'});

    this.game.towers.forEach(function(tower){
      let $tower = $('<ul></ul>').css({'display': 'flex', 'flex-direction': 'column-reverse'});
      $tower.append('_____');
      tower.forEach(function(pos){

        let $li = $('<li>DISK</li>').text(pos);
        $tower.append($li);
      });
      $board.append($tower);
    });
  }

}

module.exports = HanoiView;
