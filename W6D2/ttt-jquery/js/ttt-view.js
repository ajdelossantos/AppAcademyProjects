class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents() {
    const $ul = $('ul');
    let that = this;

    $ul.on("click", function (event){
      event.preventDefault();

      const $target = $(event.target);
      let pos = [parseInt($target.attr('row')), parseInt($target.attr('col'))];

      if (that.game.board.isEmptyPos(pos)) {
        that.game.playMove(pos);
        $target.text(that.game.board.grid[pos[0]][pos[1]]);
        that.makeMove($target);
      } else {
        alert('Nope.');
      }
    });

  }

  makeMove($square) {
    $square.addClass('filled');
    if ($square.text() === 'x') {
      $square.addClass('x');
    } else {
      $square.addClass('o');
    }

    if(this.game.isOver()){
      alert(`${this.game.winner()} won!!`);
    }
  }

  setupBoard() {
      const $ul = $('<ul></ul>').addClass('grid').css({'list-style': 'none', 'display': 'flex',
    'flex-direction': 'column'});
    $('.ttt').append($ul);


    this.game.board.grid.forEach( function (row, idx1){
      let $div = $('<div></div>').css({'display': 'flex'});
      row.forEach( function (el, idx2){
          let $li = $('<li></li>').attr('row', idx1).attr('col', idx2);
           $div.append($li);
      });
      $ul.append($div);
    });

    $('li')
      .css({'border': '1px solid black',
     'padding': '80px'})
     .addClass('square');



  //  iterate over each row & column, create li
  }
}

module.exports = View;
