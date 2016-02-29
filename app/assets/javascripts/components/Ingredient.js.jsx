var Ingredient = React.createClass({
	render () {
		return (
			<div className='btn btn-default ingredient-add'>
			  { this.props.name } <i className="fa fa-plus-square-o fa-lg"></i>
			</div>
			)
	}
});
