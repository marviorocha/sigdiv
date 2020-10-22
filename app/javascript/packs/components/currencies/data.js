import React, { useState, useEffect, Fragment } from "react";
import strftime from "strftime";
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
        <td>
          {strftime("%d/%m/%Y `as %H:%M", new Date(item.attributes.created_at))}
        </td>
        <td>
          {strftime("%d/%m/%Y `as %H:%M", new Date(item.attributes.updated_at))}
        </td>
        <td>
          <a href="#">
            <i title="Cotação" className="fa fa-money fa-2x"></i>
          </a>
        </td>
        <td>
          <a href="">
            <i title="Editar" className="fa fa-edit fa-2x"></i>
          </a>
        </td>
        <td>
          <a href="">
            <i title="Delete" className="fa fa-trash fa-2x"></i>
          </a>
        </td>
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
