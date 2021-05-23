import React, { useState, useEffect } from 'react';
import CloseIcon from '@material-ui/icons/Close';
import axios from 'axios';

const InfoCard = (props) => {
  const { id, trigger, setTrigger } = props;
  const IMG_URL = 'https://image.tmdb.org/t/p/w1280';

  const [data, setData] = useState({});
  const [rating, setRating] = useState();
  const [status, setStatus] = useState();
  const [completed, setCompleted] = useState(true);
  const [title, setTitle] = useState();
  const [voteAverage, setVoteAverage] = useState();
  const [pp, setPp] = useState();

  const handleStatusChange = (stat) => {
    setTitle(data.title);
    setVoteAverage(data.vote_average);
    setPp(data.poster_path);
    if (stat === 'completed') {
      setCompleted(false);
      setStatus('completed');
      return;
    }
    setCompleted(true);

    if (stat === 'null') {
      localStorage.removeItem(id);
      setStatus('null');
    } else {
      setStatus('ptw');
    }
    setRating('null');
  };

  useEffect(() => {
    if (status === 'ptw' || status === 'completed') {
      localStorage.setItem(
        id,
        JSON.stringify({
          status,
          rating,
          completed,
          title,
          voteAverage,
          id,
          pp,
        })
      );
    }
  }, [status, rating]);

  useEffect(() => {
    const details = JSON.parse(localStorage.getItem(id));
    if (details !== null) {
      setStatus(details.status);
      setRating(details.rating);
      setCompleted(details.completed);
      setTitle(details.title);
      setVoteAverage(details.voteAverage);
      setPp(details.pp);
    }
  }, []);

  useEffect(() => {
    axios
      .get(
        `https://api.themoviedb.org/3/movie/${id}?api_key=e9085c32cd25783e01c2ae6ef814c537&language=en-U`
      )
      .then((res) => setData(res.data));
  }, []);

  return trigger ? (
    <div className='InfoCard'>
      <div className='image'>
        {data.poster_path ? (
          <img src={IMG_URL + data.poster_path} alt={data.title} />
        ) : null}
      </div>
      <div className='content'>
        <CloseIcon
          onClick={() => setTrigger(false)}
          style={{
            cursor: 'pointer',
            float: 'right',
            right: '20',
            top: '15',
            position: 'absolute',
          }}
        />
        <h1>{data.title}</h1>
        <div className='Rating'>TMDB Rating: {data.vote_average}</div>
        <p>{data.overview}</p>
        <div className='selection'>
          <div className='status'>
            <h3>Status:</h3>
            <select
              id='status'
              onChange={(e) => handleStatusChange(e.target.value)}
              value={status}
            >
              <option value='null'>--------</option>
              <option value='ptw'>Plan to watch</option>
              <option value='completed'>Completed</option>
            </select>
          </div>
          <div className='status'>
            <h3>My Score:</h3>
            <select
              id='rating'
              disabled={completed}
              value={rating}
              onChange={(e) => setRating(parseFloat(e.target.value, 2))}
            >
              <option value='none'>-----</option>
              <option value='1'>1</option>
              <option value='2'>2</option>
              <option value='3'>3</option>
              <option value='4'>4</option>
              <option value='5'>5</option>
              <option value='6'>6</option>
              <option value='7'>7</option>
              <option value='8'>8</option>
              <option value='9'>9</option>
              <option value='10'>10</option>
            </select>
          </div>
        </div>
      </div>
    </div>
  ) : null;
};

export default InfoCard;
