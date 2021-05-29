import './App.css';
import React from 'react';

import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';

import Header from './components/Header';
import SearchPage from './components/pages/SearchPage';
import ProfilePage from './components/pages/ProfilePage';
import LoginPage from './components/pages/LoginPage';

const App = () => (
  <div className='App'>
    <Router>
      <Header />
      <LoginPage />
      <Switch>
        <Route exact path='/' component={SearchPage} />{' '}
        <Route path='/profile' component={ProfilePage} />{' '}
      </Switch>{' '}
    </Router>{' '}
  </div>
);

export default App;
