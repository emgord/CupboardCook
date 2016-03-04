var RecipeThumbnail = React.createClass({

  render: function(){
    var image = this.props.recipe.image;
    if (image == null) {
      image = "http://thecrites.com/sites/all/modules/cookbook/theme/images/default-recipe-big.png"
    }

    return(
      <div className='recipe-tile' onClick={this.props.handleClick}>
        <div className="thumbnail">
          <img src={image} />
          <div className="caption">
          <h3>{this.props.recipe.title}</h3>
          </div>
        </div>
      </div>
      );
  }

});
