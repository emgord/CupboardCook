var Ingredients = React.createClass({
	render() {
		var showIngredients = (ingredient) =>
    <Ingredient name={ingredient.name} id={ingredient.id} key={ingredient.id}/>;
		return <ul>{this.props.ingredients.map(showIngredients)}</ul>;
	}
});
