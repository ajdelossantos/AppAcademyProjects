import { combineReducers } from 'redux';
import pokemonReducer from './pokemon_reducer';
<<<<<<< HEAD
import itemReducer from './item_reducer';
// import uiReducer from './ui_reducer';

const entitiesReducer = combineReducers({
  pokemon: pokemonReducer,
  items: itemReducer
  // ui: uiReducer
=======

const entitiesReducer = combineReducers({
  pokemon: pokemonReducer
>>>>>>> 9f24b13ece4548cdc8bab839c8ee0576f85c9a5b
});

export default entitiesReducer;
