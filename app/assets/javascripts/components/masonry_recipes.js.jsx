Masonry = React.createClass({

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
    var Recipes = this.props.recipes.map(function(recipe) {
      return (
        <RecipeTile changeRecipeDetail={this.props.changeRecipeDetail}
                    key={recipe.id}
                    recipe={recipe} />
            );}, this);

    return (
        <div className={"uk-masonry uk-grid-width-small-1-1 uk-grid-width-medium-1-2 uk-grid-width-large-1-3"}>
            {Recipes}
        </div>
    );
  }
});
