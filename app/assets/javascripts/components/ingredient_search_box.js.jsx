var IngredientSearchBox = React.createClass({
	render () {
		return (
			<div>
				<form ref="form" action={ this.props.searchPath } acceptCharset="UTF-8" method="get">
				<p><input ref="query" name="query" placeholder="Find Ingredients" onChange={ this.props.submitPath } /></p>
				</form>

				<a href="#" onClick={ this.props.cancelPath }>Cancel</a>
			</div>
			);
	}
});
