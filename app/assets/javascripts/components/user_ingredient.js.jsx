var UserIngredient = React.createClass({

  deleteUserIngredient: function(e) {
    $.ajax({
      method: "DELETE",
      url: "/user_ingredients/" + this.props.user_ingredient.id
    }).success(function(){
      this.props.removeUserIngredient(this.props.user_ingredient)
    }.bind(this));
  },

  render: function(){
    return(
      <div className='btn-group ingredient-add'>
        <p className= "btn btn-default">{this.props.user_ingredient.ingredient.name}</p>
        <button className="btn btn-danger" type="button" onClick={this.deleteUserIngredient}><i className="fa fa-times"></i></button>
      </div>
    );
  }
});
