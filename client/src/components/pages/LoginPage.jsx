import React, { useState, useEffect } from 'react';
import axios from 'axios';

const LoginPage = () => {
  const [username, setUsername] = useState('');
  const [planToWatch, setPlanToWatch] = useState([
    { title: 'movie', rating: 5 },
    { title: 'movie2', rating: 10 },
  ]);

  const user = {
    username,
    planToWatch,
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    axios
      .post('http://localhost:5000/users/add', user)
      .then((res) => console.log(res.data));
    console.log(user);
  };

  return (
    <div>
      <p>Login</p>
      <form onSubmit={handleSubmit}>
        <input
          type='text'
          placeholder='Enter username'
          value={username}
          onChange={(e) => {
            setUsername(e.target.value);
          }}
        />
        <button type='submit'>Submit</button>
      </form>
    </div>
  );
};

export default LoginPage;
