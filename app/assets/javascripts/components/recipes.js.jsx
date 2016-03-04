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
      <div className ='recipe-list'>
        <h1>Recipes</h1>
        {Recipes}
      </div>
    );
  }

});
