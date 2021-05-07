import './App.css';
import SearchIcon from '@material-ui/icons/Search';
import AccountCircleIcon from '@material-ui/icons/AccountCircle';

import Movie from './components/Movie';



const App = () => {
  return(
    <div className="App">
      <div className="App-header">
        <SearchIcon fontSize="large"/>
        <AccountCircleIcon fontSize="large"/>
      </div>
      <div className="Title">
          <h1>MyMovieList</h1>
          <p>Find movies and keep track and of what you’ve watched and plan to watch.</p>
      </div>
        <div className="Search">
          <input type='text'/>
          <a href="http://google.com"><SearchIcon 
          style={{position:'relative', right: 35, top: 7.5}}/>
          </a>
      </div>
      <div className="Movies-container">
      <Movie />
      <Movie />
      <Movie />
      <Movie /><Movie />
      <Movie />
      <Movie />
      <Movie />
      <Movie /><Movie />
      </div>
    </div>
  )
}

export default App;
