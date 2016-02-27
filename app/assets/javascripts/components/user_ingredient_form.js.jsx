var UserIngredientForm = React.createClass({

  getInitialState: function(){
  return { amount: '', unit: '', ingredient_id:'' };
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
        <div className="form-group">
          <input type="number" className="form-control" placeholder="Amount" name="amount" value={this.state.amount} onChange={this.handleChange}>
          </input>
        </div>
      </form>

        <div class="col-lg-12">
          <fieldset>
            <%= form_for item, url:{action: action}, :html => {:class => "form" } do |f| %>
              <h2 class="text-center"><%= title %></h2>
              <div class="form-group">
                <%= f.label :amount %>
                <%= f.number_field :amount, class: "form-control" %>
              </div>
              <div class="form-group">
                <%= f.label :unit %>
                <%= f.text_field :unit, class: "form-control" %>
              </div>
              <label for=:ingredient>Ingredient</label>
                <%= select_tag "ingredient", options_for_select(ingredients.collect{|x| [x.name,x.id]})%>
              </div>
              <div class="col-md-12 text-center">
                <%= f.submit "Add Ingredient", class: "btn btn-default" %>
              </div>
            <% end %>
          </fieldset>
        </div>

    );
  }
});
