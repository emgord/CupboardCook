var Ingredient = React.createClass({

	handleAddIngredient: function() {
		this.props.addIngredient(this.props.id);
	},

	render: function () {
		return (
			<div className='btn-group ingredient-tile'>
				<p className= "btn ingredient need">{ this.props.name }</p>
	      <button className="btn add" type="button" onClick={this.handleAddIngredient}><i className="fa fa-plus"></i></button>
			</div>
			)
	},

});
