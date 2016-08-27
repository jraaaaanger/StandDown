import "babel-polyfill";
import React from 'react';
import ReactDOM from 'react-dom';
import liveFeed from './liveFeed';

$(function() {
  ReactDOM.render(
      <liveFeed orgZ='8'/>,
      document.getElementById('appz')
  );
});
