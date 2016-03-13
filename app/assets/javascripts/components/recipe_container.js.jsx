Recipes = React.createClass({
  getInitialState: function(){
  return { recipes: this.props.recipes,
           user_ingredients: this.props.user_ingredients,
           recipeDetail: this.props.recipes[0],
           showRecipe: false};
  },

  getDefaultProps: function(){
    return { recipes: []};
  },

  showRecipeDetail: function() {
    this.setState({showRecipe: true});
    document.body.classList.add('no-scroll');
  },

  hideRecipeDetail: function() {
    this.setState({showRecipe: false});
    document.body.classList.remove('no-scroll');
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
    this.showRecipeDetail();
  },

  render: function() {
    var show = this.state.showRecipe ? 'false' : 'true';
    return (
    	<div className ='recipes'>
      <div className ='recipe-box' aria-hidden={show}>
        <RecipeDetail key={this.state.recipeDetail.id}
                      recipe={this.state.recipeDetail}
                      user_ingredients={this.state.user_ingredients}
                      removeUserIngredient={this.resetOnChange}
                      hide={this.hideRecipeDetail} />
      </div>
      <div className="top-section">
        <h1>Recipes</h1>
      </div>
      <div className="masonry-container bottom-section">
        <Masonry recipes={this.state.recipes}
                 user_ingredients={this.state.user_ingredients}
                 changeRecipeDetail={this.changeRecipeDetail}/>
      </div>
      </div>
    );
  }
});
