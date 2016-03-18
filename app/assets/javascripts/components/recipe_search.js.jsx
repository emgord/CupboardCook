var RecipeSearch = React.createClass({

	render () {

    if (this.props.heart) {
      var sortOptions =
      <div className = "btn-group">
        <a onClick={this.props.showHeart} className="btn btn-primary disabled"><i className="fa fa-heart"></i>    Favorite Recipes</a>
        <a onClick={this.props.showAll} className="btn btn-default">Browse All</a>
      </div>;
    } else {
      var sortOptions =
          <div>
          <div className = "btn-group">
            <a onClick={this.props.showHeart} className="btn btn-primary"><i className="fa fa-heart"></i>    Favorite Recipes</a>
            <a className="btn btn-default disabled">Browse All</a>
          </div>
      		<div className="btn-group">
            <a onClick={this.props.decrementMissing} className="btn btn-primary"><i className="fa fa-chevron-left"></i></a>
            <p className= "btn btn-default">{this.props.missing}</p>
            <a onClick={this.props.incrementMissing} className="btn btn-primary"><i className="fa fa-chevron-right"></i></a>
            </div>
          </div>;
    }


		return (
			<div className="container">
				<div className="row">
					 <div className="col-xs-12 col-sm-8 col-sm-push-2 col-md-6 col-md-push-3">
			          {sortOptions}
								<RecipeSearchBox updateQuery={this.props.updateQuery}
																 triggerSearch={this.props.triggerSearch}
									 							 query={this.props.query}
																 resetSearch={this.props.resetSearch}/>
						</div>
					</div>
				</div>

			);
	}
});
