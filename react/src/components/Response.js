import React from 'react';

var Response = React.createClass({
  getInitialState: function() {
    return {
      user: this.props.user,
      email: this.props.email,
      time: this.props.time,
      question: this.props.question,
      response: this.props.response
    }
  },

  render: function() {
    let mailtoLink = 'mailto:' + this.state.email
    return (
      <div className="user-response">
        <div className="left-section">
          <a href={mailtoLink}>{this.state.user}</a>
          {this.state.time}
        </div>
        <div className="right-section">
          <span className="team-question">{this.state.question}</span>
          <span className="team-answer">{this.state.response}</span>
        </div>
      </div>
    )
  }

});

module.exports = Response;
