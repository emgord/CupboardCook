var UserIngredient = React.createClass({
  render: function(){
    return(
      <div className='btn-group ingredient-add'>
        <p className= "btn btn-default">{this.props.user_ingredient.ingredient.name}</p>
        <button className="btn btn-default" type="button"><i className="fa fa-times"></i></button>
      </div>
    );
  }
});
