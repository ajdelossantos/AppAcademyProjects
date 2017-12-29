$.ajax({
  method: 'POST',
  url: 'api/users',
  data: {
    user: {
      username: "james04",
      password: "password"
    }
  }
});

$.ajax({
  method: 'POST',
  url: 'api/session',
  data: {
    user: {
      username: "james02",
      password: "password"
    }
  }
});

$.ajax({
  method: 'DELETE',
  url: 'api/session'
});
