var Ingredient = React.createClass({
	getInitialState() {
		return { add:false };
	},
	showAddForm(){
		this.setState({ add:true});
	},

	render () {
		var add = this.state.add;
		var addForm;
		if (add) {
			addForm =
			<UserIngredientForm ingredient_id={this.props.id} handleNewUserIngredient={this.props.addUserIngredient} resetSearch={this.props.resetSearch} />
		}
		return (
			<div className='btn-group ingredient-add'>
				<p className= "btn btn-default">{ this.props.name }</p>
	      <button className="btn btn-default" type="button" onClick={this.showAddForm}><i className="fa fa-plus"></i></button>
				{addForm}
			</div>
			)
	},

});
