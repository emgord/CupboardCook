var Ingredients = React.createClass({

	render: function () {
		var userIngredients = this.props.userIngredients;
		var addIngredient = this.props.addIngredient;
		var resetSearch = this.props.resetSearch;
		var removeUserIngredient = this.props.removeUserIngredient;
		var editUserIngredient = this.props.editUserIngredient;
		var showIngredients = this.props.ingredients.map(function(ingredient){
			var finalIngredient = null;
			userIngredients.map(function(user_ingredient){
				if (user_ingredient.ingredient_id == ingredient.id) {
						finalIngredient = (<UserIngredient key={ingredient.id}
		                                           removeUserIngredient={removeUserIngredient}
		                                           user_ingredient={user_ingredient}
																							 edit={editUserIngredient} /> );
				}
			});
			if (finalIngredient == null) {
				finalIngredient = ( <Ingredient name={ingredient.name}
										id={ingredient.id}
										key={ingredient.id}
										addIngredient={addIngredient}
										resetSearch={resetSearch}/>
								 );
			}
				return finalIngredient;
			}, this);

		return(
			<div className="ingredient-list">{showIngredients}</div>
		);
	}
});
