import React, { useState, useEffect, Fragment } from "react";
import CurrencieTable from "./CurrencieTable";
import ReactDOM from "react-dom";
import axios from "axios";
import dayjs from "dayjs";

const Currencies = () => {
  const [currencie, setCurrencie] = useState([]);
  const [bndes, setBndes] = useState([]);
  const [load, setLoad] = useState(true);
  const token = "95e1a099-ced5-3b11-b6c4-7766151c9ac6";

  // Get All Currencie from API
  async function CurrencieAll() {
    let response = await axios.get("/api/v1/currencies.json");
    setCurrencie(response.data.data);
  }

  useEffect(() => {
   
    
      setLoad(false);
      CurrencieAll();
 
   
  }, [currencie.length]);

  const currenciesPages = currencie.map((item) => {
    const dataStarted = dayjs(Date.now()).format("YYYYMMDD");

    axios
      .get(
        `https://apis-gateway.bndes.gov.br/moedascontratuais/v1/servicoListaCotacoes?serie=${item.attributes.code}&dataInicio=${dataStarted}&dataFim=${dataStarted}&limite=1`,
        { headers: { Authorization: `Bearer ${token}` } }
      )
      .then((response) => {
        axios
          .put(`api/v1/currencies/${item.attributes.id}`, {
            last_currency:
              item.attributes.code == ""
                ? item.attributes.last_currency
                : response.data.listaCotacaoMoeda[0]["valor"],
            date_currency: response.data.listaCotacaoMoeda[0]["data"],
          })
          .catch((error) => {
            console.log(error);
          });
      });

    return (
      <CurrencieTable key={item.attributes.id} currencies={item.attributes} />
    );
  });
  const spinnel = (
    <tr className="center table-default">
      <td>
        <i className="fa fa-spinner fa-pulse fa-3x fa-fw"></i>
      </td>
    </tr>
  );

  return <Fragment>{load ? spinnel : currenciesPages}</Fragment>;
};

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Currencies />, document.getElementById("currencies"));
});
