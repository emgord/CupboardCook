var IngredientSearchBox = React.createClass({


handleFocus: function() {
	if (this.myTextInput == null) {
		this.myTextInput.focus();
	}
	},

handleChange: function(event){
	this.props.submitPath(event);
	this.handleFocus();
},

	render () {
		return (
			<div className="ingredient-search-box">
				<form className="uk-search" ref="form" action={ this.props.searchPath } acceptCharset="UTF-8" method="get">
				<p><input ref="query"
									ref={(ref) => this.myTextInput = ref}
									className="uk-search-field"
					 				autoFocus="true"
									value={ this.props.query }
									name="query"
									placeholder="Find Ingredients"
									onChange={ this.handleChange }
									/></p>
				</form>
			</div>
			);
	}
});
