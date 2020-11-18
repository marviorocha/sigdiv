import React, { useState, useEffect, Fragment } from "react";
import ReactDOM from "react-dom";
import axios from "axios";
import dayjs from "dayjs";
$('[data-toggle="tooltip"]').tooltip();
const Currencies = () => {
  const [currencie, setCurrencie] = useState([]);
  const [bndes, setBndes] = useState([]);
  const [load, setLoad] = useState(true);
  
  const token = "95e1a099-ced5-3b11-b6c4-7766151c9ac6";

  useEffect(() => {
     
    const started = setInterval(() => {
      setLoad(false)
      axios
        .get("/api/v1/currencies.json")
        .then((response) => {
          setCurrencie(response.data.data);
        })
        .catch((error) => {
          console.log(error);
        })
    }, 1000);

  return () => {clearInterval(started)} 

  }, [currencie.length]);

 
 
 
    const currenciesPages = currencie.map((item) => {
      const edit_item = "/currencies/" + item.attributes.id + "/edit";
      const delete_item = "/currencies/" + item.attributes.id;
      const dataStarted = dayjs(item.attributes.date_currency).format('YYYYMMDD') 

      axios
      .get(
        `https://apis-gateway.bndes.gov.br/moedascontratuais/v1/servicoListaCotacoes?serie=${item.attributes.code}&dataInicio=${dataStarted}&dataFim=${dataStarted}&limite=1`,
        { headers: { Authorization: `Bearer ${token}` } }
      )
        .then((response) => {
 
          axios.patch(`api/v1/currencies/${item.attributes.id}`, {
          
          last_currency: response.data.listaCotacaoMoeda[0]["valor"],
          date_currency: item.attributes.date_currency,
        })
        .catch((error) => {
          console.log(error);
        });

      })
      .catch((error) => {
        console.log(error);
      })

      return (
        <Fragment>
          <tr key={item.attributes.id}>
            <td>{item.attributes.name}</td>
            <td>{item.attributes.formula}</td>
            <td>{item.attributes.description}</td>
            <td>{item.attributes.last_currency}</td>
            <td>
              { item.attributes.date_currency ?  dayjs(item.attributes.date_currency).format('DD/MM/YYYY') : '' }
            </td>

            <td>
              <a
                data-toggle="modal"
                data-target="#openModal"
                data-remote="true"
                href={delete_item}
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
                <i data-toggle="tooltip" title="Editar" className="fa fa-edit fa-2x"></i>
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
    const spinnel =  <i className="fa fa-spinner fa-pulse fa-3x fa-fw"></i> 
    return <Fragment>{load ? spinnel : currenciesPages }</Fragment>;
};

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Currencies />, document.getElementById("currencies"));
});
