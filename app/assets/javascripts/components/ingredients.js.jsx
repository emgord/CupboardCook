var Ingredients = React.createClass({

	render: function () {
		var showIngredients = this.props.ingredients.map(function(ingredient){
			this.props.user_ingredients.map(function(user_ingredient){
				if (user_ingredient.ingredient_id == ingredient.id) {
						return( <div>You have it!</div> );
				} else {
					return( <Ingredient name={ingredient.name}
											id={ingredient.id}
											key={ingredient.id}
											addUserIngredient={this.props.addUserIngredient}
											resetSearch={this.props.resetSearch}/>
									 );
				}
			});
			}, this);

		return(
			<div>{showIngredients}</div>
		);
	}
});
