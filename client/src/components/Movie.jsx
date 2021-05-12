import React from 'react';

const Movie = (props) => {
    const {title, poster_path, vote_average} = props;
    const IMG_URL = "https://image.tmdb.org/t/p/w1280";
    return(
        <div className="Movie">
        {poster_path ?
        <img src={IMG_URL + poster_path} alt={title}/> :
        <div className='No-image'>
            <p>No image</p>
        </div>
        }
        
        <p>{title}</p>
        {vote_average === 0 ? <p>No rating</p> :
            <p>{vote_average}</p>
        }
        
        </div>
    )
}
    

export default Movie;