import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

const path = require('path');
require('dotenv').config({ path: path.resolve(__dirname, '../.env') });

ReactDOM.render(<App />, document.getElementById('root'));
