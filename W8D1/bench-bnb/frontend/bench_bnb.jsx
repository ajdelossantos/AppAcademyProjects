import React from 'react';
import ReactDOM from 'react-dom';

// TODO remove after debugging
import * as SessionApiUtil from './util/session_api_util';

// TODO remove after debugging
const debugMode = () => {
  window.signup = SessionApiUtil.signup;
  window.login = SessionApiUtil.login;
  window.logout = SessionApiUtil.logout;
};

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<h1>Welcome to BenchBnB!</h1>, root);

  // TODO remove after debugging
  debugMode();
});
