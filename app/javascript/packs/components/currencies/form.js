import React, { useState, useEffect } from "react";
import axios from "axios";
const Form = (propos) => {


  const [corrency, setCorrency] = useState([]);
  
  useEffect(()=>{
    axios.get('/api/v1/currencies/')
    .then( (resp) => {
      // handle success
      console.log(resp);
    })
  }, [corrency])

  return (
    <div className="row">
      <div className="col">
        <label className="mr-sm-2 " htmlFor="inlineFormCustomSelect">
          De:
        </label>
        <select className="custom-select mr-sm-2  form-control" id="inlineFormCustomSelect">
          <option defaultValue>moeda...</option>
          <option value="1">USD</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
        </select>
      </div>
      <i className="fa fa-refresh  fa-1x"></i> 
      <div className="col">
        <label className="mr-sm-2" htmlFor="inlineFormCustomSelect">
        Para:
        </label>
        <select className="custom-select mr-sm-2  form-control" id="inlineFormCustomSelect">
          <option defaultValue>moeda...</option>
          <option value="1">USD</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
        </select>
      </div>
 
    </div>
  );
};

export default Form;
