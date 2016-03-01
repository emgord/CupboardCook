var UserIngredients = React.createClass({

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

  render: function () {
    return(
      <div className ='pantry-list'>
        <h1>Pantry</h1>
        <IngredientSearch searchPath={this.props.searchPath}
                          addUserIngredient={this.addUserIngredient} />
          <ul>
             {this.state.user_ingredients.map(function(user_ingredient){
               return <UserIngredient key={user_ingredient.id}
                                      user_ingredient={user_ingredient}/>
             })}
          </ul>
      </div>
    );
  }
});
