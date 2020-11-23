import React from "react";
import dayjs from "dayjs";
const CurrencieUpdate = (props) => {
  const dataStarted = dayjs(props.currencies.date_currency).format("YYYYMMDD");

  axios
    .get(
      `https://apis-gateway.bndes.gov.br/moedascontratuais/v1/servicoListaCotacoes?serie=${props.currencies.code}&dataInicio=${dataStarted}&dataFim=${dataStarted}&limite=1`,
      { headers: { Authorization: `Bearer ${token}` } }
    )
    .then((response) => {
      console.log(response);
      axios
        .patch(`api/v1/currencies/${props.currencies.id}`, {
          last_currency: response.data.listaCotacaoMoeda[0]["valor"],
          date_currency: props.currencies.date_currency,
        })
        .catch((error) => {
          console.log(error);
        });
    })
    .catch((error) => {
      console.log(error);
    });
};

export default CurrencieUpdate;
