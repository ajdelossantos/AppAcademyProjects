export const fetchAllPokemon = () => (
  $.ajax({
    method: 'GET',
    url: '/api/pokemon',
    dataType: 'json'
  })
);
<<<<<<< HEAD

export const fetchSinglePokemon = id => (
  $.ajax({
    method: 'GET',
    url: `/api/pokemon/${id}`,
    dataType: 'json'
  })
);
=======
>>>>>>> 9f24b13ece4548cdc8bab839c8ee0576f85c9a5b
