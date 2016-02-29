var IngredientSearch = React.createClass({
  getInitialState() {
		return { ingredients: [] };
	},

	searchIngredients(event) {
		if (event.target.value) {
			$.ajax({
		      url: this.props.searchPath+"?query="+event.target.value,

		      dataType: 'json',

		      success: function(data) {
		        this.setState({ingredients: data});
		      }.bind(this),

		      error: function(data) {
		      	this.setState({ingredients: []});
		      }.bind(this)
		    });
		}
	},

	render() {
		return (
			<div>
				<IngredientSearchBox searchPath={this.props.searchPath} submitPath={this.searchIngredients}/>
        <Ingredients ingredients={this.state.ingredients} />
			</div>
			);

	}
});
