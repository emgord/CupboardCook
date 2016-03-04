Masonry = React.createClass({
  getInitialState: function(){
  return { recipes: this.props.recipes,
           recipeDetail: this.props.recipes[0],
           showRecipe: false };
  },

  showRecipeDetail: function() {
    this.setState({showRecipe: true});
  },
  hideRecipeDetail: function() {
    this.setState({showRecipe: false});
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
                      hide={this.hideRecipeDetail} />

        <div className={"uk-masonry uk-grid-width-small-1-1 uk-grid-width-medium-1-2 uk-grid-width-large-1-3"}>
            {Recipes}
        </div>
      </div>
    );
  }
});
