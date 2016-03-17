var RecipeSearchBox = React.createClass({

	render () {
		return (
			<div className="recipe-search-box">
				<form className="uk-form" ref="form" acceptCharset="UTF-8">
					<div className="uk-form-icon">
						<i className="uk-icon-search"></i>
						<input ref="query"
									 className="uk-form-large uk-form-width-large"
							 		 autoFocus="true"
									 name="query"
		               onChange={ this.props.updateQuery }
									 placeholder="Find Recipes"
										/>
					</div>
				</form>
        <button onClick={ this.props.triggerSearch } type="submit" className="btn btn-primary">Search</button>
        {/* <button onClick={ this.props.resetSearch } type="submit" className="btn btn-primary">Reset Search</button>*/}
			</div>
			);
	}
});
