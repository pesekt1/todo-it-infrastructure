import Todo from "../models/todo";

const todo = new Todo({
  title: "todo 1",
});

const todos = [
  new Todo({
    title: "todo 1",
  }),
  new Todo({
    title: "todo 2",
  }),
  new Todo({
    title: "todo 3",
  }),
];

export default async () => {
  try {
    await Todo.deleteMany({});
    await Todo.insertMany(todos);
  } catch (error) {
    console.error(error);
  }
};
