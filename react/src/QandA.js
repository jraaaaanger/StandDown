import React from 'react';

var QandA = React.createClass({
  getInitialState: function() {
    return {
      question: this.props.question,
      answer: this.props.answer,
      user: this.props.user,
      email: this.props.email,
      time: this.props.time
    }
  }
})
