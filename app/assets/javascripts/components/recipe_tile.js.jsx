var RecipeTile = React.createClass({

  getInitialState: function() {
    return {detail: false};
  },
  handleClick: function(event) {
    this.setState({detail: !this.state.detail});
  },

  render: function(){
    var recipe;
    if (this.state.detail){
      recipe = <RecipeDetail handleClick={this.handleClick}
                             key={this.props.recipe.id}
                             recipe={this.props.recipe} />;
    } else {
      recipe = <RecipeThumbnail handleClick={this.handleClick}
                                key={this.props.recipe.id}
                                recipe={this.props.recipe} />;
    }
    return(
      <div>
        {recipe}
      </div>

    );
  }

});
