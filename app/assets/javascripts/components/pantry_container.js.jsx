var Pantry = React.createClass({

  getInitialState: function(){
  return { user_ingredients: this.props.pantry_items,
           ingredients: this.props.ingredients,
           searchPath: this.props.searchPath,
           userIngredientEdit: false};
  },

  getDefaultProps: function(){
    return { user_ingredients: []};
  },

  toggleAllIngredientsEdit: function(){
    this.setState({ userIngredientEdit: !this.state.userIngredientEdit });
  },

  addUserIngredient: function(user_ingredient){
    var user_ingredients = this.state.user_ingredients.slice();
    user_ingredients.unshift(user_ingredient);
    this.setState({ user_ingredients: user_ingredients });
  },

  removeUserIngredient: function(user_ingredient){
    var user_ingredients = this.state.user_ingredients.slice();
    var index = user_ingredients.indexOf(user_ingredient);
    user_ingredients.splice(index,1);
    this.setState({ user_ingredients: user_ingredients });
  },

  populatePantry: function(){
    $.get('/populate_pantry',
      function(data) {
        this.setState({user_ingredients:data});
      }.bind(this),
      'JSON')
  },

  clearPantry: function(){
    $.get('/clear_pantry',
      function(data) {
        this.setState({user_ingredients:data});
      }.bind(this),
      'JSON')
  },

  render: function () {
    if (this.state.user_ingredients.length == 0) {
      text = <div className="welcome-text"><h2>Welcome to Cupboard Cook</h2><p>Your pantry is currently empty.</p><p>Search for ingredients and add them to your pantry or <a onClick={this.populatePantry}> fill your pantry </a>with common staple ingredients to get started.</p></div>;
    } else {
      text = <h2>Ingredients:</h2>
    }

    return(
      <div className ='pantry-list'>
        <IngredientSearch searchPath={this.props.searchPath}
                        addUserIngredient={this.addUserIngredient}
                        removeUserIngredient={this.removeUserIngredient}
                        userIngredients={this.state.user_ingredients} />

        <div className="bottom-section">
          <div className="container">
            <div className="row">
              <div className="col-xs-12 col-sm-10 col-sm-push-1">
              <a className="btn btn-primary edit-pantry" onClick={this.toggleAllIngredientsEdit}>Edit Pantry <i className="fa fa-pencil-square-o"></i></a>
              <a className="btn btn-primary edit-pantry" onClick={this.populatePantry}>Fill Pantry <i className="fa fa-shopping-basket"></i></a>
              <a className="btn btn-primary edit-pantry" onClick={this.clearPantry}>Clear Pantry <i className="fa fa-trash"></i></a>
              {text}
              <UserIngredients user_ingredients={this.state.user_ingredients}
                               edit={this.state.userIngredientEdit}
                               removeUserIngredient={this.removeUserIngredient}/>
          </div>
        </div>
      </div>
    </div>
  </div>
    );
  }

});
