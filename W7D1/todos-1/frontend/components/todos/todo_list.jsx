import React from 'react';
import TodoListItem from './todo_list_item';

const TodoList = ({ todos, receiveTodo, receiveTodos }) => (
  <div>
    <h3>Todo List goes here!</h3>
    <ul>
      <TodoListItem todos={todos}/>
    </ul>
  </div>
);

export default TodoList;
