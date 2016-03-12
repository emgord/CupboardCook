var RecipeDetail = React.createClass({

  getInitialState: function(){
  return { completeRecipe: false};
  },

  markRecipeComplete: function(){
    this.setState({ completeRecipe: !this.state.completeRecipe });
  },

  render: function(){
    var image = this.props.recipe.image;
    if (image == null) {
      image = "http://thecrites.com/sites/all/modules/cookbook/theme/images/default-recipe-big.png"
    }

    return(

        <div className="thumbnail recipe-detail">
        <a><i className="fa fa-times-circle fa-pull-right fa-2x"></i></a>
          <img src={image} />
          <div className="caption">
          <h2>{this.props.recipe.title}</h2>
          <h3>Ingredients:</h3>
          <Ingredients ingredients={this.props.recipe.ingredients}
                       userIngredients={this.props.user_ingredients}
                       removeUserIngredient={this.props.removeUserIngredient}
                       editUserIngredient={this.state.completeRecipe}/>
          <p>Time: {this.props.recipe.time}</p>
          <p>Yield: {this.props.recipe.yield}</p>
          <p>{this.props.recipe.description}</p>
          <a className="btn btn-primary" href={this.props.recipe.original_url} target="_blank">Cook This Now</a>
          <a className="btn btn-info" onClick={this.markRecipeComplete}>Cooked!</a>
          </div>
        </div>
    );
  }

});
