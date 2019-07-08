import React, { Component } from 'react'
import PropTypes from 'prop-types'

export default class MapLink extends Component{
  constructor(props){
    super(props)

    this.state = {
      text : props.text,
      link : props.link
    }
  }

  generate = (text) => {
    this.setState({
      text: text,
      link : 'https://tristagram.herokuapp.com/maps/index?markerData=' + text
    })
  }

  render(){
    return(
      <div id='linkGenerator'>
          <label className='mx-auto'>タイトルを入力してください
            <input
              onChange={event =>
                        this.generate(event.target.value)}
              value={this.state.text}
              id='inputForm'/>
          </label>
        <br/>
        <a href={this.state.link} className='mx-auto createButton'>Go!</a>

      </div>
    )
  }
}

MapLink.defaultProps = {
  text: "",
  link: ""
}

MapLink.propTypes = {
  text: PropTypes.string
}
