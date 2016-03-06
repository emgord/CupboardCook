var UserIngredient = React.createClass({

  getInitialState: function(){
  return { edit: false };
  },

  toggleEdit: function(){
    this.setState({ edit: !this.state.edit });
  },

  deleteUserIngredient: function(e) {
    $.ajax({
      method: "DELETE",
      url: "/user_ingredients/" + this.props.user_ingredient.id
    }).success(function(){
      this.props.removeUserIngredient(this.props.user_ingredient);
    }.bind(this));
  },

  render: function(){
    var ingredientDisplay = <button className= "btn btn-default" onClick={this.toggleEdit}>{this.props.user_ingredient.ingredient.name}</button>;
    if (this.state.edit) {
      var ingredientDisplay = <div className='btn-group ingredient-add'>
        {ingredientDisplay}
        <button className="btn btn-danger" type="button" onClick={this.deleteUserIngredient}><i className="fa fa-times"></i></button>
      </div>;
    }
    return(
      <div>
        {ingredientDisplay}
      </div>

    );
  }
});
