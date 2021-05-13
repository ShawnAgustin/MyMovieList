import React from "react";

const Movie = (props) => {
  const { title, posterPath, voteAverage } = props;
  const IMG_URL = "https://image.tmdb.org/t/p/w1280";
  return (
    <div className="Movie">
      {posterPath ? (
        <img src={IMG_URL + posterPath} alt={title} />
      ) : (
        <div className="No-image">
          <p>No image</p>
        </div>
      )}

      <p>{title}</p>
      {voteAverage === 0 ? <p>No rating</p> : <p>{voteAverage}</p>}
    </div>
  );
};

export default Movie;
