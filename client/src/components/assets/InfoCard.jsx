import React, { useState, useEffect } from 'react';
import CloseIcon from '@material-ui/icons/Close';
import AddBoxIcon from '@material-ui/icons/AddBoxOutlined';

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
      <CloseIcon
        onClick={() => setTrigger(false)}
        style={{
          cursor: 'pointer',
          float: 'right',
          right: '10',
          top: '5',
          position: 'absolute',
        }}
      />
      {data.poster_path ? (
        <img src={IMG_URL + data.poster_path} alt={data.title} />
      ) : (
        <div className='No-image'>
          <p>No image</p>
        </div>
      )}
      <div className='content'>
        <h1>{data.title}</h1>
        <br />
        {data.vote_average}
        <br />
        <p>{data.overview}</p>
        <AddBoxIcon
          style={{ margin: 'auto', bottom: 10, position: 'absolute' }}
        />
      </div>
    </div>
  ) : null;
};

export default InfoCard;
