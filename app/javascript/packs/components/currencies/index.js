import React, { useState, useEffect, Fragment } from "react";
import ReactDOM from "react-dom";
import axios from "axios";

const Currencies = () => {
  const [currencie, setCurrencie] = useState([]);
  const [bndes, setBndes] = useState([]);
  const [count, setCount] = useState(0);
  const token = "95e1a099-ced5-3b11-b6c4-7766151c9ac6";

  // Get List Currencies
  useEffect(() => {
    axios
      .get("/api/v1/currencies.json")
      .then((response) => {
        setCurrencie(response.data.data);
      })
      .catch((error) => {
        console.log(error);
      });
  }, [currencie.length]);

  useEffect(() => {
   
  }, [bndes.length]);

  const bndes_list = bndes.slice(0, 1).map((item) => {
    return <td key={item.data}>{item.valor}</td>;
  });
  console.log(count);

  
  useEffect(() => {

    axios
    .get(
      `https://apis-gateway.bndes.gov.br/moedascontratuais/v1/servicoListaCotacoes?sigla=CAN$&dataInicio=${Date.now()}`,
      { headers: { Authorization: `Bearer ${token}` } }
    )
    .then((response) => {
      setBndes(response.data.listaCotacaoMoeda);
    })
    .catch((error) => {
      console.log(error);
    });
    
    const intervalId = setInterval(() => {
      setCount((prevCount) => prevCount + 1);
    }, 10000);
    return () => clearInterval(intervalId);
   
    axios.put(`api/v1/currencies/${count}`, {
      name: Math.random(bndes),
      formula: "[BT0915]",
      description: "Atualizando description",
      last_currency: "20000",
      date_currency: "2020-11-16"
    }).catch((error) => {
      console.log(error);
    });
    
    
    
 
  
  },[]);

  

  const currencie_list = currencie.map((item) => {
    const edit_item = "/currencies/" + item.attributes.id + "/edit";
    const delete_item = "/currencies/" + item.attributes.id;

    return (
      <Fragment>
        <tr key={item.attributes.id.toString()}>
          <td id="name">{item.attributes.name}</td>
          <td>{item.attributes.formula}</td>
          <td>{item.attributes.description}</td>
          <td>{item.attributes.last_currency}</td>
          <td>{item.attributes.date_currency}</td>

          <td>
            <a
              data-toggle="modal"
              data-target="#openModal"
              data-remote="true"
              href={edit_item}
            >
              <i title="Mostrar" className="fa fa-money fa-2x"></i>
            </a>
          </td>
          <td>
            <a
              data-toggle="modal"
              data-target="#openModal"
              data-remote="true"
              href={edit_item}
            >
              <i title="Editar" className="fa fa-edit fa-2x"></i>
            </a>
          </td>
          <td>
            <a
              data-confirm="Você tem certeza que deseja excluir esse item?"
              data-toggle="modal"
              data-target="#openModal"
              data-remote="true"
              data-method="delete"
              href={delete_item}
            >
              <i title="Excluir" className="fa fa-trash fa-2x"></i>
            </a>
          </td>
        </tr>
      </Fragment>
    );
  });

  return <Fragment>{currencie_list}</Fragment>;
};

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Currencies />, document.getElementById("currencies"));
});
