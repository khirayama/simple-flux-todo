var AppDispatcher = require('../dispatcher/AppDispatcher');
var TodoConstants = require('../constants/TodoConstants');

var TodoActions = {
  create: function(text) {
    console.log('action');
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.TODO_CREATE,
      text: text
    });
  },
  updateText: function(id, text) {
    console.log('action');
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.TODO_UPDATE_TEXT,
      id: id,
      text: text
    });
  },
  toggleComplete: function(todo) {
    console.log('action');
    var id = todo.id;
    if (todo.complete) {
      AppDispatcher.handleViewAction({
        actionType: TodoConstants.TODO_UNDO_COMPLETE,
        id: id
      });
    } else {
      AppDispatcher.handleViewAction({
        actionType: TodoConstants.TODO_COMPLETE,
        id: id
      });
    }
  },
  destroy: function(id) {
    console.log('action');
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.TODO_DESTROY,
      id: id
    });
  },
};
module.exports = TodoActions;
