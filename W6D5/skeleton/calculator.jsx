import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);

    this.state = {
      num1: "",
      num2: "",
      result: 0
    };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this)
    this.performOperation = this.performOperation.bind(this)
    this.clearInput = this.clearInput.bind(this)
    this.setNum = this.setNum.bind(this)
  }

  setNum(inputField) {
    let self = this;

    return (e) => {
      const number = e.currentTarget.value
      if(isNaN(number)){
        self.numError(number)
      } else {
        self.setState({
          currentError: "",
          [inputField]: e.currentTarget.value
        })
      }
    }
  }

  performOperation(operation){
    return (e) => {
      e.preventDefault();
      const op = this.state.num1 + operation + this.state.num2;
      this.setState({
        result: eval(op)
      })
    }
  }

  clearInput(){
    this.setState({
      num1: "",
      num2: "",
      result: 0,
      currentError: ""
    })
  }

  numError(inp){
    this.setState({
      currentError:`${inp} is not a number`
    })
  }

  render(){
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum("num1")} value={this.state.num1}></input>
        <input onChange={this.setNum("num2")} value={this.state.num2}></input>
        <br />
        <button onClick={this.performOperation("+")}>+</button>
        <button onClick={this.performOperation("-")}>-</button>
        <button onClick={this.performOperation("*")}>*</button>
        <button onClick={this.performOperation("/")}>/</button>
        <br/>
        <br/>
        <button onClick={this.clearInput}>CLEAR</button>
        <h1>{this.state.currentError}</h1>
      </div>
    );
  }
}

export default Calculator;
