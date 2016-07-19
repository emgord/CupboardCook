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

  addIngredient: function(ingredient_id) {
    $.post('/user_ingredients',
      { ingredient_id: ingredient_id },
      function(data) {
        this.props.addUserIngredient(data);
        this.resetSearch();
      }.bind(this),
      'JSON'
    ).fail(function(){
      this.resetSearch();
    }.bind(this));
  },

	render() {
		return (
		<div className="top-section">
        <h1>Pantry</h1>
				<IngredientSearchBox searchPath={this.props.searchPath}
                             submitPath={this.searchIngredients}
                             query={this.state.query}
                             ingredient={this.state.ingredients[0]}
                             addIngredient={this.addIngredient}/>
      <div className="row">
        <div className="col-xs-12 col-sm-8 col-sm-push-2 col-md-6 col-md-push-3">
        <Ingredients ingredients={this.state.ingredients}
                     addIngredient={this.addIngredient}
                     removeUserIngredient={this.props.removeUserIngredient}
                     userIngredients={this.props.userIngredients} />
        </div>
     </div>
		</div>
			);

	}
});
