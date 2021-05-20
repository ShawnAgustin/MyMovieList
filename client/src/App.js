import './App.css';
import React from 'react';

import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';

import Header from './components/assets/Header';
import Search from './components/pages/SearchPage';
import ProfilePage from './components/pages/ProfilePage';
import InfoCard from './components/assets/InfoCard';

const App = () => (
  <div className='App'>
    <Router>
      <Header />
      <Switch>
        <Route exact path='/' component={Search} />
        <Route path='/profile' component={ProfilePage} />
      </Switch>
    </Router>
  </div>
);

export default App;
