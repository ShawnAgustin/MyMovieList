import React from 'react';

const MiniMovie = (props) => {
  const { title, posterPath, voteAverage, userScore = null } = props;
  const IMG_URL = 'https://image.tmdb.org/t/p/w1280';
  return (
    <div className='MiniMovie'>
      <div className='content'>
        {posterPath ? (
          <img src={IMG_URL + posterPath} alt={title} />
        ) : (
          <div className='No-image'>
            <></>
          </div>
        )}

        <h4>{title}</h4>
        {voteAverage === 0 ? (
          <>
            <p>No rating</p>
            <p>
              My Score: <b>{userScore}</b>
            </p>
          </>
        ) : (
          <div className='Mini-ratings'>
            {userScore !== null ? (
              <p>
                My Score: <b>{userScore}</b>
              </p>
            ) : null}

            <p>
              Rating: <b>{voteAverage}</b>
            </p>
          </div>
        )}
      </div>
    </div>
  );
};

export default MiniMovie;
