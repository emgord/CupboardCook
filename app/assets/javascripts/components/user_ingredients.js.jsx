var UserIngredients = React.createClass({

	render () {
    var UserIngredients = this.props.user_ingredients.map(function(user_ingredient) {
      return (
        <UserIngredient key={user_ingredient.id}
                        removeUserIngredient={this.props.removeUserIngredient}
                        user_ingredient={user_ingredient}
                        edit={this.props.edit} />
            );}, this);
		return (
      <div>
        {UserIngredients}
      </div>

			);
	}
});
