import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tabs from './tabs';

const Files = [
  { title: "one", content: "I am the first" },
  { title: "two", content: "Second pane here" },
  { title: "three", content: "Third pane here" }
];

  class Root extends React.Component {
    render () {
      return(
        <div>
          <Clock />
          <Tabs files={ Files } />
        </div>
      );
    }
  }

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Root/>, document.getElementById('main'));
});
