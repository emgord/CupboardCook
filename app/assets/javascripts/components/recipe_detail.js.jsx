var RecipeDetail = React.createClass({

  getInitialState: function(){
  return { completeRecipe: false};
  },

  markRecipeComplete: function(){
    this.setState({ completeRecipe: !this.state.completeRecipe });
  },

  addHeart: function(e) {
    e.preventDefault();
    var user_recipe = {
      heart: true,
      recipe_id: this.props.recipe.id
    };
    $.post('/user_recipes',{ user_recipe },
      function(data) {
        this.props.toggleHeartRecipe(this.props.recipe);
      }.bind(this),
      'JSON'
    );
  },

  removeHeart: function(e) {
    e.preventDefault();
    $.ajax({
      method: "DELETE",
      url: "/user_recipes/" + this.props.recipe.id
    }).success(function(){
      this.props.toggleHeartRecipe(this.props.recipe);
    }.bind(this));
  },

  render: function(){
    if (this.props.recipe.image == null) {
      var image = "";
    } else {
      var image = <img src={this.props.recipe.image} className="img-responsive center-block"/>;
    }

    if (this.props.recipe.time == null) {
      var time = "";
    } else {
      var time = <span><i className="fa fa-clock-o">   </i><strong>Time:</strong>{this.props.recipe.time}</span>;
    }

    if (this.props.recipe.time == null) {
      var recipeYield = "";
    } else {
      var recipeYield = <span><i className="fa fa-cutlery">   </i><strong>Yield:</strong>{this.props.recipe.yield}</span>;
    }

    if (this.props.recipe.heart == true) {
      var heart =
        <a onClick={this.removeHeart}>
          <i className="fa fa-heart fa-4x icon-right remove-heart"></i>
          <i className="fa fa-times fa-4x x-heart"></i>
        </a>;
    } else {
      var heart =
      <a onClick={this.addHeart}>
        <i className="fa fa-heart fa-4x icon-right add-heart"></i>
        <i className="fa fa-plus fa-4x plus-heart"></i>
      </a>;
    }

    return(
      <div className="container">
        <div className="row">
          <div className="col-xs-12">
            <div className="recipe-detail col-xs-12 col-sm-8 col-sm-push-2">
              <div className="panel panel-default">
                <div className="panel-heading">
                  <a onClick={this.props.hide}><i className="fa fa-times fa-pull-right fa-border fa-2x"></i></a>
                  <h2>{this.props.recipe.title}</h2>
                </div>
                <div className="panel-body">
                {image}
                <div className="time-yield-group">
                  {time}
                  {recipeYield}
                </div>
                <h3>Ingredients:</h3>
                <Ingredients ingredients={this.props.recipe.ingredients}
                             userIngredients={this.props.user_ingredients}
                             removeUserIngredient={this.props.removeUserIngredient}
                             editUserIngredient={this.state.completeRecipe}/>
                <p>{this.props.recipe.description}</p>
                </div>
                <div className="recipe-actions panel-footer">
                  <a className="btn btn-primary" href={this.props.recipe.original_url} target="_blank">Cook This Now <i className="fa fa-external-link"></i></a>
                  <a className="btn btn-info" onClick={this.markRecipeComplete}>Cooked <i className="fa fa-check"></i></a>
                  {heart}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

});
