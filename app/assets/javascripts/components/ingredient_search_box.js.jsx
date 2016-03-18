var IngredientSearchBox = React.createClass({

	render () {
		return (
			<div className="row">
				<div className="col-xs-12 col-sm-8 col-sm-push-2 col-md-6 col-md-push-3">
					<form ref="form" action={ this.props.searchPath } acceptCharset="UTF-8" method="get">
							<p><input ref="query"
												className="form-control"
								 				autoFocus="true"
												value={ this.props.query }
												name="query"
												placeholder="Add ingredients to your pantry...."
												onChange={ this.props.submitPath }
												/></p>
					</form>
				</div>
		</div>
			);
	}
});
