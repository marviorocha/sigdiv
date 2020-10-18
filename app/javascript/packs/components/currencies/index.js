import React from "react";
import Form from "./form";

const Currencies = () => {
  return (
    <div>
      <div className="card-columns">
        <div className="card bg-default">
          <div className="card-header">Cotação</div>
          <div className="card-body">
            <div className="card-text">{<Form />}</div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Currencies;
