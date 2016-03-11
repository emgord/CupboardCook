Recipes = React.createClass({
  getInitialState: function(){
  return { recipes: this.props.recipes,
           user_ingredients: this.props.user_ingredients,
           recipeDetailIndexes: [],
           recipeTileChunks: [this.props.recipes]};
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
          this.triggerTileShift()
        }.bind(this),
        'JSON'
      );
    },

  resetOnChange: function(user_ingredient){
    this.removeUserIngredient(user_ingredient);
    this.resetRecipes();
  },

  getDefaultProps: function(){
    return { recipes: []};
  },

  toggleRecipeDetail: function(recipe){
    var recipes = this.state.recipes.slice();
    var recipeDetailIndexes = this.state.recipeDetailIndexes
    var index = recipes.indexOf(recipe);
    this.setState({ recipeDetail: recipe });
  },

  render: function() {
    var Recipes = this.state.recipes.map(function(recipe) {
      return (
            );}, this);

    return (
    	<div className ='recipe-list'>
        <RecipeDetail key={this.state.recipeDetail.id}
                      recipe={this.state.recipeDetail}
                      show={this.state.showRecipe}
                      hide={this.hideRecipeDetail}
                      user_ingredients={this.props.user_ingredients}
                      removeUserIngredient={this.resetOnChange} />
      </div>
    );
  }
});
