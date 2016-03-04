var IngredientTile = React.createClass({

  getInitialState: function(){
  return { userIngredients: this.props.pantry_items,
           allIngredients: this.props.ingredients};
  },

  getDefaultProps: function(){
    return { user_ingredients: []};
  },


  render: function () {
    var UserIngredients = this.state.userIngredients.map(function(user_ingredient) {
      return (
        <UserIngredient key={user_ingredient.id}
                        removeUserIngredient={this.removeUserIngredient}
                        user_ingredient={user_ingredient} />
            );}, this);

    return(
        {UserIngredients}
    );
  }

});
