var RecipeSearch = React.createClass({

  getInitialState: function(){
  return { missing: 0 };
  },

	render () {
		return (
			<div className="recipe-search">
        <a class="btn btn-primary btn-sm">-</a>{this.state.missing}<a class="btn btn-primary btn-sm">+</a>
			</div>
			);
	}
});
