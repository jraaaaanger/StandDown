import React from 'react';
import Response from './Response'

var OrgFeed = React.createClass({
  getInitialState: function() {
    return {
      orgID: this.props.orgID,
      recentAnswers: []
    }
  },

  componentDidMount: function() {
    this.source = '/api/organizations/' + this.state.orgID + '/answers.json'
    let pullAnswers = $.get(this.source, (result) => {
      this.setState({
        recentAnswers: result.answers
      })
    })
  },

  render: function() {
    let allAnswers = this.state.recentAnswers
    let responses = ''

    if (allAnswers.length > 0) {
      responses = allAnswers.map( answerObject => {
        return (
         <Response
         key={answerObject.id}
         user={answerObject.user.name}
         email={answerObject.user.email}
         time={answerObject.time}
         question={answerObject.body.question}
         response={answerObject.body.answer} />
       )
     })
   };

    return (
      <div>
      {responses}
     </div>
    )
  }
});

module.exports = OrgFeed;
