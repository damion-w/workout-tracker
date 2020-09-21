import React, { useState } from 'react'

const LoginForm = ({ handleLoginSubmit }) => {
    const [username, setUsername] = useState('')
    const [password, setPassword] = useState('')

    return (
      <form onSubmit={(evt) => handleLoginSubmit(evt, { username, password })}>
        <input
          type="text"
          name="username"
          placeholder="Username"
          value={username}
          onChange={(evt) => setUsername(evt.target.value)}
        />

        <input
          type="password"
          name="password"
          placeholder="Password"
          value={password}
          onChange={(evt) => setPassword(evt.target.value)}
        />

        <input type='submit' value='Log in' />
      </form>
    )
}

export default LoginForm