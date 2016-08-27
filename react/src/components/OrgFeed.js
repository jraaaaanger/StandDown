import React from 'react';

var OrgFeed = React.createClass({
  getInitialState: function() {
    return {
      sample: ' '
    }
  },

  render: function() {
    let sampleText = this.state.sample
    return (
      <h1>{sampleText}</h1>
    )
  }
});

module.exports = OrgFeed;
