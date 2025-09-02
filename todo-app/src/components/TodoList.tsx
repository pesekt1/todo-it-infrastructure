import Todo from "../models/todo";

interface Props {
  todos: Todo[];
  onDelete: (id: string) => void;
  onComplete: (id: string) => void;
}

const TodoList = ({ todos, onDelete, onComplete }: Props) => {
  return (
    <div>
      <h1>Todo List</h1>
      <ul className="list-group">
        {todos.map((todo) => (
          <li className="list-group-item" key={todo._id}>
            {todo.title}
            <button
              onClick={() => onComplete(todo._id)}
              className="btn btn-outline-danger m-2 rounded-pill"
            >
              {todo.completed ? "Completed" : "Not Completed"}
            </button>
            <span>{todo.date}</span>
            <button
              onClick={() => onDelete(todo._id)}
              className="btn btn-outline-danger m-2 rounded-pill"
            >
              Delete
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default TodoList;
