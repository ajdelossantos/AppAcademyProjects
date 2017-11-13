import React from 'react';

class Tabs extends React.Component {

  constructor (props) {
    super(props);
    this.state = { index: 0 };
  }

  render () {
    let stuff = this.props.files;

    return (
    <div>
      <ul>
      {stuff.map(
        (el, idx) => (<li key={ idx }><h3>{ el.title }</h3></li>)
      )}
      </ul>
      {stuff.map(
        (el, idx) => (<article>{ el.content }</article>)
      )}
    </div>
    );
  }

}

export default Tabs;
