Masonry = React.createClass({

	componentDidMount: function() {

  	UIkit.grid(
    	$('.uk-masonry'),
      /*{gutter: this.props.values.options.gutterWidth, controls: '.uk-mansonry-filter'}*/
      {gutter: '20px'}
    );

  },

  render: function() {
    var Recipes = this.props.recipes.map(function(recipe) {
      return (
        <RecipeTile changeRecipeDetail={this.props.changeRecipeDetail}
                    key={recipe.id}
                    recipe={recipe}
										toggleHeartRecipe={this.props.toggleHeartRecipe} />
            );}, this);

    return (
        <div className={"uk-masonry uk-grid-width-small-1-1 uk-grid-width-medium-1-2 uk-grid-width-large-1-3"}>
            {Recipes}
        </div>
    );
  }
});
