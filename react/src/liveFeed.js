import React from 'react';

var liveFeed = React.createClass({
  getInitialState: function() {
    return {
      orgZ: '8',
      answerResult: []
    }
  },

  componentDidMount: function() {
    var source = '/api/organizations/' + this.state.orgZ + '/answers.json'
    this.answerRequest = $.get(source, function(result) {
      this.setState({answerResult: result})
    })
  },

  render() {
    return (
      <div>please</div>
    )
  }
})

export default liveFeed;
