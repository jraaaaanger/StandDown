import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import OrgFeed from './components/OrgFeed';

$(function() {
  ReactDOM.render(
    <OrgFeed />,
    document.getElementById('app')
  );
});
