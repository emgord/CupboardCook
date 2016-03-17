var RecipeSearchBox = React.createClass({

	render () {
		return (
			<div className="recipe-search-box">
				<form className="uk-search" ref="form" action={ this.props.searchPath } acceptCharset="UTF-8" method="get">
				<p><input ref="query"
									className="uk-search-field"
					 				autoFocus="true"
									value={ this.props.query }
									name="query"
									placeholder="Find Recipes"
									/></p>
				</form>
        <button onClick={ this.props.updateSearch } type="submit" className = "btn btn-primary">Search</button>
			</div>
			);
	}
});
