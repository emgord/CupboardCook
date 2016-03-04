var RecipeDetail = React.createClass({

  render: function(){
    var image = this.props.recipe.image;
    if (image == null) {
      image = "http://thecrites.com/sites/all/modules/cookbook/theme/images/default-recipe-big.png"
    }
    var show = this.props.show ? 'recipe-detail' : 'recipe-detail hide';

    return(

      <div className = {show} onClick={this.props.handleClick}>
        <div className="thumbnail">
        <a onClick={this.props.hide}><i className="fa fa-times-circle fa-pull-right fa-2x"></i></a>
          <img src={image} />
          <div className="caption">
          <h2>{this.props.recipe.title}</h2>
          <h3>Ingredients:</h3>
          <Ingredients ingredients={this.props.recipe.ingredients}
                       userIngredients={this.props.user_ingredients}
                       removeUserIngredient={this.props.removeUserIngredient}/>
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
