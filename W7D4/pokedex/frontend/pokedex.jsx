import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
<<<<<<< HEAD
import Root from './components/root';

//TODO Remove after debugging
import { selectAllPokemons } from './reducers/selectors';
import { fetchAllPokemon, fetchSinglePokemon } from './util/api_util';
import {
  receiveAllPokemon,
  requestAllPokemon,
  receiveSinglePokemon,
  requestSinglePokemon,
} from './actions/pokemon_actions';

=======

//TODO Remove after debugging
import { selectAllPokemons } from './reducers/selectors';
import { fetchAllPokemon } from './util/api_util';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import Root from './components/root';
>>>>>>> 9f24b13ece4548cdc8bab839c8ee0576f85c9a5b

const debugFcts = (store) => {
  window.selectAllPokemons = selectAllPokemons;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.fetchAllPokemon = fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
<<<<<<< HEAD
  window.fetchSinglePokemon = fetchSinglePokemon;
  window.receiveSinglePokemon = receiveSinglePokemon;
  window.requestSinglePokemon = requestSinglePokemon;
=======
>>>>>>> 9f24b13ece4548cdc8bab839c8ee0576f85c9a5b
};

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, rootEl);

  //TODO Remove after debugging
  debugFcts(store);
});
