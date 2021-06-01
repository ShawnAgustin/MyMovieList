import React, { useState, useEffect } from 'react';
import axios from 'axios';

const LoginPage = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const user = {
    username,
    password,
  };

  const handleLogin = (e) => {
    e.preventDefault();
    axios
      .post('http://localhost:5000/users/login', user)
      .then((res) => console.log(res.data));
    console.log(user);
  };

  const handleRegister = (e) => {
    e.preventDefault();
    axios
      .post('http://localhost:5000/users/register', user)
      .then((res) => console.log(res.data));
    console.log(user);
  };

  return (
    <div>
      <p>Login</p>
      <form>
        <input
          type='text'
          placeholder='Enter username'
          value={username}
          onChange={(e) => {
            setUsername(e.target.value);
          }}
        />
        <input
          type='password'
          minLength='5'
          placeholder='password'
          value={password}
          onChange={(e) => {
            setPassword(e.target.value);
          }}
        />
        <button type='submit' onClick={handleRegister}>
          Register
        </button>
        <button type='submit' onClick={handleLogin}>
          Login
        </button>
      </form>
    </div>
  );
};

export default LoginPage;
