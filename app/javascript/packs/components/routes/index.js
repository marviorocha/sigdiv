import React from "react";
import Currencies from "../currencies/index";
import New from "../currencies/new";
import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom";

const Routes = () => {
  return (
    <Router>
      <Switch>
        <Route path="/currencies">
          <Currencies />
        </Route>
    
      </Switch>
    </Router>
  );
};

export default Routes;
