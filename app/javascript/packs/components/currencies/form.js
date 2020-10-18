import React from "react";
import DolarApi from "./DolarApi.js";
const Form = () => {
  return (
    <div>
      <div className="col-auto my-1">
        <label className="mr-sm-2" htmlFor="inlineFormCustomSelect">
          De:
        </label>
        <select className="custom-select mr-sm-2" id="inlineFormCustomSelect">
          <option defaultValue>moeda...</option>
          <option value="1">USD</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
        </select>
      </div>
      <div className="col-auto my-1">
        <label className="mr-sm-2" htmlFor="inlineFormCustomSelect">
          Para:
        </label>
        <select className="custom-select mr-sm-2" id="inlineFormCustomSelect">
          <option defaultValue>moeda...</option>
          <option value="1">USD</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
        </select>
      </div>
      <div className="col-auto my-1">
        <button type="submit" className="btn btn-success">
          Salvar
        </button>
      </div>
      {<DolarApi />}
    </div>
  );
};

export default Form;
