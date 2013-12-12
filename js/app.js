/**/
Todos = Ember.Application.create();

/**/
Todos.ApplicationAdapter = DS.LSAdapter.extend({
  namespace: 'todos-emberjs'
});
// Todos.ApplicationAdapter = DS.FixtureAdapter.extend();

window.Todos = Todos;