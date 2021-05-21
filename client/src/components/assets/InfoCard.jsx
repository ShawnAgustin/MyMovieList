import React, { useState, useEffect } from 'react';
import CloseIcon from '@material-ui/icons/Close';

import axios from 'axios';

const InfoCard = (props) => {
  const { id, trigger, setTrigger } = props;
  const IMG_URL = 'https://image.tmdb.org/t/p/w1280';

  const [data, setData] = useState({});
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
        <div className='status'>
          <h3>Status:</h3> <h3>Rating:</h3>
        </div>
      </div>
    </div>
  ) : null;
};

export default InfoCard;
