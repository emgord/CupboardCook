var IngredientSearchBox = React.createClass({

	render () {
		return (
			<div className="ingredient-search-box">
				<form className="uk-search" ref="form" action={ this.props.searchPath } acceptCharset="UTF-8" method="get">
				<p><input ref="query"
									className="uk-search-field"
					 				autoFocus="true"
									value={ this.props.query }
									name="query"
									placeholder="Find Ingredients"
									onChange={ this.props.submitPath }
									/></p>
				</form>
			</div>
			);
	}
});
