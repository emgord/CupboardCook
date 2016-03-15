var RecipeSearch = React.createClass({

  getInitialState: function(){
  return { missing: 0 };
  },

  incrementMissing: function(){
    var missing = this.state.missing
    missing++
    this.setState({missing: missing })
    this.props.resetRecipes(missing)
  },

  decrementMissing: function(){
    var missing = this.state.missing
    if (missing > 0) {
      missing--
      this.setState({missing: missing })
      this.props.resetRecipes(missing)
    }
  },

	render () {
		return (
			<div className="recipe-search">
        <a onClick={this.decrementMissing} className="btn btn-primary btn-sm">-</a>{this.state.missing}<a onClick={this.incrementMissing} className="btn btn-primary btn-sm">+</a>
			</div>
			);
	}
});
