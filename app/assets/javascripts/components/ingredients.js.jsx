var Ingredients = React.createClass({

	render: function () {
		var showIngredients = this.props.ingredients.map(function(ingredient){
			return( <Ingredient name={ingredient.name}
									id={ingredient.id}
									key={ingredient.id}
									addUserIngredient={this.props.addUserIngredient}
									resetSearch={this.props.resetSearch}
								/>
		);}, this);

		return(
			<div>{showIngredients}</div>
		);
	}
});
