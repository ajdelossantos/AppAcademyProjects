class Clock {
  constructor() {
    // 1. Create a Date object.
    const sysTime = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = sysTime.getHours();
    this.minutes = sysTime.getMinutes();
    this.seconds = sysTime.getSeconds();
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {

    function zeroPadding(n) {
      if (n < 10) {
        return `0${n}`;
      } else {
        return `${n}`;
      }
    }

    console.log(`${zeroPadding(this.hours)}:${zeroPadding(this.minutes)}:${zeroPadding(this.seconds)}`);
    // Format the time in HH:MM:SS
    // Use console.log to print it.
  }

  _tick() {
    // 1. Increment the time by one second.
    this.seconds++;
    if (this.seconds === 60) {
      this.seconds = 0;
      this.minutes++;
    }

    if (this.minutes === 60) {
      this.minutes = 0;
      this.hours++;
    }

    if (this.hours === 24) {
      this.hours = 0;
    }
    // 2. Call printTime.
    this.printTime();
  }
}

const clock = new Clock();
