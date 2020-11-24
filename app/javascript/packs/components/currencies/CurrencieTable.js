import React, { Fragment } from "react";
import dayjs from "dayjs";

const CurrencieTable = (props) => {
  const edit_item = "/currencies/" + props.currencies.id + "/edit";
  const delete_item = "/currencies/" + props.currencies.id;

   

  return (
    <Fragment>
      <tr>
        <td>{props.currencies.name} </td>
        <td>{props.currencies.formula}</td>
        <td>{props.currencies.description}</td>
        <td>{props.currencies.last_currency}</td>
        <td>
          {props.currencies.date_currency
            ? dayjs(props.currencies.date_currency).format("DD/MM/YYYY")
            : ""}
        </td>
        <td>
          <a
            data-toggle="modal"
            data-target="#openModal"
            data-remote="true"
            data-tooltip="tooltip"
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
};

export default CurrencieTable;
