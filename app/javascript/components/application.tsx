import * as React from "react";
import * as ReactDOM from "react-dom";

interface AppProps {
  arg: string;
}

const App = ({ arg }: AppProps) => {
  return <div>{`OH, hello, ${arg}!`}</div>;
};

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  ReactDOM.render(<App arg="React" />, rootEl);
});
