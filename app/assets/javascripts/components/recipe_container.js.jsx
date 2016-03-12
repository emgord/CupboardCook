Recipes = React.createClass({
  getInitialState: function(){
  return { recipes: this.props.recipes,
           user_ingredients: this.props.user_ingredients,
           firstRecipeChunk: this.props.recipes,
           secondRecipeChunk: [],
           recipeDetail: this.props.recipes[7]  };
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
          this.triggerTileShift()
        }.bind(this),
        'JSON'
      );
    },

  resetOnChange: function(user_ingredient){
    this.removeUserIngredient(user_ingredient);
    this.resetRecipes();
  },

  setRecipeChunks: function(){
    var recipes = this.state.recipes.slice();
    var index = recipes.indexOf(this.state.recipeDetail);
    var firstChunk = recipes.slice(0, index);
    var secondChunk = recipes.slice(index);
    this.setState({ firstRecipeChunk: firstChunk,
                    secondRecipeChunk: secondChunk });
  },

  changeRecipeDetail: function(recipe){
    this.setState({ recipeDetail: recipe });
    this.setRecipeChunks(recipe);
    this.triggerTileShift();
  },

  render: function() {

    return (
    	<div className ='recipes'>
        <Masonry recipes={this.state.firstRecipeChunk}
                 user_ingredients={this.state.user_ingredients}
                 changeRecipeDetail={this.changeRecipeDetail}/>
        <RecipeDetail key={this.state.recipeDetail.id}
                      recipe={this.state.recipeDetail}
                      user_ingredients={this.state.user_ingredients}
                      removeUserIngredient={this.resetOnChange} />
        <Masonry recipes={this.state.secondRecipeChunk}
                 user_ingredients={this.state.user_ingredients}
                 changeRecipeDetail={this.changeRecipeDetail}/>
      </div>
    );
  }
});
