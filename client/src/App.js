import './App.css';

const App = () => {
  return(
    <div className="App">
      <div className="App-header">
        <h1> MyMovieList</h1>
        <div className="Search">
          <h5>Search for a movie</h5>
          <input type='text'/>
        </div>
        
      </div>
      {/* TODO
      create into different components MODULARIZE*/}
      <div className="Movies-container">
        <h2>Plan to watch</h2>
        <h2>Currently Watching</h2>
        <h2>Completed</h2>
      </div>
      
    </div>
  )
}

export default App;
