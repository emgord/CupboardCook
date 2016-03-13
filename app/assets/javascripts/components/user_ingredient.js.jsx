var UserIngredient = React.createClass({

  getInitialState: function(){
  return { edit: this.props.edit};
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
    var ingredientDisplay = <button className= "btn ingredient have" onClick={this.toggleEdit}><i className="fa fa-check-square-o">  </i>{"  "+this.props.user_ingredient.ingredient.name}</button>;
    if (this.props.edit || this.state.edit) {
      var ingredientDisplay = <div className='btn-group'>
        {ingredientDisplay}
        <button className="btn delete" type="button" onClick={this.deleteUserIngredient}><i className="fa fa-times"></i></button>
      </div>;
    }
    return(
      <div className="ingredient-tile">
        {ingredientDisplay}
      </div>

    );
  }
});
