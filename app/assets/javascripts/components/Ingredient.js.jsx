var Ingredient = React.createClass({
	getInitialState() {
		return { ingredient_id: this.props.id };
	},

	addIngredient: function(e) {
    e.preventDefault();
    $.post('/user_ingredients',
      { user_ingredients: [this.state][0] },
      function(data) {
        this.props.addUserIngredient(data);
        this.props.resetSearch();
      }.bind(this),
      'JSON'
    ).fail(function(){
			this.props.resetSearch();
		}.bind(this));
  },

	render () {
		return (
			<div className='btn-group ingredient-tile'>
				<p className= "btn ingredient need">{ this.props.name }</p>
	      <button className="btn add" type="button" onClick={this.addIngredient}><i className="fa fa-plus"></i></button>
			</div>
			)
	},

});
