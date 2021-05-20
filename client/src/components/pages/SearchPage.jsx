import React, { useState, useEffect } from 'react';
import axios from 'axios';

import SearchIcon from '@material-ui/icons/Search';
import Movie from '../assets/Movie';

const Search = () => {
  const [movies, setMovies] = useState([]);
  const [query, setQuery] = useState('');
  useEffect(() => {
    axios
      .get(
        'https://api.themoviedb.org/3/movie/popular?api_key=e9085c32cd25783e01c2ae6ef814c537&language=en-US&page=1'
      )
      .then((res) => setMovies(res.data.results));
  }, []);

  const search = (event) => {
    event.preventDefault();
    axios
      .get(
        `https://api.themoviedb.org/3/search/movie?api_key=e9085c32cd25783e01c2ae6ef814c537&language=en-US&query=${query}&page=1&include_adult=false`
      )
      .then((res) => setMovies(res.data.results));
  };
  return (
    <>
      <div className='Title'>
        <h1>MyMovieList</h1>
        <p>
          Find movies and keep track and of what you’ve watched and plan to
          watch.
        </p>
      </div>
      <form className='Search' onSubmit={search}>
        <input
          type='text'
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder='Search for a movie'
        />
        <SearchIcon
          onClick={search}
          style={{
            position: 'relative',
            top: 7.5,
            right: 35,
            cursor: 'pointer',
          }}
        />
      </form>
      <div className='content'>
        <div className='Movies-container'>
          {movies.map((movieInfo) => (
            <Movie
              key={movieInfo.id}
              title={movieInfo.title}
              posterPath={movieInfo.poster_path}
              voteAverage={movieInfo.vote_average}
              id={movieInfo.id}
            />
          ))}
        </div>
      </div>
    </>
  );
};

export default Search;
