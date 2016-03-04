var Ingredients = React.createClass({

	render: function () {
		var userIngredients = this.props.userIngredients;
		var addUserIngredient = this.props.addUserIngredient;
		var resetSearch = this.props.resetSearch;
		var finalIngredient = null;
		var showIngredients = this.props.ingredients.map(function(ingredient){
			userIngredients.map(function(user_ingredient){
				if (user_ingredient.ingredient_id == ingredient.id) {
						finalIngredient = ( <div>You have it!</div> );
				}
			});
			if (finalIngredient == null) {
				finalIngredient = ( <Ingredient name={ingredient.name}
										id={ingredient.id}
										key={ingredient.id}
										addUserIngredient={addUserIngredient}
										resetSearch={resetSearch}/>
								 );
			}
				return finalIngredient;
			}, this);

		return(
			<div>{showIngredients}</div>
		);
	}
});
