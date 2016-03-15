var RecipeTile = React.createClass({

  handleClick: function(event) {
    this.props.changeRecipeDetail(this.props.recipe);
  },

  render: function(){
    var image = <img src={this.props.recipe.image} />
    var pictureClass = "recipe-tile";
    if (this.props.recipe.image == null) {
      pictureClass = "recipe-tile no-image";
      image = "";
    }
    var missing;
    if (this.props.recipe.missing == 0 ) {
      missing = <i className="fa fa-thumbs-up"></i>;
    } else {
      missing = <h1><i className="fa fa-minus"></i>{this.props.recipe.missing}</h1>;
    };
    return(
      <div className={pictureClass} onClick={this.handleClick}>
        <div className="thumbnail">
            {image}
          <div className="caption">
          <h3>{this.props.recipe.title}</h3>
          {missing}
          </div>
        </div>
      </div>
      );
  }
});
