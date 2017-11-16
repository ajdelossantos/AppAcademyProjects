import React from 'react';

class PokemonIndex extends React.Component {
  componentDidMount () {
    this.props.requestAllPokemon();
  }

  render () {

    return (
      <div>
        <ul>
        {
          this.props.pokemon.map((poke) =>
          <li key={poke.id}> {poke.name} <img className="img" src={poke.image_url}></img></li>
          )
        }
        </ul>
      </div>
  );
  }
}

export default PokemonIndex;
