import React, { Component } from 'react';
import { BrowserRouter, Link, Route } from 'react-router-dom'
import './App.css'
import LoginForm from './components/LoginForm'

import Auth from './modules/Auth'

class App extends Component {
  constructor() {
    super()
    this.state = {
      auth: Auth.isUserAuthenticated()
    }
  }
  
  handleLoginSubmit = (evt, values) => {
    evt.preventDefault()

    console.log(values)
    fetch('/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      
      body: JSON.stringify(values)
    })
    
    .then(res => res.json())
    .then(res => {
      console.log(res)
    })
  }

  render() {
    console.log(this.state.auth)
    
    return(
      <BrowserRouter>
        <div className="App">
          <h1>Exercises!</h1>
          {this.state.auth ? (
            <p>You are logged in!</p>
          ) : (
            <p>Log in <Link to='/login'>here!</Link></p>
          )}
        </div>

        <Route
          exact
          path='/login'
          render={() => <LoginForm handleLoginSubmit={this.handleLoginSubmit} />}
        />
      </BrowserRouter>
    );
  }
}

export default App;
