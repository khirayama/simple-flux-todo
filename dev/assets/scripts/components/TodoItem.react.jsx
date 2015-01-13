var React = require('react');
var TodoActions = require('../actions/TodoActions');
var TodoTextInput = require('./TodoTextInput.react');

var TodoItem = React.createClass({
  getInitialState: function() {
    return {
      isEditing: false
    };
  },
  render: function() {
    var todo = this.props.todo;
    var input;
    if (this.state.isEditing) {
      input =
        <TodoTextInput className="edit" onSave={this._onSave} value={todo.text} />;
    }
    return (
      <li className={cx({
          'completed': todo.complete,
          'editing': this.state.isEditing
        })}
        key={todo.id}>
        <div className="view">
          <div className="toggle" onClick={this._onToggleComplete}></div>
          <label onClick={this._onLabelClick}>{todo.text}</label>
          <div className="destroy" onClick={this._onDestroyClick}></div>
        </div>
        {input}
      </li>
    );
  },
  _onToggleComplete: function() {
    TodoActions.toggleComplete(this.props.todo);
  },
  _onLabelClick: function() {
    this.setState({isEditing: true});
  },
  _onSave: function(text) {
    TodoActions.updateText(this.props.todo.id, text);
    this.setState({isEditing: false});
  },
  _onDestroyClick: function() {
    TodoActions.destroy(this.props.todo.id);
  }
});

function cx(classNames) {
  if (typeof classNames == 'object') {
    return Object.keys(classNames).filter(function(className) {
      return classNames[className];
    }).join(' ');
  } else {
    return Array.prototype.join.call(arguments, ' ');
  }
};

module.exports = TodoItem;
