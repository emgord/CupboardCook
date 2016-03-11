Masonry = React.createClass({
  getInitialState: function(){
  return { recipes: this.props.recipes,
           recipeDetail: this.props.recipes[0],
           user_ingredients: this.props.user_ingredients,
           showRecipe: false };
  },

  showRecipeDetail: function() {
    this.setState({showRecipe: true});
  },
  hideRecipeDetail: function() {
    this.setState({showRecipe: false});
  },

  removeUserIngredient: function(user_ingredient){
    var user_ingredients = this.state.user_ingredients.slice();
    var index = user_ingredients.indexOf(user_ingredient);
    user_ingredients.splice(index,1);
    this.setState({ user_ingredients: user_ingredients });
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

  getDefaultProps: function(){
    return { recipes: []};
  },

  changeRecipeDetail: function(recipe){
    this.setState({ recipeDetail: recipe });
    this.showRecipeDetail();
  },

	componentDidMount: function() {

  	var scrollspy = 'uk-animation-fade';
    var filterControl = $('.uk-masonry').prev();

  	UIkit.grid(
    	$('.uk-masonry'),
      /*{gutter: this.props.values.options.gutterWidth, controls: '.uk-mansonry-filter'}*/
      {gutter: '20px', controls: filterControl}
    );

    UIkit.domObserve('#container', function(element) {
    /* apply on dom change within element */
    $('[data-uk-scrollspy]').on('inview.uk.scrollspy', function(){
    this.className = scrollspy;
		});
    })

  },

  render: function() {
    var Recipes = this.state.recipes.map(function(recipe) {
      return (
        <RecipeTile changeRecipeDetail={this.changeRecipeDetail}
                    key={recipe.id}
                    recipe={recipe} />
            );}, this);

    return (
    	<div className ='recipe-list'>
        <RecipeDetail key={this.state.recipeDetail.id}
                      recipe={this.state.recipeDetail}
                      show={this.state.showRecipe}
                      hide={this.hideRecipeDetail}
                      user_ingredients={this.props.user_ingredients}
                      removeUserIngredient={this.resetOnChange} />

        <div className={"uk-masonry uk-grid-width-small-1-1 uk-grid-width-medium-1-2 uk-grid-width-large-1-3"}>
            {Recipes}
        </div>
      </div>
    );
  }
});
