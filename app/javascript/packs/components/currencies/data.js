import React, { useState, useEffect, Fragment } from "react";
import axios from "axios";
const Data = (propos) => {
  const [currency, setCurrency] = useState([]);

  useEffect(() => {
    axios
      .get("/api/v1/currencies.json")
      .then((response) => {
        setCurrency(response.data.data);
      })
      .catch((response) => console.log(response));
  }, [currency.length]);

  const list = currency.map((item) => {
    return (
      <tr key={item.attributes.name}>
        <td>{item.attributes.name}</td>
        <td> {item.attributes.formula}</td>
        <td> {item.attributes.descricao}</td>
        <td> Last Cotação </td>
        <td>Cotação</td>
        <td>Editar</td>
        <td>Excluír</td>
      </tr>
    );
  });

  return (
    <Fragment>
      <table className="table table-striped table-hover">
        <thead>
          <tr>
            <th>Nome</th>
            <th>Fórmula</th>
            <th>Descrição</th>
            <th>Última cotação</th>
            <th>Data da cotação</th>
            <th colSpan="3"></th>
          </tr>
        </thead>
        <tbody>{list}</tbody>
      </table>
    </Fragment>
  );
};

export default Data;
