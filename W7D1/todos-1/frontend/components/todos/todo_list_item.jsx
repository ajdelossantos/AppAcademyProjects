import React from 'react';

const TodoListItem = ({todos}) => (
  todos.map((todo, index) => (
    <li key={index}>{todo.title}</li>
  ))
);

export default TodoListItem;
