var RecipeSearchBox = React.createClass({

	render () {
		return (
			<div className="row">
				<div className="col-lg-6">
					<div className="input-group">
						<form ref="form" acceptCharset="UTF-8">
						<p><input ref="query"
										className="form-control"
										autoFocus="true"
										name="query"
										type="text"
										onChange={ this.props.updateQuery }
										placeholder="Find Recipes"
										/></p>
						<span class="input-group-btn">
							<button onClick={ this.props.triggerSearch } type="button" className="btn btn-primary">Search</button>
						</span>
						</form>
					</div>
				</div>
			</div>
			);
	}
});
