var RecipeSearchBox = React.createClass({

	render () {
		return (
			<div className="recipe-search-box">
				<form className="uk-search" ref="form" acceptCharset="UTF-8">
				<p><input ref="query"
									className="uk-search-field"
					 				autoFocus="true"
                  value={ this.props.query }
									name="query"
                  onChange={ this.props.updateQuery }
									placeholder="Find Recipes"
									/></p>
				</form>
        <button onClick={ this.props.triggerSearch } type="submit" className = "btn btn-primary">Search</button>
			</div>
			);
	}
});
