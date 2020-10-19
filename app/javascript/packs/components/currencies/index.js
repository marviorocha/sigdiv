import React from "react";
import Form from "./form";

const Currencies = () => {
  return (
    <div className="row">
      <div className="col-auto">
        <div className="card-columns">
          <div className="card bg-default">
            <div className="card-header bolder">Cotação</div>
            <div className="card-body">
              <div className="card-text">{<Form />}</div>
              <div className="card-text">
                <p></p>
                <h5>Dólar Comercial +0,32% R$ 5,6430</h5>
                <button type="submit" className="btn btn-success">
                  Salvar Cotação
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Currencies;
