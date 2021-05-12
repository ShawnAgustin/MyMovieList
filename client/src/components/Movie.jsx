import React from 'react';

const Movie = (props) => {
    const {title, poster_path, vote_average} = props;
    const IMG_URL = "https://image.tmdb.org/t/p/w1280";
    return(
        <div className="Movie">
        <img src={IMG_URL + poster_path} alt={title}/>
        <p>{title}</p>
        <p>{vote_average}</p>
        </div>
    )
}
    

export default Movie;