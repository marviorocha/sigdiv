import React, { useState, useEffect, Fragment } from "react";
import axios from "axios";
const Form = (propos) => {
  // const [currency, setCurrency] = useState([]);

  // useEffect(()=> {
  //   axios.get('/api/v1/currencies.json').then( response => {
  //     setCurrency(response.data.data);
  //   }).catch(response => console.log(response))
  // },[currency.length])

 
  return (
    <Fragment>
       
    <div className="row">
      <div className="col">
       
        <label className="mr-sm-2 " htmlFor="inlineFormCustomSelect">
          Nome: <i className="fa fa-refresh spiner fa-1x"></i>
        </label>
        <select
          className="custom-select mr-sm-2  form-control"
          id="inlineFormCustomSelect"
        >
          <option defaultValue>moeda...</option>
            
          <option value="1">USD</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
        </select>
      </div>
      
      {/* <div className="col">
        <label className="mr-sm-2" htmlFor="inlineFormCustomSelect">
          Para:
        </label>
        <select
          className="custom-select mr-sm-2  form-control"
          id="inlineFormCustomSelect"
        >
          <option defaultValue>moeda...</option>
          <option value="1">USD</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
        </select>
      </div> */}
    </div>
    </Fragment>
  );
};

export default Form;
