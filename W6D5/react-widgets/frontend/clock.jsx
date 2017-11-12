import React from 'react';

class Clock extends React.Component {

  constructor() {
    super();
    this.state = {
      time: new Date()
    };
    this.tick = this.tick.bind(this);
    //IDEA these are automatically called!

    // this.componentDidMount();
    // this.componentWillUnmount();
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
    const hours = this.state.time.getHours();
    const minutes = this.state.time.getMinutes();
    const seconds = this.state.time.getSeconds();

    const pad = (time) => {
      return time < 10 ? "0".concat(time) : time;
    };

    const hoursTwelve = (hrs) => {
      if (hrs === 0) {
        return 12;
      } else if (hrs > 12) {
        return hrs % 12;
      } else {
        return hrs;
      }
    };

    const meridian = hours > 11 ? "PM" : "AM";
    return (
      <div>
        <label htmlFor="clock"><h2>Clock!</h2>
          <div id="clock" className="clock">
            <ul>
              <div>
                <li>Time: </li>
                <li>Date: </li>
              </div>
              <div>
                <li>{hoursTwelve(hours)}:{pad(minutes)} {pad(seconds)} {meridian}</li>
                <li>{this.state.time.toDateString()}</li>
              </div>
            </ul>
          </div>
        </label>
      </div>
    );
  }
}

export default Clock;
