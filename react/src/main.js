import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import orgFeed from './components/orgFeed';

$(function() {
  ReactDOM.render(
    <orgFeed />,
    document.getElementById('app')
  );
});
