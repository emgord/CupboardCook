var Ingredients = React.createClass({
	render() {
		var showIngredients = (ingredient) =>
    <Ingredient name={ingredient.name} id={ingredient.id} key={ingredient.id} addUserIngredient={this.props.addUserIngredient} resetSearch={this.props.resetSearch}/>;
		return <ul>{this.props.ingredients.map(showIngredients)}</ul>;
	}
});
