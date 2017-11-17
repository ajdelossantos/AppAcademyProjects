<<<<<<< HEAD
import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';

import merge from 'lodash/merge';
=======
import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';
// import merge from 'lodash/merge';
>>>>>>> 9f24b13ece4548cdc8bab839c8ee0576f85c9a5b

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState;

<<<<<<< HEAD



  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({}, state, action.pokemon);

    case RECEIVE_SINGLE_POKEMON:
      newState = merge({}, state);

      newState[action.pokemon.pokemon.id] = action.pokemon.pokemon;
      return newState;
=======
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      newState = {};

      Object.keys(action.pokemon).forEach(key => {
        newState[key] = action.pokemon[key];
      });
      return newState;

>>>>>>> 9f24b13ece4548cdc8bab839c8ee0576f85c9a5b
    default:
      return state;
  }
};

export default pokemonReducer;
