Recipes = React.createClass({
  getInitialState: function(){
  return { recipes: this.props.recipes,
           user_ingredients: this.props.user_ingredients,
           showRecipe: false,
           missing: 0,
           heart: false,
           query: "*"
         };
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

  toggleHeartRecipe: function(recipe){
    var recipes = this.state.recipes.slice();
    var recipe_index = recipes.indexOf(recipe);
    if (this.state.heart) {
      recipes.splice(recipe_index,1);
      this.hideRecipeDetail();
      this.triggerTileShift();
    } else {
      recipes[recipe_index].heart = !recipes[recipe_index].heart;
    }

    this.setState({ recipes: recipes });
  },

  triggerTileShift: function(){
    $(window).trigger('resize');
  },

  resetRecipes: function(){
      var search_options = {
        missing: this.state.missing,
        heart: this.state.heart,
        query: this.state.query
      };
      $.post('/recipes/find_recipes', {search_options},
        function(data) {
          this.setState({recipes:data});
          this.triggerTileShift();
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

  incrementMissing: function(){
    var missing = this.state.missing
    if (missing < 10) {
      missing++
      this.setState({missing: missing }, this.resetRecipes)
    }
  },

  decrementMissing: function(){
    var missing = this.state.missing
    if (missing > 0) {
      missing--
      this.setState({missing: missing }, this.resetRecipes)
    }
  },

  showHeart: function(){
    var heart = true;
    var missing = 40;
    this.setState({heart: heart, missing:missing }, this.resetRecipes)
  },

  showAll: function(){
    var heart = false;
    var missing = 0;
    this.setState({heart: heart, missing:missing }, this.resetRecipes)
  },

  updateQuery: function(event){
    var query = event.target.value;
    if (query == "") {
      query = "*"
    }
    this.setState({query: query})
  },

  resetQuery: function(event){
    this.setState({query: "*"})
  },

  populatePantry: function(){
    $.get('/populate_pantry',
      function(data) {
        this.resetRecipes();
      }.bind(this),
      'JSON')
  },

  render: function() {
    var show = this.state.showRecipe ? 'false' : 'true';
    if (this.state.recipeDetail == null) {
      recipeDetail = <div className ='recipe-box' aria-hidden={show}></div>;
      } else {
      recipeDetail = <div className ='recipe-box' aria-hidden={show}>
          <RecipeDetail key={this.state.recipeDetail.id}
                        recipe={this.state.recipeDetail}
                        user_ingredients={this.state.user_ingredients}
                        removeUserIngredient={this.resetOnChange}
                        hide={this.hideRecipeDetail}
                        toggleHeartRecipe={this.toggleHeartRecipe}
                         />
                     </div>;
      }
      if (this.state.recipes.length <= 1) {
        recipeTiles = <div className="welcome-text"><p> No recipes were found using your pantry items and search terms.</p><p><a href="/user_ingredients">Add ingredients to your pantry</a> or adjust your search to find more recipes.</p><p>You can also <a onClick={this.populatePantry}>fill your pantry</a> with common staple ingredients to get started.</p></div>;
      } else {
        recipeTiles = <Masonry recipes={this.state.recipes}
                 user_ingredients={this.state.user_ingredients}
                 changeRecipeDetail={this.changeRecipeDetail}
                 toggleHeartRecipe={this.toggleHeartRecipe}/>
      }
    return (
    	<div className ='recipes'>
        {recipeDetail}
        <div className="top-section">
          <h1>Recipes</h1>
          <RecipeSearch showAll={this.showAll}
                        showHeart={this.showHeart}
                        decrementMissing={this.decrementMissing}
                        incrementMissing={this.incrementMissing}
                        missing={this.state.missing}
                        heart={this.state.heart}
                        query={this.state.query}
                        updateQuery={this.updateQuery}
                        triggerSearch={this.resetRecipes}
                        resetSearch={this.resetQuery}/>
        </div>
        <div className="masonry-container bottom-section">
          {recipeTiles}
        </div>
      </div>
    );
  }
});
