var RecipeSearchBox = React.createClass({
	render () {
		return (
			<div className="col-xs-12 col-sm-8 col-sm-push-2 col-md-6 col-md-push-3">
				<form ref="form" acceptCharset="UTF-8">
					<div className="input-group">
						<input ref="query"
											className="form-control"
										  autoFocus="true"
										  name="query"
										  type="text"
										  onChange={ this.props.updateQuery }
										  placeholder="Find Recipes"
										/>
						<span className="input-group-btn">
				 			<button onClick={ this.props.triggerSearch } type="button" className="btn btn-primary"><i className="fa fa-search"></i></button>
						</span>
					</div>
				</form>
			</div>
			);
	}
});
