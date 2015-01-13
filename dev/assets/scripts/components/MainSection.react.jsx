var React = require('react');
var TodoActions = require('../actions/TodoActions');
var TodoItem = require('./TodoItem.react');

var MainSection = React.createClass({
  render: function() {
    if (Object.keys(this.props.todos).length < 1) {
      return null;
    }
    var allTodos = this.props.todos;
    var todos = [];
    for (var key in allTodos) {
      todos.push(<TodoItem key={key} todo={allTodos[key]} />);
    }
    return (
      <section id="main">
        <ul id="todo-list">{todos}</ul>
      </section>
    );
  }
});
module.exports = MainSection;
