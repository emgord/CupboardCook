var RecipeDetail = React.createClass({

  render: function(){
    var image = this.props.recipe.image;
    if (image == null) {
      image = "http://thecrites.com/sites/all/modules/cookbook/theme/images/default-recipe-big.png"
    }

    return(
      <div onClick={this.props.handleClick}>
        <div className="thumbnail">
          <img src={image} />
          <div className="caption">
          <h2>{this.props.recipe.title}</h2>
          <h3>Ingredients:</h3>
          <Ingredients ingredients={this.props.recipe.ingredients} />
          <p>Time: {this.props.recipe.time}</p>
          <p>Yield: {this.props.recipe.yield}</p>
          <p>{this.props.recipe.description}</p>
          <a href={this.props.recipe.original_url} target="_blank">Cook This Now</a>
          </div>
        </div>
      </div>
    );
  }

});
