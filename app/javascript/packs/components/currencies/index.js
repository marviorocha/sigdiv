import React from "react";
import Form from "./_form";
import Data from "./data";
import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom";

const Currencies = () => {
  return <div className="row">{<Data />}</div>;
};

export default Currencies;
