import React, { useState, useEffect } from 'react';
import CloseIcon from '@material-ui/icons/Close';
import axios from 'axios';

const InfoCard = (props) => {
  const { id, setInfo } = props;
  useEffect(() => {
    axios
      .get(
        `https://api.themoviedb.org/3/movie/${id}?api_key=e9085c32cd25783e01c2ae6ef814c537&language=en-U`
      )
      .then((res) => setInfo(res.data));
  }, []);
  return (
    <div className='InfoCard'>
      <CloseIcon />
    </div>
  );
};

export default InfoCard;
