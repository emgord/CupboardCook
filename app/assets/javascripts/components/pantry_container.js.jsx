var Pantry = React.createClass({

  getInitialState: function(){
  return { user_ingredients: this.props.pantry_items,
           ingredients: this.props.ingredients,
           searchPath: this.props.searchPath};
  },

  getDefaultProps: function(){
    return { user_ingredients: []};
  },

  addUserIngredient: function(user_ingredient){
    var user_ingredients = this.state.user_ingredients.slice();
    user_ingredients.push(user_ingredient);
    this.setState({ user_ingredients: user_ingredients });
  },

  removeUserIngredient: function(user_ingredient){
    var user_ingredients = this.state.user_ingredients.slice();
    var index = user_ingredients.indexOf(user_ingredient);
    user_ingredients.splice(index,1);
    this.setState({ user_ingredients: user_ingredients });
  },

  render: function () {
    var UserIngredients = this.state.user_ingredients.map(function(user_ingredient) {
      return (
        <UserIngredient key={user_ingredient.id}
                        removeUserIngredient={this.removeUserIngredient}
                        user_ingredient={user_ingredient} />
            );}, this);

    return(
      <div className ='pantry-list'>
        <IngredientSearch searchPath={this.props.searchPath}
                          addUserIngredient={this.addUserIngredient}
                          removeUserIngredient={this.removeUserIngredient}
                          userIngredients={this.state.user_ingredients} />
        <h1>Pantry</h1>
        {UserIngredients}
      </div>
    );
  }

});
