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
			<div className="btn-group recipe-search">
        <a onClick={this.decrementMissing} className="btn btn-primary"><i className="fa fa-chevron-left"></i></a>
        <p className= "btn btn-default">{this.state.missing}</p>
        <a onClick={this.incrementMissing} className="btn btn-primary"><i className="fa fa-chevron-right"></i></a>  
			</div>
			);
	}
});
