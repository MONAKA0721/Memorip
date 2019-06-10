import React, { Component } from 'react'
import PropTypes from 'prop-types'

export default class Link extends Component{
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
      link : 'https://tristagram.herokuapp.com/images/ogp.png?text=' + text
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

Link.defaultProps = {
  text: "",
  link: ""
}

Link.propTypes = {
  text: PropTypes.string
}
