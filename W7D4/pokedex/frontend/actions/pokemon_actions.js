import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
<<<<<<< HEAD
export const RECEIVE_SINGLE_POKEMON = 'RECEIVE_SINGLE_POKEMON';
=======
>>>>>>> 9f24b13ece4548cdc8bab839c8ee0576f85c9a5b

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

<<<<<<< HEAD
export const receiveSinglePokemon = (pokemon) => ({
  type: RECEIVE_SINGLE_POKEMON,
  pokemon
});

=======
>>>>>>> 9f24b13ece4548cdc8bab839c8ee0576f85c9a5b
export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);
<<<<<<< HEAD

export const requestSinglePokemon = (id) => (dispatch) => (
  APIUtil.fetchSinglePokemon(id)
    .then(pokemon => dispatch(receiveSinglePokemon(pokemon)))
);
=======
>>>>>>> 9f24b13ece4548cdc8bab839c8ee0576f85c9a5b
