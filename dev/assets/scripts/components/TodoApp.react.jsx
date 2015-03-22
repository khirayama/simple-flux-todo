var React = require('react');
var Header = require('./Header.react');
var MainSection = require('./MainSection.react');
var TodoStore = require('../stores/TodoStore');

var TodoApp = React.createClass({
  getInitialState: function() {
    return {
      todos: TodoStore.getAll()
    };
  },
  componentDidMount: function() {
    TodoStore.addChangeListener(this._onChange);
  },
  render: function() {
  	return (
      <div>
        <Header />
        <MainSection todos={this.state.todos} />
      </div>
  	);
  },
  _onChange: function() {
    this.setState({
      todos: TodoStore.getAll()
    });
  }
});
module.exports = TodoApp;
