Recipes = React.createClass({
  getInitialState: function(){
  return { recipes: this.props.recipes,
           user_ingredients: this.props.user_ingredients,
           recipeDetail: this.props.recipes[9]  };
  },

  getDefaultProps: function(){
    return { recipes: []};
  },

  removeUserIngredient: function(user_ingredient){
    var user_ingredients = this.state.user_ingredients.slice();
    var index = user_ingredients.indexOf(user_ingredient);
    user_ingredients.splice(index,1);
    this.setState({ user_ingredients: user_ingredients });
  },

  triggerTileShift: function(){
    $(window).trigger('resize');
  },

  resetRecipes: function(){
      $.get('/users/recipes/',
        function(data) {
          this.setState({recipes:data});
          $(window).trigger('resize');
        }.bind(this),
        'JSON'
      );
    },

  resetOnChange: function(user_ingredient){
    this.removeUserIngredient(user_ingredient);
    this.resetRecipes();
  },

  changeRecipeDetail: function(recipe){
    this.setState({ recipeDetail: recipe });
  },

  render: function() {

    return (
    	<div className ='recipes'>
      <div className ='recipe-box' aria-hidden="false">
        <RecipeDetail key={this.state.recipeDetail.id}
                      recipe={this.state.recipeDetail}
                      user_ingredients={this.state.user_ingredients}
                      removeUserIngredient={this.resetOnChange} />
      </div>
      <div className="masonry-container">
        <Masonry recipes={this.state.recipes}
                 user_ingredients={this.state.user_ingredients}
                 changeRecipeDetail={this.changeRecipeDetail}/>
      </div>
      </div>
    );
  }
});
