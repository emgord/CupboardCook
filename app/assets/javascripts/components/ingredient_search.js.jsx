var IngredientSearch = React.createClass({
  getInitialState() {
		return { ingredients: [],
             searchPath: this.props.searchPath};
	},

  resetSearch(){
    this.setState({ ingredients:[], query: '', autoFocus:'true' });
  },

	searchIngredients(event) {
    this.setState({query: event.target.value})
		if (event.target.value) {
			$.ajax({
		      url: this.props.searchPath+"?query="+event.target.value,

		      dataType: 'json',

		      success: function(data) {
		        this.setState({ingredients: data });
		      }.bind(this),

		      error: function(data) {
		      	this.setState({ingredients: [] });
		      }.bind(this)
		    });
		}
	},

	render() {
		return (
			<div>
				<IngredientSearchBox searchPath={this.props.searchPath}
                             submitPath={this.searchIngredients}
                             query={this.state.query}/>
        <Ingredients ingredients={this.state.ingredients}
                     addUserIngredient={this.props.addUserIngredient}
                     resetSearch={this.resetSearch} />
			</div>
			);

	}
});
