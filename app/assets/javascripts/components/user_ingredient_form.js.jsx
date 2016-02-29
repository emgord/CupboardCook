var UserIngredientForm = React.createClass({

  getInitialState: function(){
  return { amount: '',
           unit: '',
           ingredient_id: this.props.ingredient_id};
  },

  handleChange: function(e) {
    var name = e.target.name;
    var obj = {};
    obj[name] = e.target.value;
    this.setState(obj);
  },

  valid: function() {
    return (this.state.ingredient_id);
  },

  handleSubmit: function(e) {
    e.preventDefault();
    $.post('http://localhost:3000/user_ingredients',
      { user_ingredients: [this.state][0] },
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
      <input type="hidden" name="ingredient_id" value={this.state.ingredient_id} />
        <div className="form-group">
          <input type="number" className="form-control" placeholder="Amount" name="amount" value={this.state.amount} onChange={this.handleChange}>
          </input>
        </div>
        <div className="form-group">
          <input type="text" className="form-control" placeholder="Unit" name="unit" value={this.state.unit} onChange={this.handleChange}>
          </input>
        </div>
        <div className="form-group">
          <input type="submit" value="Add Ingredient" className="btn btn-primary" disabled={!this.valid()}>
          </input>
        </div>
      </form>
    );
  }
});
