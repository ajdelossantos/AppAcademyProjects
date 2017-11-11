import React from 'react';

class Clock extends React.Component {

  constructor() {
    super();
    this.state = {
      time: new Date()
    };
    this.tick = this.tick.bind(this);
    this.componentDidMount();
    this.componentWillUnmount();
  }

  tick () {
    this.setState({time: new Date()});
  }

  componentDidMount () {
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount () {
    clearInterval(this.intervalId);
  }

  render () {
    return (
      <div>
        <h1>Clock!</h1>
        <p>{this.state.time.toString()}</p>
      </div>
    );
  }
}

export default Clock;
