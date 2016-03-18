var RecipeSearchBox = React.createClass({

	render () {
		return (
			<div className="recipe-search-box">
				<form className="form-inline" ref="form" acceptCharset="UTF-8">
					<div className="form-group">
						<input ref="query"
									 className="form-control"
							 		 autoFocus="true"
									 type="text"
									 name="query"
		               onChange={ this.props.updateQuery }
									 placeholder="Find Recipes"
										/>
					</div>
					<button onClick={ this.props.triggerSearch } type="submit" className="btn btn-primary">Search</button>
				</form>
			</div>
			);
	}
});
