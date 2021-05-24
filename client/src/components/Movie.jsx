import React, { useState } from 'react';

import MoreHorizIcon from '@material-ui/icons/MoreHoriz';

import InfoCard from './InfoCard';

const Movie = (props) => {
  const { id, title, posterPath, voteAverage } = props;
  const IMG_URL = 'https://image.tmdb.org/t/p/w1280';

  const [opened, setOpened] = useState(false);

  // const handleKeyPress = (e) => {
  //   if (e.key === 'Enter') {
  //     setTrigger(false);
  //   }
  // };

  return (
    <>
      <div className='Movie'>
        <div className='image'>
          {posterPath ? (
            <img src={IMG_URL + posterPath} alt={title} />
          ) : (
            <div className='No-image'>
              <p>No image</p>
            </div>
          )}
        </div>
        <div className='info'>
          <h4>{title}</h4>
          {voteAverage === 0 ? (
            <p>No rating</p>
          ) : (
            <p>
              {voteAverage}
              <MoreHorizIcon
                style={{
                  float: 'right',
                  position: 'relative',
                  margin: 'auto',
                  cursor: 'pointer',
                }}
                onClick={() => setOpened(true)}
              />
            </p>
          )}
        </div>
      </div>
      {opened ? (
        <div
          className='backfilter'
          // onClick={() => setTrigger(false)}
          // onKeyPress={() => handleKeyPress}
          // role='button'
          // tabIndex={0}
        >
          <InfoCard id={id} opened={opened} setOpened={setOpened} />
        </div>
      ) : null}
    </>
  );
};

export default Movie;
