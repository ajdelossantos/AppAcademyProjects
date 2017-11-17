import React from 'react';
import { Provider } from 'react-redux';
<<<<<<< HEAD
import PokemonIndexContainer from './pokemon/pokemon_index_container';
import { HashRouter, Route } from 'react-router-dom';

const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      <div>
        <h2>The Pokedex</h2>
        <Route path="/" component={PokemonIndexContainer} />
      </div>
    </HashRouter>
=======
// import { selectAllPokemons } from '../reducers/selectors';

const Root = ({ store }) => (
  <Provider store={store}>
    <div>hello</div>
>>>>>>> 9f24b13ece4548cdc8bab839c8ee0576f85c9a5b
  </Provider>
);

export default Root;
