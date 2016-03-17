var IngredientSearchBox = React.createClass({

	render () {
		return (
			<div className="ingredient-search-box">
				<form className="uk-form" ref="form" action={ this.props.searchPath } acceptCharset="UTF-8" method="get">
					<div className="uk-form-icon">
						<i className="uk-icon-search"></i>
						<input ref="query"
											type="text"
											className="uk-form-large uk-form-width-large"
							 				autoFocus="true"
											value={ this.props.query }
											name="query"
											placeholder="Find Ingredients"
											onChange={ this.props.submitPath }
											/>
					</div>
				</form>
			</div>
			);
	}
});
