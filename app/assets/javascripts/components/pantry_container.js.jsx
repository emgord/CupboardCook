var Pantry = React.createClass({

  getInitialState: function(){
  return { user_ingredients: this.props.pantry_items,
           ingredients: this.props.ingredients,
           searchPath: this.props.searchPath,
           userIngredientEdit: false};
  },

  getDefaultProps: function(){
    return { user_ingredients: []};
  },

  toggleAllIngredientsEdit: function(){
    this.setState({ userIngredientEdit: !this.state.userIngredientEdit });
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

    return(
      <div className ='pantry-list'>
        <IngredientSearch searchPath={this.props.searchPath}
                        addUserIngredient={this.addUserIngredient}
                        removeUserIngredient={this.removeUserIngredient}
                        userIngredients={this.state.user_ingredients} />

        <div className="bottom-section">
          <h2>My Ingredients:</h2>
          <a onClick={this.toggleAllIngredientsEdit}>Edit Pantry</a>
          <UserIngredients user_ingredients={this.state.user_ingredients}
                           edit={this.state.userIngredientEdit}
                           removeUserIngredient={this.removeUserIngredient}/>
        </div>
      </div>
    );
  }

});
