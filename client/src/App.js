import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  state = {
    users: []
  };

  componentWillMount() {
    fetch('/api/users')
      .then(check)
      .then(parse)
      .then(data => {
        this.setState({users: data});
      });

    function check(response) {
      if (response.ok) {
        return response;
      }
      const error = new Error(`HTTP Error ${response.statusText}`);
      error.status = response.statusText;
      error.response = response;
      throw error;
    }

    function parse(response) {
      return response.json();
    }
  }

  render() {

    const userList = this.state.users.map(item => {
      return <li>{item.display_name} - {item.rating}</li>;
    });

    return (
      <div className="App">
        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h2>Welcome to React</h2>
        </div>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
        <ul>{userList}</ul>
      </div>
    );
  }

}

export default App;
