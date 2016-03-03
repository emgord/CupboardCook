var Recipes = React.createClass({

  getInitialState: function(){
  return { recipes: this.props.recipes };
  },

  getDefaultProps: function(){
    return { recipes: []};
  },

  render: function () {
    var Recipes = this.state.recipes.map(function(recipe) {
      return (
        <RecipeTile key={recipe.id}
                    recipe={recipe} />
            );}, this);

    return(
      <div id="grid" data-columns>
      <div>
        {Recipes}
      </div>
      </div>

    );
  }

});
