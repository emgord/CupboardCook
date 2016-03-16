var RecipeSearch = React.createClass({

  getInitialState: function(){
  return { missing: 0,
           heart: false};
  },

  incrementMissing: function(){
    var missing = this.state.missing
    if (missing < 39) {
      missing++
      this.setState({missing: missing }, this.updateSearch)
    }
  },

  decrementMissing: function(){
    var missing = this.state.missing
    if (missing > 0) {
      missing--
      this.setState({missing: missing }, this.updateSearch)
    }
  },

  showHeart: function(){
    var heart = true;
    var missing = 40;
    this.setState({heart: heart, missing:missing }, this.updateSearch)
  },

  showAll: function(){
    var heart = false;
    var missing = 0;
    this.setState({heart: heart, missing:missing }, this.updateSearch)
  },

  updateSearch: function(){
    var search_options = this.state;
    this.props.resetRecipes(search_options)
  },

	render () {

    if (this.state.heart) {
      var sortOptions =
      <div className = "btn-group">
        <a onClick={this.showHeart} className="btn btn-primary disabled"><i className="fa fa-heart"></i>    Favorite Recipes</a>
        <a onClick={this.showAll} className="btn btn-default">Browse All</a>
      </div>;
    } else {
      var sortOptions =
          <div>
          <div className = "btn-group">
            <a onClick={this.showHeart} className="btn btn-primary"><i className="fa fa-heart"></i>    Favorite Recipes</a>
            <a className="btn btn-default disabled">Browse All</a>
          </div>
      		<div className="btn-group">
            <a onClick={this.decrementMissing} className="btn btn-primary"><i className="fa fa-chevron-left"></i></a>
            <p className= "btn btn-default">{this.state.missing}</p>
            <a onClick={this.incrementMissing} className="btn btn-primary"><i className="fa fa-chevron-right"></i></a>
            </div>
          </div>;
    }


		return (
        <div className = "recipe-search-box">
          {sortOptions}
        </div>

			);
	}
});
