import React from "react";

const DolarApi = () => {
  (async () => {
    const res = await fetch(`https://economia.awesomeapi.com.br/json/all`);
    const json = await res.json();
    console.log(json);
    console.log("Hello!");
  })();

  return <div></div>;
};

export default DolarApi;
