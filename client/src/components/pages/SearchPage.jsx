import React, { useState, useEffect } from 'react';
import axios from 'axios';

import { makeStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';

import SearchIcon from '@material-ui/icons/Search';
import Movie from '../Movie';

const useStyles = makeStyles(() => ({
  root: {
    flexGrow: 1,
    width: '60%',
    margin: '20px auto',
    justifyContent: 'center',
    alignItems: 'center',
  },
}));

const SearchPage = () => {
  const API_KEY = process.env.REACT_APP_API_KEY;
  const [movies, setMovies] = useState([]);
  const [query, setQuery] = useState('');

  useEffect(() => {
    axios
      .get(
        `https://api.themoviedb.org/3/movie/popular?api_key=${API_KEY}&language=en-US&page=1`
      )
      .then((res) => setMovies(res.data.results));
  }, []);

  const search = (event) => {
    event.preventDefault();
    axios
      .get(
        `https://api.themoviedb.org/3/search/movie?api_key=${API_KEY}&language=en-US&query=${query}&page=1&include_adult=false`
      )
      .then((res) => setMovies(res.data.results));
  };

  const classes = useStyles();

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
            position: 'absolute',
            top: 7.5,
            right: '20.5%',
            cursor: 'pointer',
          }}
        />
      </form>
      <div className={classes.root}>
        <Grid container spacing={2}>
          {movies.map((movieInfo) => (
            <Grid item xs={2} key={movieInfo.id} align='center'>
              <Movie
                title={movieInfo.title}
                posterPath={movieInfo.poster_path}
                voteAverage={movieInfo.vote_average}
                id={movieInfo.id}
              />
            </Grid>
          ))}
        </Grid>
      </div>
    </>
  );
};

export default SearchPage;
