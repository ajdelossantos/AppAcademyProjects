import React from 'react';

class Tabs extends React.Component {

  constructor (props) {
    super(props);
    this.state = { index: 0 };
    this.selectTab = this.selectTab.bind(this);
  }

  selectTab(num) {
    this.setState({ index: num });
  }

  render () {
    let selectedPane = this.props.files[this.state.index]; // is an array, takes brackets
    let allPanes = this.props.files;

    return (
    <div>
      <ul>
      {allPanes.map(
        (el, idx) => (<li key={ idx }><h3>{ el.title }</h3></li>)
      )}
      </ul>
        <article>{ selectedPane.content }</article>

    </div>
    );
  }

}

export default Tabs;
