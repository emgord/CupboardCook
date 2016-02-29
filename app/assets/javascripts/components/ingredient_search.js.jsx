var IngredientSearch = React.createClass({
	componentWillMount(){
		this.fetchIngredients();
	},

	fetchIngredients() {

		$.ajax({
	      url: this.props.ingredientsPath,

	      dataType: 'json',

	      success: function(data) {
	        this.setState({songs: data});
	      }.bind(this),

	      error: function(data) {
	      	this.setState({songs: []});
	      }.bind(this)
	    });
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
		else{
			this.fetchIngredients();
		}

	},

	getInitialState() {
		return { ingredients: [] };
	},

	render() {

		return (
			<div>
				<Ingredients ingredients={this.state.ingredients} />
				<IngredientSearchBox searchPath={this.props.searchPath} submitPath={this.searchIngredients} cancelPath={this.fetchIngredients}/>
			</div>
			);

	}
});
