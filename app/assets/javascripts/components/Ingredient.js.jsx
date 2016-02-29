var Ingredient = React.createClass({
	render () {
		return (
			<div className='btn-group'>
				<p className= "btn btn-default">{ this.props.name }</p>
	      <button className="btn btn-default" type="button"><i className="fa fa-plus"></i></button>
			</div>
			)
	}
});
