var RecipeTile = React.createClass({

  render: function(){
    var image = this.props.recipe.image;
    if (image == null) {
      image = "http://thecrites.com/sites/all/modules/cookbook/theme/images/default-recipe-big.png"
    }
    return(
      <div className='recipe-tile'>
        <h2>{this.props.recipe.title}</h2>
        <img src={image} />
          <p>
            <strong>yield: </strong> {this.props.recipe.yield} 
            <strong>time: </strong> {this.props.recipe.time}
          </p>
          <p>
            {this.props.recipe.description}
          </p>
      </div>
    );
  }

});
