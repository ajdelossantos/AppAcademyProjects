import React from 'react';
import TodoListContainer from  './todos/todo_list_container';

class App extends React.Component {
  render() {
    return (
      <div>
        <h1>Todo App</h1>
        <TodoListContainer />
      </div>
    );
  }
}

export default App;
