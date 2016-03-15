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
      missing = <i className="fa fa-thumbs-up fa-2x"></i>;
    } else {
      missing = <div className="missing-number"><p>-{this.props.recipe.missing}</p></div>;
    };
    return(
      <div className={pictureClass} onClick={this.handleClick}>
        <div className="thumbnail">
            {image}
          <div className="caption">
          <h3>{this.props.recipe.title}</h3>
            <div className="icon-left">
              {missing}
            </div>
            <a><i className="fa fa-heart fa-2x icon-right"></i></a>
          </div>
        </div>
      </div>
      );
  }
});
