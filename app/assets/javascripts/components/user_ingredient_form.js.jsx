var UserIngredientForm = React.createClass({

  getInitialState: function(){
  return { amount: '',
           unit: '',
           ingredient_id:'',
           ingredients: this.props.ingredients};
  },

  handleChange: function(e) {
    var name = e.target.name;
    var obj = {};
    obj[name] = e.target.value;
    this.setState(obj);
  },

  valid: function() {
    return (this.state.unit);
  },

  handleSubmit: function(e) {
    e.preventDefault();
    $.post('',
      { user_ingredients: [this.state] },
      function(data) {
        this.props.handleNewRecord(data[0]);
        this.setState(this.getInitialState());
      }.bind(this),
      'JSON'
    );
  },

  render: function(){
    return(
      <form className="form-inline" onSubmit={this.handleSubmit}>
        <div className="form-group">
          <input type="number" className="form-control" placeholder="Amount" name="amount" value={this.state.amount} onChange={this.handleChange}>
          </input>
        </div>
        <div className="form-group">
          <input type="text" className="form-control" placeholder="Unit" name="unit" value={this.state.unit} onChange={this.handleChange}>
          </input>
        </div>
        <select className="form-group" name="ingredient" id="ingredient">
          {this.props.ingredients.map(function(ingredient){
            return <option value={this.ingredient.id} onChange={this.handleChange}>this.ingredient.name</option>
          })}
        </select>
        <div className="form-group">
          <input type="submit" value="Add Ingredient" className="btn btn-primary" disabled={!this.valid()}>
          </input>
        </div>
      </form>
    );
  }
});
